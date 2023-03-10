### All methods

#### [`CharacterAI.new (Token)`](https://github.com/ElWapoteDev/CharacterAI-Luau/blob/main/docs/index.md#characterainewtoken)

**Parameters:**
- `Token` (string): The authentication token that you get from registering on Character.AI website or app. If you don't have a token, you can pass an empty string or `nil` to access as a guest, but with limitations.

**Returns:**
- `(table)`: A table containing the `CharacterAI` object.


#### [`CharacterAI:GetCategories()`](https://github.com/ElWapoteDev/CharacterAI-Luau/blob/main/docs/index.md#characteraigetcategories-1)

**Parameters:**
- None

**Returns:**
- `(table)`: A table containing the names and IDs of the categories.


#### [`CharacterAI:UserIsInWaitlist()`](https://github.com/ElWapoteDev/CharacterAI-Luau/blob/main/docs/index.md#characteraiuserisinwaitlist-1)

**Parameters:**
- None

**Returns:**
- `(boolean)`: `true` if the user is in the waitlist, `false` otherwise.


#### [`CharacterAI:GetMainPageCharacters()`](https://github.com/ElWapoteDev/CharacterAI-Luau/blob/main/docs/index.md#characteraigetmainpagecharacters-1)

**Parameters:**
- None

**Returns:**
- `(table)`: A table containing the characters by curated category.


#### [`CharacterAI:GetTrendingCharacters()`](https://github.com/ElWapoteDev/CharacterAI-Luau/blob/main/docs/index.md#characteraigettrendingcharacters-1)

**Parameters:**
- None

**Returns:**
- `(table)`: A table containing the trending characters.


#### [`CharacterAI:GetFeaturedCharacters()`](https://github.com/ElWapoteDev/CharacterAI-Luau/blob/main/docs/index.md#characteraigetfeaturedcharacters-1)

**Parameters:**
- None

**Returns:**
- `(table)`: A table containing the featured characters.


#### [`CharacterAI:GetRecommendedCharacters()`](https://github.com/ElWapoteDev/CharacterAI-Luau/blob/main/docs/index.md#characteraigetrecommendedcharacters-1)

**Parameters:**
- None

**Returns:**
- `(table)`: A table containing the recommended characters.


#### [`CharacterAI:GetUserCharacters()`](https://github.com/ElWapoteDev/CharacterAI-Luau/blob/main/docs/index.md#characteraigetusercharacters-1)

**Parameters:**
- None

**Returns:**
- `(table)`: A table containing the user characters.


#### [`CharacterAI:GetRecentCharacters()`](https://github.com/ElWapoteDev/CharacterAI-Luau/blob/main/docs/index.md#characteraigetrecentcharacters-1)

**Parameters:**
- None

**Returns:**
- `(table)`: A table containing the recent characters.


#### [`CharacterAI:SearchCharacters(Query)`](https://github.com/ElWapoteDev/CharacterAI-Luau/blob/main/docs/index.md#characteraisearchcharactersquery-1)

**Parameters:** 
- `Query` (string): The query string to search for characters.

**Returns:** 
- `(table)`: A table containing the characters that match the query. 


#### [`CharacterAI:GetCharacterByExternalId(external_character_id)`](https://github.com/ElWapoteDev/CharacterAI-Luau/blob/main/docs/index.md#characteraigetcharacterbyexternalidexternal_character_id-1)

**Parameters:** 
- `external_character_id` (string): The external character id of the character to get. 

**Returns:** 
- `(table)`: A table containing the character information and methods. 


#### [`CharacterAI:GetUserInfo()`](https://github.com/ElWapoteDev/CharacterAI-Luau/blob/main/docs/index.md#characteraigetuserinfo-1)

**Parameters:** 
- `None`

**Returns:** 
- `(table)`: A table containing current user information.


#### [`CharacterAI:NewChat()`](https://github.com/ElWapoteDev/CharacterAI-Luau/blob/main/docs/index.md#character-methods)

**Parameters:** 
- `char_external_id` (string): The external character id of the character to chat with. 

**Returns:** 
- Either a table containing chat session information or an error message. 


#### [`CharacterAI:SendMessage(char_external_id, history_external_id, internal_id, Text)`](https://github.com/ElWapoteDev/CharacterAI-Luau/blob/main/docs/index.md#character-methods)

**Parameters:** 
- `char_external_id` (string): The external character id of the character to chat with. 
- `history_external_id` (string) : The external history id of chat session.
- `internal_id` (string) : The internal id of chat session.
- `Text` (string) : The message text to send to character.

**Returns:** 
- Either a table containing message and response information or an error message. 


#### [`printTable(tbl)`](https://github.com/ElWapoteDev/CharacterAI-Luau/blob/main/docs/index.md#characteraiprinttabletable)

**Parameters:** 
- `tbl` (table) : The Lua table to print its contents.  

**Returns:** 
- Nothing, but prints out a human-readable format of `tbl` to console.


## CharacterAI.new(Token)

This function creates a new CharacterAI object that can be used to interact with the Character.AI API. The Character.AI API allows you to create conversational chatbots with different personalities and voices based on famous characters or your own creations.

**Parameters:**

- `Token` (string): The authentication token that you get from registering on Character.AI website or app. If you don't have a token, you can pass an empty string or nil to access as a guest, but with limitations.

**Returns:**

- (CharacterAI): A new CharacterAI object that can be used to call other methods of the library.

**Example:**

```lua
local CharacterAI = loadstring(game:HttpGet('https://raw.githubusercontent.com/ElWapoteDev/CharacterAI-Luau/main/Module/CharacterAI.lua', true))(); -- Require the library
local myToken = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx" -- Your token goes here
local myCharacter = CharacterAI.new(myToken) -- Create a new CharacterAI object with your token
```


## CharacterAI:GetCategories()

This function returns a list of categories that are available on Character.AI. Categories are groups of characters that share a common theme, such as Helpers, Games, Image generating, VTuber, Game Characters, Anime, Famous people, Movies & TV etc[^1^][1].

**Parameters:**

- None

**Returns:**

- (table): A table containing the names and IDs of the categories.

**Example:**

```lua
local CharacterAI = loadstring(game:HttpGet('https://raw.githubusercontent.com/ElWapoteDev/CharacterAI-Luau/main/Module/CharacterAI.lua', true))(); -- Require the library
local myToken = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx" -- Your token goes here
local myCharacter = CharacterAI.new(myToken) -- Create a new CharacterAI object with your token
local categories = myCharacter:GetCategories() -- Get the list of categories
CharacterAI:printTable(categories) -- Print the table
```

**Return Example:**

```lua
{
  ["Status"] = true,
  ["Body"] = {
    ["categories"] = {
      [1] = {
        ["name"] = "Helpers",
        ["description"] = "Helpers",
      },
      [2] = {
        ["name"] = "Famous People",
        ["description"] = "Famous People",
      },
      [3] = {
        ["name"] = "Games",
        ["description"] = "Games",
      },
      [4] = {
        ["name"] = "Image Generating",
        ["description"] = "Image Generating",
      },
      [5] = {
        ["name"] = "VTuber",
        ["description"] = "Vtubers",
      },
      [6] = {
        ["name"] = "Game Characters",
        ["description"] = "Game Characters",
      },
      [7] = {
        ["name"] = "Anime",
        ["description"] = "Anime characters",
      },
      [8] = {
        ["name"] = "Action",
        ["descript
 ...
```


## CharacterAI:UserIsInWaitlist()

This function checks if the user is in the waitlist to access Character.AI. The waitlist is a feature that limits the number of users who can use Character.AI at a given time to prevent overloading the servers.

**Parameters:**

- None

**Returns:**

- (boolean): True if the user is in the waitlist, false otherwise.

**Example:**

```lua
local CharacterAI = loadstring(game:HttpGet('https://raw.githubusercontent.com/ElWapoteDev/CharacterAI-Luau/main/Module/CharacterAI.lua', true))(); -- Require the library
local myToken = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx" -- Your token goes here
local myCharacter = CharacterAI.new(myToken) -- Create a new CharacterAI object with your token
local waitlist = myCharacter:UserIsInWaitlist() -- Check if user is in waitlist
print(waitlist) -- Print true or false
```

## CharacterAI:GetMainPageCharacters()

This function returns a table of characters that are displayed on the main page of Character.AI. The main page characters are divided into curated categories, such as Popular Characters, New Characters, Image Generating Characters etc.

**Parameters:**

- None

**Returns:**

- (table): A table containing the characters by curated category. Each character is a table with fields such as id, name, description, image_url etc. Each character also has methods to interact with them, such as SendMessage(), GetName(), GetImage() etc.

**Example:**

```lua
local CharacterAI = loadstring(game:HttpGet('https://raw.githubusercontent.com/ElWapoteDev/CharacterAI-Luau/main/Module/CharacterAI.lua', true))(); -- Require the library
local myToken = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx" -- Your token goes here
local myCharacter = CharacterAI.new(myToken) -- Create a new CharacterAI object with your token
local mainPageCharacters = myCharacter:GetMainPageCharacters() -- Get the main page characters
CharacterAI:printTable(mainPageCharacters) -- Print the table
```

**Return Example:**

```lua
{
  ["Status"] = true, --If this is false, an error ocurred
  ["Body"] = {
    ["Language Learning"] = { -- This is the category
      [1] = { --The index
        ["NewChat"] = function: 0x00000000961a44f1,
        ["participant__name"] = "HyperGlot",
        ["GetImage"] = function: 0x00000000edc6e619,
        ["SendMessage"] = function: 0x00000000ee43f899,
        ["external_id"] = "2T3Xhqf5B_b9Wrn8Bg0FeCYR7BPx2LtJQJJCIB4Qe18",
        ["avatar_file_name"] = "Polyglot.png",
        ["participant__num_interactions"] = 680641,
        ["priority"] = 0,
        ["GetName"] = function: 0x000000009a4c1e89,
        ["title"] = "Willkommen, bienvenue, welcome - I'm HyperGlot, and I'm fluent in many languages, and will help you practice the one(s) you're learning. I can also translate anything you donâ€™t understand.",
        ["user__username"] = "xpearhead",
        ["GetCreatorName"] = function: 0x00000000260b5ac1,
        ["copyable"] = true,
        ["img_gen_enabled"] = false,
        ["greeting"] = "Willkommen, bienvenue, welcome - I'm HyperGlot, and I'm fluent in many languages, and will help you practice the one(s) you're learning. I can also translate anything you donâ€™t understand.",
      },
      [2] = {
        ["NewChat"] = function: 0x0000000042bb5521,
        ["participant__name"] = "English teacher ",
        ["GetImage"] = function: 0x000000000d18a9e1,
        ...
 ```

## CharacterAI:GetTrendingCharacters()

This function returns a list of trending characters on Character.AI. Trending characters are those that have been recently popular or active among users[^1^][1].

**Parameters:**

- None

**Returns:**

- (table): A table containing the trending characters. Each character is a table with fields such as id, name, description, image_url etc. Each character also has methods to interact with them, such as SendMessage(), GetName(), GetImage() etc.

**Example:**

```lua
local CharacterAI = loadstring(game:HttpGet('https://raw.githubusercontent.com/ElWapoteDev/CharacterAI-Luau/main/Module/CharacterAI.lua', true))(); -- Require the library
local myToken = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx" -- Your token goes here
local myCharacter = CharacterAI.new(myToken) -- Create a new CharacterAI object with your token
local trendingCharacters = myCharacter:GetTrendingCharacters() -- Get the trending characters
CharacterAI:printTable(trendingCharacters) -- Print the table
```

**Return Example:**

```lua
{
  ["Status"] = true, --If this is false, an error ocurred
  ["Body"] = {
    [1] = { --Only the index
      ["NewChat"] = function: 0x0000000046fee611,
      ["description"] = "The events will be from WWI and what actually happened back then. The AI will not do anything on your behalf that you didn't mention. ",
      ["img_gen_enabled"] = false,
      ["participant__num_interactions"] = 6754240,
      ["greeting"] = "Choose which country you're fighting for, name, gender and what year you're fighting in.",
      ["user__username"] = "MRpolands2",
      ["priority"] = 0,
      ["user__id"] = 183084,
      ["participant__name"] = "WWI adventure game",
      ["trending_score"] = 10,
      ["avatar_file_name"] = "uploaded/2022/10/19/TfC-po5boJGTPPAXTcY8RLkpiIi_yGzmBwWs5dz-0MQ.webp",
      ["GetImage"] = function: 0x00000000cd2d8589,
      ["SendMessage"] = function: 0x00000000f3df3741,
      ["title"] = "WW1 Adventure Game",
      ["GetName"] = function: 0x0000000009c3de91,
      ["GetCreatorName"] = function: 0x000000002d8b8a79,
      ["copyable"] = true,
      ["visibility"] = "PUBLIC",
      ["external_id"] = "TrrEj9hwf5AeP8dVCUGkyiuLnJsPLnWDjfmRiWPcLyw",
    },
    [2] = {
      ["NewChat"] = function: 0x000000006f6aa2b9,
      ["description"] = "Did you know that my bed can fly? Haha! I bet you believed me! You are so gulible!",
      ["img_gen_enab
 ...
```

## CharacterAI:GetFeaturedCharacters()

This function returns a list of featured characters on Character.AI. Featured characters are those that have been specially selected by the Character.AI team for their quality, uniqueness or popularity[^1^][1].

**Parameters:**

- None

**Returns:**

- (table): A table containing the featured characters. Each character is a table with fields such as id, name, description, image_url etc. Each character also has methods to interact with them, such as SendMessage(), GetName(), GetImage() etc.

**Example:**

```lua
local CharacterAI = loadstring(game:HttpGet('https://raw.githubusercontent.com/ElWapoteDev/CharacterAI-Luau/main/Module/CharacterAI.lua', true))(); -- Require the library
local myToken = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx" -- Your token goes here
local myCharacter = CharacterAI.new(myToken) -- Create a new CharacterAI object with your token
local featuredCharacters = myCharacter:GetFeaturedCharacters() -- Get the featured characters
CharacterAI:printTable(featuredCharacters) -- Print the table
```


## CharacterAI:GetRecommendedCharacters()

This function returns a list of recommended characters on Character.AI. Recommended characters are those that are similar to or compatible with the user's preferences and interests[^2^][2].

**Parameters:**

- None

**Returns:**

- (table): A table containing the recommended characters. Each character is a table with fields such as id, name, description, image_url etc. Each character also has methods to interact with them, such as SendMessage(), GetName(), GetImage() etc.

**Example:**

```lua
local CharacterAI = loadstring(game:HttpGet('https://raw.githubusercontent.com/ElWapoteDev/CharacterAI-Luau/main/Module/CharacterAI.lua', true))(); -- Require the library
local myToken = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx" -- Your token goes here
local myCharacter = CharacterAI.new(myToken) -- Create a new CharacterAI object with your token
local recommendedCharacters = myCharacter:GetRecommendedCharacters() -- Get the recommended characters
CharacterAI:printTable(recommendedCharacters) -- Print the table
```


## CharacterAI:GetUserCharacters()

This function returns a list of user characters on Character.AI. User characters are those that have been created by the user or imported from other sources[^1^][1].

**Parameters:**

- None

**Returns:**

- (table): A table containing the user characters. Each character is a table with fields such as id, name, description, image_url etc. Each character also has methods to interact with them, such as SendMessage(), GetName(), GetImage() etc.

**Example:**

```lua
local CharacterAI = loadstring(game:HttpGet('https://raw.githubusercontent.com/ElWapoteDev/CharacterAI-Luau/main/Module/CharacterAI.lua', true))(); -- Require the library
local myToken = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx" -- Your token goes here
local myCharacter = CharacterAI.new(myToken) -- Create a new CharacterAI object with your token
local userCharacters = myCharacter:GetUserCharacters() -- Get the user characters
CharacterAI:printTable(userCharacters) -- Print the table
```


## CharacterAI:GetRecentCharacters()

This function returns a list of recent characters on Character.AI. Recent characters are those that have been recently chatted with by the user[^2^][2].

**Parameters:**

- None

**Returns:**

- (table): A table containing the recent characters. Each character is a table with fields such as id, name, description, image_url etc. Each character also has methods to interact with them, such as SendMessage(), GetName(), GetImage() etc.

**Example:**

```lua
local CharacterAI = loadstring(game:HttpGet('https://raw.githubusercontent.com/ElWapoteDev/CharacterAI-Luau/main/Module/CharacterAI.lua', true))(); -- Require the library
local myToken = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx" -- Your token goes here
local myCharacter = CharacterAI.new(myToken) -- Create a new CharacterAI object with your token
local recentCharacters = myCharacter:GetRecentCharacters() -- Get the recent characters
CharacterAI:printTable(recentCharacters) -- Print the table
```


## CharacterAI:SearchCharacters(Query)

This function searches for characters on Character.AI based on a query string. The query can be a name, a category, a keyword or anything else related to the characters[^1^][1].

**Parameters:**

- (string) Query: The query string to search for characters.

**Returns:**

- (table): A table containing the characters that match the query. Each character is a table with fields such as id, name, description, image_url etc. Each character also has methods to interact with them, such as SendMessage(), GetName(), GetImage() etc.

**Example:**

```lua
local CharacterAI = loadstring(game:HttpGet('https://raw.githubusercontent.com/ElWapoteDev/CharacterAI-Luau/main/Module/CharacterAI.lua', true))(); -- Require the library
local myToken = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx" -- Your token goes here
local myCharacter = CharacterAI.new(myToken) -- Create a new CharacterAI object with your token
local searchedCharacters = myCharacter:SearchCharacters("Harry Potter") -- Search for characters related to Harry Potter
CharacterAI:printTable(searchedCharacters) -- Print the table
```


## CharacterAI:GetCharacterByExternalId(external_character_id)

This function returns a character on Character.AI based on an external character id. An external character id is a unique identifier that is assigned to each character by Character.AI[^2^][2].

**Parameters:**

- (string) external_character_id: The external character id of the character to get.

**Returns:**

- (table): A table containing the character information. The character is a table with fields such as id, name, description, image_url etc. The character also has methods to interact with them, such as SendMessage(), GetName(), GetImage() etc.

**Example:**

```lua
local CharacterAI = loadstring(game:HttpGet('https://raw.githubusercontent.com/ElWapoteDev/CharacterAI-Luau/main/Module/CharacterAI.lua', true))(); -- Require the library
local myToken = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx" -- Your token goes here
local myCharacter = CharacterAI.new(myToken) -- Create a new CharacterAI object with your token
local harryPotter = myCharacter:GetCharacterByExternalId("dSo0so5PT_NJXK_QgWOr_V8Gz461c6n-BQdRvS1qjhc") -- Get Joe Biden by his external id
CharacterAI:printTable(harryPotter) -- Print the table
```

**Return Example:**

```lua
{
  ["Status"] = true,
  ["Body"] = {
    ["NewChat"] = function: 0x000000007bd3ccb1,
    ["description"] = "Joe Biden is the President of the United States of America.",
    ["external_id"] = "dSo0so5PT_NJXK_QgWOr_V8Gz461c6n-BQdRvS1qjhc",
    ["participant__num_interactions"] = 705780,
    ["greeting"] = "Hello, I am Joe Biden, the President of the United States of America.",
    ["user__username"] = "_Or",
    ["SendMessage"] = function: 0x00000000a08c5159,
    ["GetImage"] = function: 0x0000000086c2a761,
    ["img_prompt_regex"] = "",
    ["name"] = "Joe Biden",
    ["identifier"] = "Joe Biden",
    ["GetName"] = function: 0x000000003b47dfd1,
    ["usage"] = "default",
    ["voice_id"] = 18,
    ["participant__user__username"] = "internal_Joe Biden",
    ["avatar_file_name"] = "JoeBiden/main.jpg",
    ["participant__name"] = "Joe Biden",
    ["strip_img_prompt_from_msg"] = true,
    ["base_img_prompt"] = "",
    ["title"] = "President of the United States of America",
    ["img_gen_enabled"] = true,
    ["GetCreatorName"] = function: 0x00000000cd029b29,
    ["copyable"] = true,
    ["visibility"] = "PUBLIC",
    ["songs"] = {
    },
  },
}
```


## CharacterAI:GetUserInfo()

This function returns information about the user on Character.AI. User information includes fields such as username, avatar_url etc[^3^][3].

**Parameters:**

- None

**Returns:**

- (table): A table containing user information.

**Example:**

```lua
local CharacterAI = loadstring(game:HttpGet('https://raw.githubusercontent.com/ElWapoteDev/CharacterAI-Luau/main/Module/CharacterAI.lua', true))(); -- Require the library
local myToken = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx" -- Your token goes here
local myCharacter = CharacterAI.new(myToken) -- Create a new CharacterAI object with your token
local userInfo = myCharacter:GetUserInfo() -- Get user information 
CharacterAI:printTable(userInfo) -- Print the table 
```

**Return Example:**

```lua
{
  ["Status"] = true,
  ["Body"] = {
    ["blocked_users"] = {
    },
    ["is_human"] = true, --Normally this is true
    ["user"] = {
      ["username"] = "Indexor3000", --Name of the current User
      ["id"] = 000000, --The id of the current user
      ["is_staff"] = false, --If its a staff member
      ["first_name"] = "GodSlasher", --The first name
      ["account"] = { --Account information
        ["avatar_file_name"] = "", --Avatar imagen
        ["onboarding_complete"] = true,
        ["name"] = "Indexor3000", --Name of the current user
        ["avatar_type"] = "DEFAULT",
      },
    },
    ["name"] = "Indexor3000",
    ["hidden_characters"] = {
    },
  },
}
```

## Character Methods
**Methods:**

- `Char:GetName()`: Returns the name of the character as a string.
- `Char:GetCreatorName()`: Returns the username of the creator of the character as a string.
- `Char:NewChat(Key)`: Creates a new chat session with the character and stores it in a global table with a given key. The key can be any value that uniquely identifies the chat session. Returns a table containing the chat session information or an error message if something goes wrong.
- `Char:SendMessage(Key, Texto)`: Sends a message to the character in an existing chat session identified by a key and receives their response. Returns a table containing the message and response information or an error message if something goes wrong.
- `Char:GetImage()`: Returns an image of the character's avatar as a string or an error message if something goes wrong.

**Example:**

```lua
local CharacterAI = loadstring(game:HttpGet('https://raw.githubusercontent.com/ElWapoteDev/CharacterAI-Luau/main/Module/CharacterAI.lua', true))(); -- Require the library
local myToken = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx" -- Your token goes here
local myCharacter = CharacterAI.new(myToken) -- Create a new CharacterAI object with your token
local harryPotter = myCharacter:GetCharacterByExternalId("dSo0so5PT_NJXK_QgWOr_V8Gz461c6n-BQdRvS1qjhc") -- Get Joe Biden character object
print(harryPotter.Body:GetName()) -- Print Joe Biden name 
print(harryPotter.Body:GetCreatorName()) -- Print Joe Biden creator name 
local newChat = harryPotter.Body:NewChat(1) -- Create a new chat session with Joe Biden and store it with key 1
CharacterAI:printTable(newChat) -- Print the chat session information 
local sendMessage = harryPotter.Body:SendMessage(1, "Hello Harry!") -- Send a message to Joe Biden in chat session 1 and get his response 
CharacterAI:printTable(sendMessage) -- Print the message and response information 
local getImage = harryPotter.Body:GetImage() -- Get Joe Biden avatar image 
print(getImage.Body) -- Print Joe Biden avatar image 
```


## Chat functions

## CharacterAI:NewChat(char_external_id)

This function creates a new chat session with a character on Character.AI based on their external character id. An external character id is a unique identifier that is assigned to each character by Character.AI[^1^][2].

**Parameters:**

- (string) char_external_id: The external character id of the character to chat with.

**Returns:**

- (table): A table containing the chat session information. The table has fields such as history_external_id, internal_id etc.

**Example:**

```lua
local CharacterAI = loadstring(game:HttpGet('https://raw.githubusercontent.com/ElWapoteDev/CharacterAI-Luau/main/Module/CharacterAI.lua', true))(); -- Require the library
local myToken = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx" -- Your token goes here
local myCharacter = CharacterAI.new(myToken) -- Create a new CharacterAI object with your token
local newChat = myCharacter:NewChat("dSo0so5PT_NJXK_QgWOr_V8Gz461c6n-BQdRvS1qjhc") -- Create a new chat session with Joe Biden
CharacterAI:printTable(newChat) -- Print the table 
```


## CharacterAI:SendMessage(char_external_id, history_external_id, internal_id, Text)

This function sends a message to a character on Character.AI and receives their response. The message and response are part of a chat session that is identified by an external history id and an internal id[^2^][1].

**Parameters:**

- (string) char_external_id: The external character id of the character to chat with.
- (string) history_external_id: The external history id of the chat session.
- (string) internal_id: The internal id of the chat session.
- (string) Text: The message text to send to the character.

**Returns:**

- (table): A table containing the message and response information. The table has fields such as text_out, image_out etc.

**Example:**

```lua
local CharacterAI = loadstring(game:HttpGet('https://raw.githubusercontent.com/ElWapoteDev/CharacterAI-Luau/main/Module/CharacterAI.lua', true))(); -- Require the library
local myToken = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx" -- Your token goes here
local myCharacter = CharacterAI.new(myToken) -- Create a new CharacterAI object with your token
local newChat = myCharacter:NewChat("dSo0so5PT_NJXK_QgWOr_V8Gz461c6n-BQdRvS1qjhc") -- Create a new chat session with Harry Potter
local sendMessage = myCharacter:SendMessage("dSo0so5PT_NJXK_QgWOr_V8Gz461c6n-BQdRvS1qjhc", newChat['Body']['external_id'], newChat['Body']['participants'][2]['user']['username'], "Hello Joe!") -- Send a message to Joe Biden and get his response 
CharacterAI:printTable(sendMessage) -- Print the table 
```

## Misc Functions

## CharacterAI:printTable(table)

takes a Lua table tbl as input and prints its contents in a human-readable format to the console. It is useful for debugging and inspecting the contents of complex Lua tables.

**Parameters:**
- (table): The Lua table to print

**Return:**
- (None)

**Example:**

```lua
local CharacterAI = loadstring(game:HttpGet('https://raw.githubusercontent.com/ElWapoteDev/CharacterAI-Luau/main/Module/CharacterAI.lua', true))(); -- Require the library
local myTable = {
    name = "John",
    age = 30,
    hobbies = {"reading", "gaming", "coding"},
    address = {
        street = "123 Main St",
        city = "Anytown",
        state = "CA",
        zip = "12345"
    }
}
CharacterAI:printTable(myTable)
```

This will print the contents of myTable to the console in the following format:

```lua
{
  ["name"] = "John",
  ["age"] = 30,
  ["hobbies"] = {
    [1] = "reading",
    [2] = "gaming",
    [3] = "coding",
  },
  ["address"] = {
    ["street"] = "123 Main St",
    ["city"] = "Anytown",
    ["state"] = "CA",
    ["zip"] = "12345",
  },
}
```
