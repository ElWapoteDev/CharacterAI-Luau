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
