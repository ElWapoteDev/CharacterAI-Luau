## CharacterAI.new(Token)

This function creates a new CharacterAI object that can be used to interact with the Character.AI API. The Character.AI API allows you to create conversational chatbots with different personalities and voices based on famous characters or your own creations.

**Parameters:**

- `Token` (string): The authentication token that you get from registering on Character.AI website or app. If you don't have a token, you can pass an empty string or nil to access as a guest, but with limitations.

**Returns:**

- (CharacterAI): A new CharacterAI object that can be used to call other methods of the library.

**Example:**

```lua
local CharacterAI = require("CharacterAI") -- Require the library
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
local CharacterAI = require("CharacterAI") -- Require the library
local myToken = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx" -- Your token goes here
local myCharacter = CharacterAI.new(myToken) -- Create a new CharacterAI object with your token
local categories = myCharacter:GetCategories() -- Get the list of categories
print(categories) -- Print the table
```


## CharacterAI:UserIsInWaitlist()

This function checks if the user is in the waitlist to access Character.AI. The waitlist is a feature that limits the number of users who can use Character.AI at a given time to prevent overloading the servers.

**Parameters:**

- None

**Returns:**

- (boolean): True if the user is in the waitlist, false otherwise.

**Example:**

```lua
local CharacterAI = require("CharacterAI") -- Require the library
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
local CharacterAI = require("CharacterAI") -- Require the library
local myToken = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx" -- Your token goes here
local myCharacter = CharacterAI.new(myToken) -- Create a new CharacterAI object with your token
local mainPageCharacters = myCharacter:GetMainPageCharacters() -- Get the main page characters
print(mainPageCharacters) -- Print the table
```


## CharacterAI:GetTrendingCharacters()

This function returns a list of trending characters on Character.AI. Trending characters are those that have been recently popular or active among users[^1^][1].

**Parameters:**

- None

**Returns:**

- (table): A table containing the trending characters. Each character is a table with fields such as id, name, description, image_url etc. Each character also has methods to interact with them, such as SendMessage(), GetName(), GetImage() etc.

**Example:**

```lua
local CharacterAI = require("CharacterAI") -- Require the library
local myToken = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx" -- Your token goes here
local myCharacter = CharacterAI.new(myToken) -- Create a new CharacterAI object with your token
local trendingCharacters = myCharacter:GetTrendingCharacters() -- Get the trending characters
print(trendingCharacters) -- Print the table
```


## CharacterAI:GetFeaturedCharacters()

This function returns a list of featured characters on Character.AI. Featured characters are those that have been specially selected by the Character.AI team for their quality, uniqueness or popularity[^1^][1].

**Parameters:**

- None

**Returns:**

- (table): A table containing the featured characters. Each character is a table with fields such as id, name, description, image_url etc. Each character also has methods to interact with them, such as SendMessage(), GetName(), GetImage() etc.

**Example:**

```lua
local CharacterAI = require("CharacterAI") -- Require the library
local myToken = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx" -- Your token goes here
local myCharacter = CharacterAI.new(myToken) -- Create a new CharacterAI object with your token
local featuredCharacters = myCharacter:GetFeaturedCharacters() -- Get the featured characters
print(featuredCharacters) -- Print the table
```


## CharacterAI:GetRecommendedCharacters()

This function returns a list of recommended characters on Character.AI. Recommended characters are those that are similar to or compatible with the user's preferences and interests[^2^][2].

**Parameters:**

- None

**Returns:**

- (table): A table containing the recommended characters. Each character is a table with fields such as id, name, description, image_url etc. Each character also has methods to interact with them, such as SendMessage(), GetName(), GetImage() etc.

**Example:**

```lua
local CharacterAI = require("CharacterAI") -- Require the library
local myToken = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx" -- Your token goes here
local myCharacter = CharacterAI.new(myToken) -- Create a new CharacterAI object with your token
local recommendedCharacters = myCharacter:GetRecommendedCharacters() -- Get the recommended characters
print(recommendedCharacters) -- Print the table
```


## CharacterAI:GetUserCharacters()

This function returns a list of user characters on Character.AI. User characters are those that have been created by the user or imported from other sources[^1^][1].

**Parameters:**

- None

**Returns:**

- (table): A table containing the user characters. Each character is a table with fields such as id, name, description, image_url etc. Each character also has methods to interact with them, such as SendMessage(), GetName(), GetImage() etc.

**Example:**

```lua
local CharacterAI = require("CharacterAI") -- Require the library
local myToken = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx" -- Your token goes here
local myCharacter = CharacterAI.new(myToken) -- Create a new CharacterAI object with your token
local userCharacters = myCharacter:GetUserCharacters() -- Get the user characters
print(userCharacters) -- Print the table
```


## CharacterAI:GetRecentCharacters()

This function returns a list of recent characters on Character.AI. Recent characters are those that have been recently chatted with by the user[^2^][2].

**Parameters:**

- None

**Returns:**

- (table): A table containing the recent characters. Each character is a table with fields such as id, name, description, image_url etc. Each character also has methods to interact with them, such as SendMessage(), GetName(), GetImage() etc.

**Example:**

```lua
local CharacterAI = require("CharacterAI") -- Require the library
local myToken = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx" -- Your token goes here
local myCharacter = CharacterAI.new(myToken) -- Create a new CharacterAI object with your token
local recentCharacters = myCharacter:GetRecentCharacters() -- Get the recent characters
print(recentCharacters) -- Print the table
```


## CharacterAI:SearchCharacters(Query)

This function searches for characters on Character.AI based on a query string. The query can be a name, a category, a keyword or anything else related to the characters[^1^][1].

**Parameters:**

- (string) Query: The query string to search for characters.

**Returns:**

- (table): A table containing the characters that match the query. Each character is a table with fields such as id, name, description, image_url etc. Each character also has methods to interact with them, such as SendMessage(), GetName(), GetImage() etc.

**Example:**

```lua
local CharacterAI = require("CharacterAI") -- Require the library
local myToken = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx" -- Your token goes here
local myCharacter = CharacterAI.new(myToken) -- Create a new CharacterAI object with your token
local searchedCharacters = myCharacter:SearchCharacters("Harry Potter") -- Search for characters related to Harry Potter
print(searchedCharacters) -- Print the table
```


## CharacterAI:GetCharacterByExternalId(external_character_id)

This function returns a character on Character.AI based on an external character id. An external character id is a unique identifier that is assigned to each character by Character.AI[^2^][2].

**Parameters:**

- (string) external_character_id: The external character id of the character to get.

**Returns:**

- (table): A table containing the character information. The character is a table with fields such as id, name, description, image_url etc. The character also has methods to interact with them, such as SendMessage(), GetName(), GetImage() etc.

**Example:**

```lua
local CharacterAI = require("CharacterAI") -- Require the library
local myToken = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx" -- Your token goes here
local myCharacter = CharacterAI.new(myToken) -- Create a new CharacterAI object with your token
local harryPotter = myCharacter:GetCharacterByExternalId("dSo0so5PT_NJXK_QgWOr_V8Gz461c6n-BQdRvS1qjhc") -- Get Joe Biden by his external id
print(harryPotter) -- Print the table
```


## CharacterAI:GetUserInfo()

This function returns information about the user on Character.AI. User information includes fields such as username, avatar_url etc[^3^][3].

**Parameters:**

- None

**Returns:**

- (table): A table containing user information.

**Example:**

```lua
local CharacterAI = require("CharacterAI") -- Require the library
local myToken = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx" -- Your token goes here
local myCharacter = CharacterAI.new(myToken) -- Create a new CharacterAI object with your token
local userInfo = myCharacter:GetUserInfo() -- Get user information 
print(userInfo) -- Print the table 
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
local CharacterAI = require("CharacterAI") -- Require the library
local myToken = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx" -- Your token goes here
local myCharacter = CharacterAI.new(myToken) -- Create a new CharacterAI object with your token
local harryPotter = myCharacter:GetCharacterByExternalId("dSo0so5PT_NJXK_QgWOr_V8Gz461c6n-BQdRvS1qjhc") -- Get Joe Biden character object
print(harryPotter:GetName()) -- Print Joe Biden name 
print(harryPotter:GetCreatorName()) -- Print Joe Biden creator name 
local newChat = harryPotter:NewChat(1) -- Create a new chat session with Joe Biden and store it with key 1
print(newChat) -- Print the chat session information 
local sendMessage = harryPotter:SendMessage(1, "Hello Harry!") -- Send a message to Joe Biden in chat session 1 and get his response 
print(sendMessage) -- Print the message and response information 
local getImage = harryPotter:GetImage() -- Get Joe Biden avatar image 
print(getImage) -- Print Joe Biden avatar image 
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
local CharacterAI = require("CharacterAI") -- Require the library
local myToken = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx" -- Your token goes here
local myCharacter = CharacterAI.new(myToken) -- Create a new CharacterAI object with your token
local newChat = myCharacter:NewChat("dSo0so5PT_NJXK_QgWOr_V8Gz461c6n-BQdRvS1qjhc") -- Create a new chat session with Joe Biden
print(newChat) -- Print the table 
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
local CharacterAI = require("CharacterAI") -- Require the library
local myToken = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx" -- Your token goes here
local myCharacter = CharacterAI.new(myToken) -- Create a new CharacterAI object with your token
local newChat = myCharacter:NewChat("dSo0so5PT_NJXK_QgWOr_V8Gz461c6n-BQdRvS1qjhc") -- Create a new chat session with Harry Potter
local sendMessage = myCharacter:SendMessage("dSo0so5PT_NJXK_QgWOr_V8Gz461c6n-BQdRvS1qjhc", newChat['Body']['external_id'], newChat['Body']['participants'][2]['user']['username'], "Hello Joe!") -- Send a message to Joe Biden and get his response 
print(sendMessage) -- Print the table 
```
