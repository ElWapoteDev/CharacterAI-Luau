--Modulo Character.AI
local Http = game:GetService("HttpService");
local fetch = (syn and syn.request) or (request);

local CharacterAI = {}
CharacterAI.Version = '1.4'
CharacterAI.__index = CharacterAI

CharacterAI.GlobalSabes = {}
local TokenGlobal = nil;

function RedondearNumero(numero)
	local numero_final = ""
	local numero = tonumber(numero)

	if numero >= 1000000 then
		numero_final = tostring(math.floor(numero/1000000)).."m"
	elseif numero >= 1000 then
		numero_final = tostring(math.floor(numero/1000)).."k"
	else
		numero_final = tostring(numero)
	end

	return numero_final
end

function CleanJSON(Respuesta)
	local UltimaTabla = Respuesta:match("%b{}")
	for Tabla in Respuesta:gmatch("%b{}") do
		UltimaTabla = Tabla
	end
	return UltimaTabla;
end;

function MiAssert(valor, mensaje)
	if not valor then
		warn(mensaje..' The script has stopped running. Please check the external console for further details.') ;
	end;

	assert(valor, mensaje);
end;

function GenerarStatus(statu: boolean, cuerpo: any)
	local Estado = {};

	Estado['Status'] = statu;
	Estado['Body'] = cuerpo;

	return Estado;
end;

function CharacterAI:printTable(tbl)
	if type(tbl) ~= "table" then
		print(tostring(tbl))
		return
	end

	local function printTableHelper(t, indent)
		local indentStr = string.rep(" ", indent)
		for k, v in pairs(t) do
			if type(v) == "table" then
				if type(k) == 'string' then
					print(indentStr .. '["'.. tostring(k)..'"]' .. " = {")
				else
					print(indentStr .. '['.. tostring(k)..']' .. " = {")
				end
				printTableHelper(v, indent + 2)
				print(indentStr .. "},")
			else
				if type(k) == 'string' then
					if type(v) == 'string' then
						print(indentStr .. '["'.. tostring(k)..'"]' .. " = " .. '"'.. tostring(v) ..'"'.. ",")

					else
						print(indentStr .. '["'.. tostring(k)..'"]' .. " = " .. tostring(v) .. ",")							
					end

					continue;
				end

				if type(v) == 'string' then
					print(indentStr .. '['.. tostring(k)..']' .. " = " ..'"'.. tostring(v) ..'"'.. ",")
				else
					print(indentStr .. '['.. tostring(k)..']' .. " = " .. tostring(v) .. ",")
				end
			end
		end
	end 

	print('\n\n\n')
	print("{")
	printTableHelper(tbl, 2)
	print("}")
end

function CharacterAI:SplitText(Texto)
    MiAssert(Texto, 'No text provided')
    local Dividido = string.split(Texto, " ")
    local Partes = {}
    local Contaodor = 1
    Partes[Contaodor] = {}
    
    for index, texto in pairs(Dividido) do
        local Tamano = #texto
        
        if (not Partes[Contaodor]['Tamano']) then
            Partes[Contaodor]['Tamano'] = 0
        end
        if (not Partes[Contaodor]['Texto']) then
            Partes[Contaodor]['Texto'] = {}
        end
        
        
        Partes[Contaodor]['Tamano'] = Partes[Contaodor]['Tamano'] + Tamano

        table.insert(Partes[Contaodor]['Texto'], texto)
        
        if Partes[Contaodor]['Tamano'] > 150 then
            Contaodor = Contaodor + 1
            Partes[Contaodor] = {}
        end
    end
    
    return Partes
end


function CharacterAI:GetHeaders(IncluyeToken: boolean)
	local Encabezados = {
		['content-type'] = 'application/json',
		['accept'] = 'application/json, text/plain, */*',
	}


	if (IncluyeToken == true and TokenGlobal ~= nil) then
		Encabezados['authorization'] = 'Token '..TokenGlobal
	end

	return Encabezados
end

function CharacterAI:HTTPRequest(url: string, metodo: string, cuerpo: any, OnlyBody: boolean)
	local NoBody = { 'GET', 'HEAD', 'DELETE', 'OPTIONS', 'TRACE' };
	MiAssert(url, 'No url provided');
	MiAssert(metodo, 'No method provided');

	if (table.find(NoBody, metodo) == nil) and (cuerpo == nil) then
		MiAssert(false, 'No body provided');
	end

	local Opciones = {
		Url = url,
		Method = metodo,
		Headers = CharacterAI:GetHeaders(true)
	};

	if (cuerpo) then
		Opciones['Body'] = Http:JSONEncode(cuerpo);
	end;

	local succ, err = pcall(function()
		local res = fetch(Opciones);
		return res;
	end);

	if (succ == true and err['StatusCode'] == 200) then
		if (not err['Body']) or (err['Body'] == '') then
			if (OnlyBody == true) then
				warn('No body, return full response');
			end

			return GenerarStatus(true, err);
		end

		err['Body'] = CleanJSON(err['Body'])
		local Decode = Http:JSONDecode(err['Body'])
		return GenerarStatus(true, Decode);
	end;

	local String = 'Status Code: '..err['StatusCode']..'\n StatusMessage: '..err['StatusMessage']
	if (err['Body']) then
		String = String..'\n Body: '..err['Body']
	end

	return GenerarStatus(false, String);
end;

function SesionGuest()
	local Url = 'https://beta.character.ai/chat/auth/lazy/';
	local uuid = Http:GenerateGUID();

	local Respuesta = CharacterAI:HTTPRequest(Url, 'POST', {
		lazy_uuid = uuid
	}, true)

	if (Respuesta['Status'] == false) then
		return GenerarStatus(false, 'An error occurred while retrieving GUEST credentials.'.. Respuesta['Body']);
	end;

	return GenerarStatus(true, Respuesta['Body']['token']);
end;

function VerifyToken(Token)
	local Url = 'https://beta.character.ai/chat/characters/recent/'

	local Respuesta = CharacterAI:HTTPRequest(Url, 'GET', nil, true)
	if (Respuesta['Status'] == false) then
		return GenerarStatus(false, 'Invalid Token')
	end

	return GenerarStatus(true, 'Welcome to Character.AI')
end;

function AddFunctionsToCharacter(Char)
	Char['GetName'] = function()
		return Char.participant__name
	end

	Char['GetCreatorName'] = function()
		return Char.user__username;
	end;

	function Char:NewChat(Key)
		MiAssert(Key, 'No key provided')
		local History = CharacterAI:NewChat(Char.external_id)
		local RobotExist = false

		if (History['Status'] == false) then
			return History;
		end;

		if (not CharacterAI.GlobalSabes[Char.external_id]) then
			CharacterAI.GlobalSabes[Char.external_id] = {}
		end
		CharacterAI.GlobalSabes[Char.external_id][Key] = {}
		CharacterAI.GlobalSabes[Char.external_id][Key]['history'] = History['Body']['external_id']

		for index, participant in pairs(History['Body']['participants']) do
			if (participant['is_human']) then
				continue;
			end;

			CharacterAI.GlobalSabes[Char.external_id][Key]['internal'] = participant['user']['username'];
			RobotExist = true;
		end;


		if (RobotExist == false) then
			return GenerarStatus(false, 'There is no robot in this conversation. It may be an error. Please try reloading the conversation.')
		end;

		return History;
	end;
	
	function Char:DeleteChat(Key)
		MiAssert(Key, 'No key provided');
		if (not CharacterAI.GlobalSabes[Char.external_id]) then
			return false;
		end;
		
		if (not CharacterAI.GlobalSabes[Char.external_id][Key]) then
			return false;
		end;
		
		CharacterAI.GlobalSabes[Char.external_id][Key] = nil
		
		return true;
		
	end;

	function Char:SendMessage(Key, Texto)
		MiAssert(Key, 'No key provided')
		if (not CharacterAI.GlobalSabes[Char.external_id]) or (not CharacterAI.GlobalSabes[Char.external_id][Key]) then
			Char:NewChat(Key);
			print('Nuevo chat inicializado')
		end;

		local Response = CharacterAI:SendMessage(Char.external_id, 
			CharacterAI.GlobalSabes[Char.external_id][Key]['history'],
			CharacterAI.GlobalSabes[Char.external_id][Key]['internal'],
			Texto
		);

		return Response
		--CharacterAI:printTable(Response)
	end;
	
	function Char:GetInteractions(Round)
		local Num;
		
		if (not Char['participant__num_interactions']) then
			return 0;
		end
		
		if (Round == true) then
			return RedondearNumero(Char.participant__num_interactions)
		end
		
		return Char.participant__num_interactions
        end;
	
	function Char:GetDescription()
		if (Char['title']) and (Char['title'] ~= "") then
			return Char['title'];
		end;
		
		if (Char['greeting']) and (Char['greeting'] ~= "") then
			return Char['greeting'];
		end;
		
		if (Char['participant__name']) and (Char['participant__name'] ~= "") then
			return Char['participant__name'];
		end;
		
		return "";
	end;

	Char['GetImage'] = function()
		local FolderPath = "CharacterAi/"
		local fileName = Char.participant__name..'/'..Char.user__username;
		local customAsset 

		do
			customAsset = getsynasset or getcustomasset
		end

		if isfile(FolderPath .. fileName .. ".png") then
			return customAsset(FolderPath .. fileName .. ".png");
		end;
		
		
		local Url = 'https://characterai.io/i/400/static/avatars/'..Char.avatar_file_name
		local succ, Respuesta = pcall(function()
			return game:HttpGet(Url)
		end) 

		if (succ == false) then
			return GenerarStatus(false, 'Cant get image of this character');
		end;


		if (not isfolder('CharacterAi')) then
			makefolder('CharacterAi')
		end


		local function SetIcon(url, fileName)
			fileName = fileName:gsub("%p", "");
			writefile(FolderPath .. fileName .. ".png", url);
			local Image = customAsset(FolderPath.. fileName .. ".png")
			return Image
		end;

		local Image = SetIcon(Respuesta, fileName)

		return GenerarStatus(true, Image)
	end

	return Char
end

function CharacterAI.new(Token)
	local self = setmetatable({}, CharacterAI);
	TokenGlobal = nil;
	self.Guest = false

	if (Token == "" or Token == nil) then 
		warn('It is recommended that you provide a TOKEN. Without it, you will access as a GUEST but with limitations.');
		local Token = SesionGuest();
		CharacterAI:printTable(Token);
		MiAssert(Token['Status'] == true, 'An error occurred while authenticating as GUEST.');
		TokenGlobal = Token['Body'];
		self.Guest = true

		warn([[
👋 Hello there!
📝 This script utilizes the (unofficial) Character.AI API wrapper module.
🔍 You can obtain this module at: https://github.com/ElWapoteDev/CharacterAI-Luau
👨‍💻 Created by ElGuapoDeHuapos.
🔖 Version: ]]..CharacterAI.Version..[[
👉 This is a brief readme that will be printed in the console.
	]])

		return self
	end;
	TokenGlobal = Token

	MiAssert(tostring(Token), 'Invalid Token!')

	local TokenJalando = VerifyToken(TokenGlobal)

	MiAssert(TokenJalando['Status'] == true, 'Invalid Token!')

	warn([[
👋 Hello there!

📝 This script utilizes the (unofficial) Character.AI API wrapper module.
🔍 You can obtain this module at: https://github.com/ElWapoteDev/CharacterAI-Luau
👨‍💻 Created by ElGuapoDeHuapos.
🔖 Version: ]]..CharacterAI.Version..[[

👉 This is a brief readme that will be printed in the console.
	]])
	
	return self;
end;

function CharacterAI:GetCategories()
	local Url = 'https://beta.character.ai/chat/character/categories/'
	local Respuesta = CharacterAI:HTTPRequest(Url, 'GET', nil, true)

	return Respuesta
end

function CharacterAI:UserIsInWaitlist()
	local Url = 'https://beta.character.ai/chat/config/';
	local Respuesta = CharacterAI:HTTPRequest(Url, 'GET', nil, true);

	if (Respuesta['Status'] == false) then
		warn(Respuesta['Body']);
		return true;
	end;

	return Respuesta['Body']['config']['waitlist']
end

function CharacterAI:IsOnline()
    local Url = 'https://beta.character.ai/';

	local succ, Respuesta = pcall(function()
	    return game:HttpGet(Url);
	end);

    if (succ == false) then
		return false;
	end;

	if Respuesta:find("We're temporarily down for maintenance") and #Respuesta < 2500 then
		return false;
	end;
	
	return true;
end;

function CharacterAI:GetMainPageCharacters()
	local Url = 'https://beta.character.ai/chat/curated_categories/characters/';
	local Respuesta = CharacterAI:HTTPRequest(Url, 'GET', nil, true);

	if (Respuesta['Status'] == false) then
		return Respuesta;
	end;

	local CharsByCategory = Respuesta['Body']['characters_by_curated_category']

	for category, array in pairs(CharsByCategory) do
		for index, character in pairs(array) do
			local Renewed = AddFunctionsToCharacter(character)
			CharsByCategory[category][index] = Renewed
		end
	end

	return setmetatable({
		Body = setmetatable(CharsByCategory, {
			__index = function(tbl, key)
				warn("Attempt to index non-existent value in CharsByCategory table")
				return GenerarStatus(false, 'Index out of range')
			end
		})
	}, {
		__index = function(tbl, key)
			if key == "Status" then
				return true
			end
		end
	});
end

function CharacterAI:GetTrendingCharacters()
	local Url = 'https://beta.character.ai/chat/characters/trending/';
	local Respuesta = CharacterAI:HTTPRequest(Url, 'GET', nil, true);

	if (Respuesta['Status'] == false) then
		return Respuesta;
	end;

	local TrendingCharacters = Respuesta['Body']['trending_characters'];

	for index, character in pairs(TrendingCharacters) do
		local Renewed = AddFunctionsToCharacter(character)
		TrendingCharacters[index] = Renewed
	end;

	return setmetatable({
		Body = setmetatable(TrendingCharacters, {
			__index = function(tbl, key)
				warn("Attempt to index non-existent value in TrendingCharacters table")
				return GenerarStatus(false, 'Index out of range')
			end
		})
	}, {
		__index = function(tbl, key)
			if key == "Status" then
				return true
			end
		end
	});
end;

function CharacterAI:GetFeaturedCharacters()
	local Url = 'https://beta.character.ai/chat/characters/featured_v2/';
	local Respuesta = CharacterAI:HTTPRequest(Url, 'GET', nil, true);

	if (Respuesta['Status'] == false) then
		return Respuesta;
	end;

	local FeaturedCharacters = Respuesta['Body']['characters'];

	for index, character in pairs(FeaturedCharacters) do
		local Renewed = AddFunctionsToCharacter(character)
		FeaturedCharacters[index] = Renewed
	end;

	return setmetatable({
		Body = setmetatable(FeaturedCharacters, {
			__index = function(tbl, key)
				warn("Attempt to index non-existent value in FeaturedCharacters table")
				return GenerarStatus(false, 'Index out of range')
			end
		})
	}, {
		__index = function(tbl, key)
			if key == "Status" then
				return true
			end
		end
	});
end;

function CharacterAI:GetRecommendedCharacters()
	local Url = 'https://beta.character.ai/chat/characters/recommended/';
	local Respuesta = CharacterAI:HTTPRequest(Url, 'GET', nil, true);

	if (Respuesta['Status'] == false) then
		return Respuesta;
	end;

	local RecommendedCharacters = Respuesta['Body']['recommended_characters'];

	for index, character in pairs(RecommendedCharacters) do
		local Renewed = AddFunctionsToCharacter(character)
		RecommendedCharacters[index] = Renewed
	end;

	return setmetatable({
		Body = setmetatable(RecommendedCharacters, {
			__index = function(tbl, key)
				warn("Attempt to index non-existent value in RecommendedCharacters table")
				return GenerarStatus(false, 'Index out of range')
			end
		})
	}, {
		__index = function(tbl, key)
			if key == "Status" then
				return true
			end
		end
	});
end;

function CharacterAI:GetUserCharacters()
	local Url = 'https://beta.character.ai/chat/characters/?scope=user';
	local Respuesta = CharacterAI:HTTPRequest(Url, 'GET', nil, true);

	if (Respuesta['Status'] == false) then
		return Respuesta;
	end;

	local UserCharacters = Respuesta['Body']['characters'];

	for index, character in pairs(UserCharacters) do
		local Renewed = AddFunctionsToCharacter(character)
		UserCharacters[index] = Renewed
	end;

	return setmetatable({
		Body = setmetatable(UserCharacters, {
			__index = function(tbl, key)
				warn("Attempt to index non-existent value in UserCharacters table")
				return GenerarStatus(false, 'Index out of range')
			end
		})
	}, {
		__index = function(tbl, key)
			if key == "Status" then
				return true
			end
		end
	});
end;

function CharacterAI:GetRecentCharacters()
	local Url = 'https://beta.character.ai/chat/characters/recent/';
	local Respuesta = CharacterAI:HTTPRequest(Url, 'GET', nil, true);

	if (Respuesta['Status'] == false) then
		return Respuesta;
	end;

	local RecentCharacters = Respuesta['Body']['characters'];

	for index, character in pairs(RecentCharacters) do
		local Renewed = AddFunctionsToCharacter(character)
		RecentCharacters[index] = Renewed
	end;

	return setmetatable({
		Body = setmetatable(RecentCharacters, {
			__index = function(tbl, key)
				warn("Attempt to index non-existent value in RecentCharacters table")
				return GenerarStatus(false, 'Index out of range')
			end
		})
	}, {
		__index = function(tbl, key)
			if key == "Status" then
				return true
			end
		end
	});
end;

function CharacterAI:SearchCharacters(Query)
	Query = tostring(Query)
	if (Query == nil) then 
		return GenerarStatus(false, 'No query provided')
	end
	local Url = 'https://beta.character.ai/chat/characters/search/?query='..Http:UrlEncode(Query);
	local Respuesta = CharacterAI:HTTPRequest(Url, 'GET', nil, true);

	if (Respuesta['Status'] == false) then
		return Respuesta;
	end;

	local RecentCharacters = Respuesta['Body']['characters'];

	if (#RecentCharacters == 0) then
		return GenerarStatus(false, 'No characters found');
	end;

	for index, character in pairs(RecentCharacters) do
		local Renewed = AddFunctionsToCharacter(character)
		RecentCharacters[index] = Renewed
	end;

	return setmetatable({
		Body = setmetatable(RecentCharacters, {
			__index = function(tbl, key)
				warn("Attempt to index non-existent value in Search table")
				return GenerarStatus(false, 'Index out of range')
			end
		})
	}, {
		__index = function(tbl, key)
			if key == "Status" then
				return true
			end
		end
	});
end;

function CharacterAI:GetCharacterByExternalId(external_character_id)
	MiAssert(external_character_id, 'No external character id provided');
	local Url = 'https://beta.character.ai/chat/character/info-cached/'..external_character_id..'/';
	local Respuesta = CharacterAI:HTTPRequest(Url, 'GET', nil, true);

	if (Respuesta['Status'] == false) then
		return Respuesta;
	end;	

	local Char = Respuesta['Body']['character'];
	local Renewed = AddFunctionsToCharacter(Char);

	return GenerarStatus(true, Renewed)
end;

function CharacterAI:GetUserInfo()
	local Url = 'https://beta.character.ai/chat/user/';

	local Respuesta = CharacterAI:HTTPRequest(Url, 'GET', nil, true);

	if (Respuesta['Status'] == false) then
		return Respuesta
	end;



	return GenerarStatus(true, Respuesta['Body']['user']);
end;

function CharacterAI:GlobalHistoryReset()
	CharacterAI.GlobalSabes = {};
	return true;
end;

function CharacterAI:NewChat(char_external_id)
	MiAssert(char_external_id, 'No character_external_id provided.')

	if (not tostring(char_external_id)) then
		return GenerarStatus(false, 'Invalid external id provided')
	end;

	local Url = 'https://beta.character.ai/chat/history/create/';
	local Respuesta = CharacterAI:HTTPRequest(Url, 'POST', {
		['character_external_id'] = char_external_id
	}, true);

	return Respuesta;
end

function CharacterAI:SendMessage(char_external_id, history_external_id, internal_id, Text)
	MiAssert(char_external_id, 'No char_external_id provided');
	MiAssert(history_external_id, 'No history_external_id provided');
	MiAssert(internal_id, 'No internal_id provided');
	MiAssert(Text, 'No Text provided');

	local Url = 'https://beta.character.ai/chat/streaming/'
	local Respuesta = CharacterAI:HTTPRequest(Url, 'POST', {
		history_external_id = history_external_id,
		character_external_id = char_external_id,
		text = Text,
		tgt = internal_id,
		chunks_to_pad = 8,
		stream_every_n_steps = 16,
		ranking_method = "random",
		is_proactive = false,
		faux_chat = false,
		enable_tti = true,
		staging = false
	}, true);

	return Respuesta
end;

return CharacterAI
