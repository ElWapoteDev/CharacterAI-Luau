**[Go to Complete Documentation 📚](https://github.com/ElWapoteDev/CharacterAI-Luau/blob/main/docs/index.md)**

## Getting Started!

This section will help you get started with CharacterAI-Luau, a library that allows you to interact with the Character.AI API. The Character.AI API allows you to create conversational chatbots with different personalities based on famous characters or your own creations.

### Introduction

CharacterAI-Luau is a library written in Lua that provides an easy way to use the Character.AI API in your Roblox games or scripts. With CharacterAI-Luau, you can create immersive and engaging chatbots that can respond to user input, generate images, play games and more. You can choose from a variety of characters available on Character.AI or create your own custom characters.

### Requirements

To use CharacterAI-Luau, you need:

- Luau experience and knowledge
- Obtain a token from the Character.AI website. While this step is optional, it is highly recommended in order to avoid any limitations.
- An internet connection

### How to get my Character.AI Token?
To obtain your Character.AI token, please follow these steps:

1. Go to the Character.AI website by clicking on this [link](https://beta.character.ai/).
2. Sign in or create an account if you haven't already.
3. Once you are logged in, open the Developer Console by right-clicking anywhere on the page and selecting `Inspect` or `Inspect Element`.
4. In the Developer Console, navigate to the `Application` tab.
5. In the `Application` tab, click on `Local Storage` in the left-hand menu.
6. Under `Local Storage`, you will find `https://beta.character.ai/`. Click on it to expand.
7. Look for the "char_token" key, which should have a JSON value that looks like this: `{"value":"YourTokenHere","ttl":IgnoreThis}`.
8. Copy the `value` of the `char_token` key, which is your Character.AI token.

Congratulations, you have successfully obtained your Character.AI token!


### Installation

To install CharacterAI-Luau, follow these steps:

1. In your script add the following line of code:
```lua
local CharacterAI = loadstring(game:HttpGet('https://raw.githubusercontent.com/ElWapoteDev/CharacterAI-Luau/main/Module/CharacterAI.lua', true))();
```

### Configuration

To configure CharacterAI-Luau, you need to create a new CharacterAI object using local myCharacter = CharacterAI.new(myToken), where myToken is your authentication token from Character.AI website or app. Your authentication token should be a string of random numbers and letters, like this: `14x9f411581z7vF1aRx9Aaf6d70x141jhf0S82cb5` (Example token).

If you don't have a token, you can pass an empty string or nil to access as a guest, but with limitations.

### Basic usage

To use CharacterAI-Luau, you need to select a character to chat with using one of the methods such as `GetCategories()`, `GetMainPageCharacters()`, `SearchCharacters()` etc. Each method returns a table of characters that have fields such as id, name, description, image_url etc.

You can then interact with the character using methods such as `SendMessage()`, which sends a message to the character and returns their response; `GetName()`, which returns the name of the character; `GetImage()`, which returns the image url of the character etc.

For example:

```lua
-- Load the CharacterAI module from a URL
local CharacterAI = loadstring(game:HttpGet('https://raw.githubusercontent.com/ElWapoteDev/CharacterAI-Luau/main/Module/CharacterAI.lua', true))();

-- Create a new session with CharacterAI as a guest, u can put ur token
local MySession = CharacterAI.new()

-- Get the first character from the main page animals category (Twilight Sparkle)
local myCharacter = MySession:GetMainPageCharacters().Body.Animals[1]

-- Send a message to Twilight Sparkle with the key "MyKey"
-- The key is a string that identifies the chat session with Twilight Sparkle
-- We use “MyKey” as our key for this chat session
-- We can use different keys for different chat sessions
local response = myCharacter:SendMessage("MyKey", "Hi Twilight Sparkle!!!")

-- Check if the message was sent successfully
if response['Status'] == false then 
    warn(response.Body) -- If not, print a warning message
end

-- Print only Twilight Sparkle's reply text
print(response.Body.replies[1].text)

-- Print the full table of the response
CharacterAI:printTable(response.Body)
```
