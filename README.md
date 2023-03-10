## Getting Started!

This section will help you get started with CharacterAI-Luau, a library that allows you to interact with the Character.AI API. The Character.AI API allows you to create conversational chatbots with different personalities based on famous characters or your own creations.

### Introduction

CharacterAI-Luau is a library written in Lua that provides an easy way to use the Character.AI API in your Roblox games or scripts. With CharacterAI-Luau, you can create immersive and engaging chatbots that can respond to user input, generate images, play games and more. You can choose from a variety of characters available on Character.AI or create your own custom characters.

### Requirements

To use CharacterAI-Luau, you need:

- Luau experience and knowledge
- Obtain a token from the Character.AI website. While this step is optional, it is highly recommended in order to avoid any limitations.
- An internet connection

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
local myCharacter = myCharacter:GetMainPageCharacters().Body.Animals[1] -- Selects Twilight Sparkle
local response = myCharacter:SendMessage("Hi Twilight Sparkle!!!") -- Sends a message to Spongebob
print(response) -- Prints Twilight Sparkle response
```
