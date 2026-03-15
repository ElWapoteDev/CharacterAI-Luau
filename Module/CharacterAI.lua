-- CharacterAI.lua
-- Unofficial Luau wrapper for the Character.AI API.
-- Designed for Roblox executor environments (Synapse X, etc.).
-- https://github.com/ElWapoteDev/CharacterAI-Luau

local HttpService = game:GetService("HttpService")
local fetch = (syn and syn.request) or request

-- ---------------------------------------------------------------------------
-- Constants
-- ---------------------------------------------------------------------------

local BASE_URL    = "https://beta.character.ai"
local CACHE_DIR   = "CharacterAi/"

local NO_BODY_METHODS: { [string]: boolean } = {
	GET     = true,
	HEAD    = true,
	DELETE  = true,
	OPTIONS = true,
	TRACE   = true,
}

-- ---------------------------------------------------------------------------
-- Private helpers  (module-scope, not exposed)
-- ---------------------------------------------------------------------------

local function MakeStatus(success: boolean, body: any): { Status: boolean, Body: any }
	return { Status = success, Body = body }
end

local function Assert(condition: any, message: string)
	if not condition then
		warn("[CharacterAI] " .. message)
	end
	assert(condition, "[CharacterAI] " .. message)
end

-- Formats a large interaction count into a human-readable string (e.g. "12k", "3m").
local function FormatCount(n: number): string
	n = tonumber(n) or 0
	if n >= 1_000_000 then
		return math.floor(n / 1_000_000) .. "m"
	elseif n >= 1_000 then
		return math.floor(n / 1_000) .. "k"
	end
	return tostring(n)
end

-- Character.AI's streaming endpoint returns multiple JSON objects concatenated.
-- This extracts the last (most complete) one.
local function ExtractLastJSON(raw: string): string
	local last = raw:match("%b{}")
	for block in raw:gmatch("%b{}") do
		last = block
	end
	return last
end

-- ---------------------------------------------------------------------------
-- Module definition
-- ---------------------------------------------------------------------------

local CharacterAI = {}
CharacterAI.__index = CharacterAI
CharacterAI.Version = "2.0"

-- ---------------------------------------------------------------------------
-- Constructor
-- ---------------------------------------------------------------------------

--[[
	CharacterAI.new(token?)

	Creates a new CharacterAI session.

	@param token  string | nil   Your Character.AI auth token.
	                              Omit or pass nil/empty to connect as a guest
	                              (limited functionality).
	@returns CharacterAI instance
]]
function CharacterAI.new(token: string?): typeof(setmetatable({}, CharacterAI))
	local self = setmetatable({}, CharacterAI)

	self._token    = nil :: string?
	self._sessions = {} :: { [string]: { [string]: { historyId: string, botUsername: string } } }
	self.IsGuest   = false

	if not token or token == "" then
		warn("[CharacterAI] No token provided — connecting as guest with limited functionality.")

		local result = self:_AuthenticateAsGuest()
		Assert(result.Status, "Guest authentication failed: " .. tostring(result.Body))

		self._token  = result.Body
		self.IsGuest = true
	else
		self._token = token

		local result = self:_VerifyToken()
		Assert(result.Status, "Token validation failed — the token may be invalid or expired.")
	end

	print(string.format(
		"[CharacterAI] v%s initialised  |  guest: %s",
		CharacterAI.Version,
		tostring(self.IsGuest)
	))

	return self
end

-- ---------------------------------------------------------------------------
-- Private: authentication
-- ---------------------------------------------------------------------------

function CharacterAI:_AuthenticateAsGuest()
	local uuid = HttpService:GenerateGUID()
	return self:_Request(BASE_URL .. "/chat/auth/lazy/", "POST", { lazy_uuid = uuid })
end

function CharacterAI:_VerifyToken()
	return self:_Request(BASE_URL .. "/chat/characters/recent/", "GET")
end

-- ---------------------------------------------------------------------------
-- Private: HTTP layer
-- ---------------------------------------------------------------------------

function CharacterAI:_GetHeaders(): { [string]: string }
	local headers = {
		["content-type"] = "application/json",
		["accept"]       = "application/json, text/plain, */*",
	}
	if self._token then
		headers["authorization"] = "Token " .. self._token
	end
	return headers
end

--[[
	Performs an HTTP request and returns a MakeStatus-wrapped result.

	On success the Body contains the decoded JSON table.
	On failure the Body contains a descriptive error string.
]]
function CharacterAI:_Request(url: string, method: string, body: any?)
	Assert(url,    "Request URL is required.")
	Assert(method, "Request method is required.")

	if not NO_BODY_METHODS[method] and body == nil then
		Assert(false, "Method '" .. method .. "' requires a request body.")
	end

	local options = {
		Url     = url,
		Method  = method,
		Headers = self:_GetHeaders(),
	}

	if body ~= nil then
		options.Body = HttpService:JSONEncode(body)
	end

	local ok, response = pcall(fetch, options)

	if not ok then
		return MakeStatus(false, "Network error: " .. tostring(response))
	end

	if response.StatusCode ~= 200 then
		local detail = string.format(
			"HTTP %d %s%s",
			response.StatusCode,
			tostring(response.StatusMessage),
			response.Body and (" — " .. response.Body) or ""
		)
		return MakeStatus(false, detail)
	end

	-- Empty body: return the raw response object (e.g. for auth endpoints).
	if not response.Body or response.Body == "" then
		return MakeStatus(true, response)
	end

	local jsonString = ExtractLastJSON(response.Body)
	local decoded    = HttpService:JSONDecode(jsonString)
	return MakeStatus(true, decoded)
end

-- ---------------------------------------------------------------------------
-- Private: character helpers
-- ---------------------------------------------------------------------------

-- Wraps a flat list of character tables in a MakeStatus result and attaches
-- methods to each character.  Avoids copy-pasting the same setmetatable block
-- across every list-returning function.
function CharacterAI:_WrapList(list: { any })
	for i, char in ipairs(list) do
		list[i] = self:_AttachCharacterMethods(char)
	end
	return MakeStatus(true, list)
end

-- Attaches all character-level methods onto the raw character data table.
function CharacterAI:_AttachCharacterMethods(char: { [string]: any })
	local module = self

	function char:GetName(): string
		return self.participant__name or ""
	end

	function char:GetCreatorName(): string
		return self.user__username or ""
	end

	-- Returns the best available short description for the character.
	function char:GetDescription(): string
		for _, field in ipairs({ "title", "greeting", "participant__name" }) do
			local value = self[field]
			if value and value ~= "" then
				return value
			end
		end
		return ""
	end

	-- Returns the interaction count.
	-- Pass `formatted = true` to get a human-readable string ("12k", "3m").
	function char:GetInteractions(formatted: boolean?): number | string
		local n = self.participant__num_interactions or 0
		return formatted and FormatCount(n) or n
	end

	-- Downloads and caches the character avatar, returning an asset path.
	function char:GetImage()
		if not self.participant__name or not self.avatar_file_name then
			return MakeStatus(false, "Character is missing required image fields.")
		end

		local getAsset  = getsynasset or getcustomasset
		local safeKey   = (self.participant__name .. "/" .. self.user__username):gsub("%p", "")
		local filePath  = CACHE_DIR .. safeKey .. ".png"

		if isfile(filePath) then
			return MakeStatus(true, getAsset(filePath))
		end

		local imageUrl = "https://characterai.io/i/400/static/avatars/" .. self.avatar_file_name
		local ok, data = pcall(game.HttpGet, game, imageUrl)
		if not ok then
			return MakeStatus(false, "Failed to download character image.")
		end

		if not isfolder("CharacterAi") then
			makefolder("CharacterAi")
		end

		writefile(filePath, data)
		return MakeStatus(true, getAsset(filePath))
	end

	-- Starts a new chat history for this character and binds it to `sessionKey`.
	-- Multiple sessions per character are supported simultaneously.
	function char:NewChat(sessionKey: string)
		Assert(sessionKey and sessionKey ~= "", "A non-empty session key is required.")

		local result = module:_CreateChatHistory(self.external_id)
		if not result.Status then
			return result
		end

		local sessions = module._sessions
		if not sessions[self.external_id] then
			sessions[self.external_id] = {}
		end

		local botUsername: string? = nil
		for _, participant in ipairs(result.Body.participants or {}) do
			if not participant.is_human then
				botUsername = participant.user.username
				break
			end
		end

		if not botUsername then
			return MakeStatus(false, "No AI participant found in this conversation.")
		end

		sessions[self.external_id][sessionKey] = {
			historyId   = result.Body.external_id,
			botUsername = botUsername,
		}

		return result
	end

	-- Removes a chat session from memory.  Returns true on success, false if
	-- the session did not exist.
	function char:DeleteChat(sessionKey: string): boolean
		Assert(sessionKey and sessionKey ~= "", "A non-empty session key is required.")

		local charSessions = module._sessions[self.external_id]
		if not charSessions or not charSessions[sessionKey] then
			return false
		end

		charSessions[sessionKey] = nil
		return true
	end

	-- Sends a message to this character under the given session.
	-- Automatically initialises a new chat if the session does not yet exist.
	function char:SendMessage(sessionKey: string, text: string)
		Assert(sessionKey and sessionKey ~= "", "A non-empty session key is required.")
		Assert(text and text ~= "",             "Message text must not be empty.")

		local charSessions = module._sessions[self.external_id]
		if not charSessions or not charSessions[sessionKey] then
			local initResult = self:NewChat(sessionKey)
			if not initResult.Status then
				return initResult
			end
			charSessions = module._sessions[self.external_id]
		end

		local session = charSessions[sessionKey]
		return module:_SendMessage(
			self.external_id,
			session.historyId,
			session.botUsername,
			text
		)
	end

	return char
end

-- ---------------------------------------------------------------------------
-- Private: core chat API
-- ---------------------------------------------------------------------------

function CharacterAI:_CreateChatHistory(charExternalId: string)
	Assert(charExternalId, "charExternalId is required.")
	return self:_Request(BASE_URL .. "/chat/history/create/", "POST", {
		character_external_id = charExternalId,
	})
end

function CharacterAI:_SendMessage(
	charExternalId:    string,
	historyExternalId: string,
	internalId:        string,
	text:              string
)
	return self:_Request(BASE_URL .. "/chat/streaming/", "POST", {
		history_external_id    = historyExternalId,
		character_external_id  = charExternalId,
		text                   = text,
		tgt                    = internalId,
		chunks_to_pad          = 8,
		stream_every_n_steps   = 16,
		ranking_method         = "random",
		is_proactive           = false,
		faux_chat              = false,
		enable_tti             = true,
		staging                = false,
	})
end

-- ---------------------------------------------------------------------------
-- Public API — service status
-- ---------------------------------------------------------------------------

-- Returns true if the Character.AI servers are reachable and not under maintenance.
function CharacterAI:IsOnline(): boolean
	local ok, response = pcall(game.HttpGet, game, BASE_URL .. "/")
	if not ok then
		return false
	end
	if response:find("temporarily down for maintenance") and #response < 2500 then
		return false
	end
	return true
end

-- ---------------------------------------------------------------------------
-- Public API — user & account
-- ---------------------------------------------------------------------------

function CharacterAI:GetUserInfo()
	local result = self:_Request(BASE_URL .. "/chat/user/", "GET")
	if not result.Status then
		return result
	end
	return MakeStatus(true, result.Body.user)
end

-- Returns true if the authenticated user is still in the waitlist.
function CharacterAI:IsUserInWaitlist(): boolean
	local result = self:_Request(BASE_URL .. "/chat/config/", "GET")
	if not result.Status then
		return true
	end
	return result.Body.config and result.Body.config.waitlist or false
end

-- ---------------------------------------------------------------------------
-- Public API — character discovery
-- ---------------------------------------------------------------------------

function CharacterAI:GetCategories()
	return self:_Request(BASE_URL .. "/chat/character/categories/", "GET")
end

function CharacterAI:GetMainPageCharacters()
	local result = self:_Request(BASE_URL .. "/chat/curated_categories/characters/", "GET")
	if not result.Status then
		return result
	end

	local byCategory = result.Body.characters_by_curated_category
	for category, chars in pairs(byCategory) do
		for i, char in ipairs(chars) do
			byCategory[category][i] = self:_AttachCharacterMethods(char)
		end
	end

	return MakeStatus(true, byCategory)
end

function CharacterAI:GetTrendingCharacters()
	local result = self:_Request(BASE_URL .. "/chat/characters/trending/", "GET")
	if not result.Status then return result end
	return self:_WrapList(result.Body.trending_characters)
end

function CharacterAI:GetFeaturedCharacters()
	local result = self:_Request(BASE_URL .. "/chat/characters/featured_v2/", "GET")
	if not result.Status then return result end
	return self:_WrapList(result.Body.characters)
end

function CharacterAI:GetRecommendedCharacters()
	local result = self:_Request(BASE_URL .. "/chat/characters/recommended/", "GET")
	if not result.Status then return result end
	return self:_WrapList(result.Body.recommended_characters)
end

function CharacterAI:GetUserCharacters()
	local result = self:_Request(BASE_URL .. "/chat/characters/?scope=user", "GET")
	if not result.Status then return result end
	return self:_WrapList(result.Body.characters)
end

function CharacterAI:GetRecentCharacters()
	local result = self:_Request(BASE_URL .. "/chat/characters/recent/", "GET")
	if not result.Status then return result end
	return self:_WrapList(result.Body.characters)
end

function CharacterAI:SearchCharacters(query: string)
	Assert(query and query ~= "", "A non-empty search query is required.")

	local encoded = HttpService:UrlEncode(tostring(query))
	local result  = self:_Request(BASE_URL .. "/chat/characters/search/?query=" .. encoded, "GET")
	if not result.Status then
		return result
	end

	local chars = result.Body.characters
	if not chars or #chars == 0 then
		return MakeStatus(false, 'No characters found for query: "' .. query .. '"')
	end

	return self:_WrapList(chars)
end

function CharacterAI:GetCharacterByExternalId(externalId: string)
	Assert(externalId and externalId ~= "", "externalId is required.")

	local result = self:_Request(
		BASE_URL .. "/chat/character/info-cached/" .. externalId .. "/",
		"GET"
	)
	if not result.Status then
		return result
	end

	return MakeStatus(true, self:_AttachCharacterMethods(result.Body.character))
end

-- ---------------------------------------------------------------------------
-- Public API — session management
-- ---------------------------------------------------------------------------

-- Clears all active chat sessions from memory.
function CharacterAI:ResetAllSessions(): boolean
	self._sessions = {}
	return true
end

-- ---------------------------------------------------------------------------
-- Public API — utilities
-- ---------------------------------------------------------------------------

-- Pretty-prints any value to the output console.
function CharacterAI:PrintTable(value: any)
	if type(value) ~= "table" then
		print(tostring(value))
		return
	end

	local function dump(t: { [any]: any }, depth: number)
		local pad = string.rep("  ", depth)
		for k, v in pairs(t) do
			local key = type(k) == "string"
				and string.format('"%s"', k)
				or  string.format("[%s]", tostring(k))

			if type(v) == "table" then
				print(pad .. key .. " = {")
				dump(v, depth + 1)
				print(pad .. "},")
			elseif type(v) == "string" then
				print(pad .. key .. ' = "' .. v .. '",')
			else
				print(pad .. key .. " = " .. tostring(v) .. ",")
			end
		end
	end

	print("{")
	dump(value, 1)
	print("}")
end

--[[
	Splits a string into chunks where each chunk's total character count does
	not exceed `maxChunkSize` (default 150).

	Returns an array of { Text: {string}, Size: number } tables, where Text is
	a list of words belonging to that chunk.
]]
function CharacterAI:SplitText(
	text:         string,
	maxChunkSize: number?
): { { Text: { string }, Size: number } }
	Assert(text and text ~= "", "Text must not be empty.")

	local limit   = maxChunkSize or 150
	local words   = string.split(text, " ")
	local chunks  = {}
	local current = { Text = {}, Size = 0 }

	for _, word in ipairs(words) do
		current.Size += #word
		table.insert(current.Text, word)

		if current.Size >= limit then
			table.insert(chunks, current)
			current = { Text = {}, Size = 0 }
		end
	end

	if #current.Text > 0 then
		table.insert(chunks, current)
	end

	return chunks
end

-- ---------------------------------------------------------------------------

return CharacterAI
