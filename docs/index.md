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
