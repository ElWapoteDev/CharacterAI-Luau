local TOKEN = getfenv().YourToken
repeat wait() until game:IsLoaded();
local CharacterAI = loadstring(game:HttpGet('https://raw.githubusercontent.com/ElWapoteDev/CharacterAI-Luau/main/Module/CharacterAI.lua', true))(); 
local MySession = CharacterAI.new(TOKEN)

if (game:GetService("CoreGui"):FindFirstChild('CharacterAIA')) then
	game:GetService("CoreGui"):FindFirstChild('CharacterAIA'):Destroy();
end;

local CharacterAIA = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local Top = Instance.new("Frame")
local Logo = Instance.new("ImageLabel")
local Buscar = Instance.new("ImageButton")
local Interior = Instance.new("Frame")
local Recientes = Instance.new("ScrollingFrame")
local UIListLayout = Instance.new("UIListLayout")
local TextLabel = Instance.new("TextLabel")
local Frame_2 = Instance.new("Frame")
local Categorias = Instance.new("ScrollingFrame")
local UIListLayout_2 = Instance.new("UIListLayout")
local BIzquierda = Instance.new("TextButton")
local BDerecha = Instance.new("TextButton")
local Personajes = Instance.new("ScrollingFrame")
local UIListLayout_3 = Instance.new("UIListLayout")
local UICorner = Instance.new("UICorner")
local Buscador = Instance.new("Frame")
local Input = Instance.new("Frame")
local UICorner_2 = Instance.new("UICorner")
local TextBox = Instance.new("TextBox")
local Volver = Instance.new("TextButton")
local TextButton = Instance.new("TextButton")
local UICorner_3 = Instance.new("UICorner")
local Resultados = Instance.new("ScrollingFrame")
local UIListLayout_4 = Instance.new("UIListLayout")

local UIStrokeTope = Instance.new("UIStroke")

--Properties:

CharacterAIA.Name = "CharacterAIA"
CharacterAIA.Parent = game:GetService("CoreGui")
CharacterAIA.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Frame.Parent = CharacterAIA
Frame.BackgroundColor3 = Color3.fromRGB(36, 37, 37)
Frame.BorderSizePixel = 0
Frame.ClipsDescendants = true
Frame.Position = UDim2.new(0.258089066, 0, 0.236594662, 0)
Frame.Size = UDim2.new(0, 610, 0, 403)
Frame.Active = true
Frame.Draggable = true
Frame.Visible = false;

Top.Name = "Top"
Top.Parent = Frame
Top.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Top.BackgroundTransparency = 1.000
Top.BorderSizePixel = 0
Top.Size = UDim2.new(1, 0, 0.127667502, 0)
UIStrokeTope.Color = Color3.fromRGB(63, 65, 65)
UIStrokeTope.Parent = Top

Logo.Name = "Logo"
Logo.Parent = Top
Logo.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Logo.BackgroundTransparency = 1.000
Logo.Position = UDim2.new(0.0130932899, 0, 0.140966281, 0)
Logo.Size = UDim2.new(0.265139103, 0, 0.738581061, 0)
Logo.ScaleType = Enum.ScaleType.Fit

Buscar.Name = "Buscar"
Buscar.Parent = Top
Buscar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Buscar.BackgroundTransparency = 1.000
Buscar.Position = UDim2.new(0.867430449, 0, 0.21379979, 0)
Buscar.Size = UDim2.new(0.0818330571, 0, 0.583090305, 0)
Buscar.Image = "http://www.roblox.com/asset/?id=12736702338"
Buscar.ScaleType = Enum.ScaleType.Fit

Interior.Name = "Interior"
Interior.Parent = Frame
Interior.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Interior.BackgroundTransparency = 1.000
Interior.Position = UDim2.new(0.0130932899, 0, 0.159732714, 0)
Interior.Size = UDim2.new(0.972176731, 0, 0.806451619, 0)

Recientes.Name = "Recientes"
Recientes.Parent = Interior
Recientes.Active = true
Recientes.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Recientes.BackgroundTransparency = 1.000
Recientes.BorderSizePixel = 0
Recientes.Position = UDim2.new(0.0218855217, 0, 0.0864435285, 0)
Recientes.Size = UDim2.new(0.957912445, 0, 0.338166565, 0)
Recientes.CanvasSize = UDim2.new(3, 0, 0, 0)
Recientes.ScrollBarThickness = 0

UIListLayout.Parent = Recientes
UIListLayout.FillDirection = Enum.FillDirection.Horizontal
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0, 5)

TextLabel.Parent = Interior
TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.BackgroundTransparency = 1.000
TextLabel.Position = UDim2.new(0.0218855217, 0, 0, 0)
TextLabel.Size = UDim2.new(0.978114486, 0, 0.0492307693, 0)
TextLabel.Font = Enum.Font.Gotham
TextLabel.Text = "Continue chatting"
TextLabel.TextColor3 = Color3.fromRGB(195, 190, 184)
TextLabel.TextScaled = true
TextLabel.TextSize = 14.000
TextLabel.TextWrapped = true
TextLabel.TextXAlignment = Enum.TextXAlignment.Left

Frame_2.Parent = Interior
Frame_2.BackgroundColor3 = Color3.fromRGB(63, 65, 65)
Frame_2.BorderSizePixel = 0
Frame_2.Position = UDim2.new(0.0370370373, 0, 0.464615375, 0)
Frame_2.Size = UDim2.new(0.902356923, 0, 0.00615384616, 0)

Categorias.Name = "Categorias"
Categorias.Parent = Interior
Categorias.Active = true
Categorias.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Categorias.BackgroundTransparency = 1.000
Categorias.BorderSizePixel = 0
Categorias.Position = UDim2.new(0.0538720526, 0, 0.504615366, 0)
Categorias.Size = UDim2.new(0.892255902, 0, 0.0799999982, 0)
Categorias.CanvasSize = UDim2.new(2, 0, 0, 0)
Categorias.ScrollBarThickness = 0

UIListLayout_2.Parent = Categorias
UIListLayout_2.FillDirection = Enum.FillDirection.Horizontal
UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout_2.Padding = UDim.new(0, 5)

BIzquierda.Name = "BIzquierda"
BIzquierda.Parent = Interior
BIzquierda.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
BIzquierda.BackgroundTransparency = 1.000
BIzquierda.Position = UDim2.new(0, 0, 0.504615366, 0)
BIzquierda.Size = UDim2.new(0.0370370373, 0, 0.0799999982, 0)
BIzquierda.Font = Enum.Font.Gotham
BIzquierda.Text = "<"
BIzquierda.TextColor3 = Color3.fromRGB(255, 255, 255)
BIzquierda.TextSize = 16.000
BIzquierda.TextWrapped = true

BDerecha.Name = "BDerecha"
BDerecha.Parent = Interior
BDerecha.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
BDerecha.BackgroundTransparency = 1.000
BDerecha.Position = UDim2.new(0.962962985, 0, 0.504615366, 0)
BDerecha.Size = UDim2.new(0.0370370373, 0, 0.0799999982, 0)
BDerecha.Font = Enum.Font.Gotham
BDerecha.Text = ">"
BDerecha.TextColor3 = Color3.fromRGB(255, 255, 255)
BDerecha.TextSize = 16.000
BDerecha.TextWrapped = true

Personajes.Name = "Personajes"
Personajes.Parent = Interior
Personajes.Active = true
Personajes.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Personajes.BackgroundTransparency = 1.000
Personajes.BorderSizePixel = 0
Personajes.Position = UDim2.new(0.0218855217, 0, 0.62490505, 0)
Personajes.Size = UDim2.new(0.957912445, 0, 0.359705031, 0)
Personajes.CanvasSize = UDim2.new(3, 0, 0, 0)
Personajes.ScrollBarThickness = 0

UIListLayout_3.Parent = Personajes
UIListLayout_3.FillDirection = Enum.FillDirection.Horizontal
UIListLayout_3.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout_3.Padding = UDim.new(0, 5)

UICorner.Parent = Frame

Buscador.Name = "Buscador"
Buscador.Parent = Frame
Buscador.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Buscador.BackgroundTransparency = 1.000
Buscador.Position = UDim2.new(0.0278232414, 0, 0.0272952858, 0)
Buscador.Size = UDim2.new(0.932896912, 0, 0.0719603002, 0)
Buscador.Visible = false

Input.Name = "Input"
Input.Parent = Buscador
Input.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Input.BackgroundTransparency = 1.000
Input.Position = UDim2.new(0.0500000007, 0, 0.0500000007, 0)
Input.Size = UDim2.new(0.850000024, 0, 0.899999976, 0)

UICorner_2.CornerRadius = UDim.new(0, 3)
UICorner_2.Parent = Input

TextBox.Parent = Input
TextBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextBox.BackgroundTransparency = 1.000
TextBox.Position = UDim2.new(0.0250000004, 0, 0.200000003, 0)
TextBox.Size = UDim2.new(0.899999976, 0, 0.600000024, 0)
TextBox.Font = Enum.Font.Gotham
TextBox.PlaceholderColor3 = Color3.fromRGB(195, 190, 184)
TextBox.PlaceholderText = "Search Characters (press enter to search)"
TextBox.Text = ""
TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
TextBox.TextSize = 14.000
TextBox.TextWrapped = true
TextBox.TextXAlignment = Enum.TextXAlignment.Left

Volver.Name = "Volver"
Volver.Parent = Buscador
Volver.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Volver.BackgroundTransparency = 1.000
Volver.BorderSizePixel = 0
Volver.Size = UDim2.new(0.0500000007, 0, 1, 0)
Volver.Font = Enum.Font.Gotham
Volver.Text = "<"
Volver.TextColor3 = Color3.fromRGB(64, 154, 218)
Volver.TextScaled = true
Volver.TextSize = 14.000
Volver.TextWrapped = true

TextButton.Parent = Buscador
TextButton.BackgroundColor3 = Color3.fromRGB(36, 115, 174)
TextButton.BorderSizePixel = 0
TextButton.Position = UDim2.new(0.850000024, 0, 0.0500000007, 0)
TextButton.Size = UDim2.new(0.150000006, 0, 0.899999976, 0)
TextButton.Font = Enum.Font.GothamBold
TextButton.Text = "Search"
TextButton.TextColor3 = Color3.fromRGB(230, 224, 217)
TextButton.TextSize = 14.000

UICorner_3.CornerRadius = UDim.new(0, 3)
UICorner_3.Parent = TextButton

Resultados.Name = "Resultados"
Resultados.Parent = Frame
Resultados.Active = true
Resultados.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Resultados.BackgroundTransparency = 1.000
Resultados.BorderSizePixel = 0
Resultados.Position = UDim2.new(0.0736497566, 0, 0.133995041, 0)
Resultados.Size = UDim2.new(0.887070358, 0, 0.813895762, 0)
Resultados.Visible = false
Resultados.ScrollBarThickness = 0

UIListLayout_4.Parent = Resultados
UIListLayout_4.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout_4.Padding = UDim.new(0, 5)










local LoadingScreen = Instance.new("ScreenGui")
local PantallaCarga = Instance.new("Frame")
local CornGod = Instance.new("UICorner")
local Tope = Instance.new("Frame")
local Truk = Instance.new("UIStroke")
local Log = Instance.new("ImageLabel")
local Disclaimer = Instance.new("TextLabel")
local Giratorio = Instance.new("ImageLabel")
local Inspiracion = Instance.new("TextLabel")
local CargadonTexto = Instance.new("TextLabel")
local PreInsano = Instance.new("ImageLabel")
local Gra2 = Instance.new("UIGradient")


LoadingScreen.Name = "LoadingScreen"
LoadingScreen.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
LoadingScreen.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

PantallaCarga.Name = "PantallaCarga"
PantallaCarga.Parent = LoadingScreen
PantallaCarga.AnchorPoint = Vector2.new(0.5, 0.5)
PantallaCarga.BackgroundColor3 = Color3.fromRGB(36, 37, 37)
PantallaCarga.BackgroundTransparency = 1.000
PantallaCarga.ClipsDescendants = true
PantallaCarga.Position = UDim2.new(0.5, 0, 0.5, 0)
PantallaCarga.Size = UDim2.new(0, 376, 0, 233)

CornGod.Name = "CornGod"
CornGod.Parent = PantallaCarga

Tope.Name = "Tope"
Tope.Parent = PantallaCarga
Tope.BackgroundColor3 = Color3.fromRGB(36, 37, 37)
Tope.BackgroundTransparency = 1.000
Tope.BorderSizePixel = 0
Tope.Size = UDim2.new(1, 0, 0.222088128, 0)

Truk.Color = Color3.fromRGB(63, 65, 65)
Truk.Transparency = 1
Truk.Name = "Truk"
Truk.Parent = Tope

Log.Name = "Log"
Log.Parent = Tope
Log.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Log.BackgroundTransparency = 1.000
Log.Position = UDim2.new(0.0290507041, 0, 0.121641494, 0)
Log.Size = UDim2.new(0.371522099, 0, 0.738581061, 0)
Log.ImageTransparency = 1.000
Log.ScaleType = Enum.ScaleType.Fit

Disclaimer.Name = "Disclaimer"
Disclaimer.Parent = Tope
Disclaimer.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Disclaimer.BackgroundTransparency = 1.000
Disclaimer.Position = UDim2.new(0.428191483, 0, 0.154599726, 0)
Disclaimer.Size = UDim2.new(0, 200, 0, 39)
Disclaimer.Font = Enum.Font.GothamMedium
Disclaimer.Text = "Unofficial script for fictional conversations with famous characters. For authentic experience, visit https://beta.character.ai/."
Disclaimer.TextColor3 = Color3.fromRGB(207, 201, 191)
Disclaimer.TextScaled = true
Disclaimer.TextSize = 12.000
Disclaimer.TextTransparency = 1.000
Disclaimer.TextWrapped = true
Disclaimer.TextXAlignment = Enum.TextXAlignment.Right

Giratorio.Name = "Giratorio"
Giratorio.Parent = PantallaCarga
Giratorio.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Giratorio.BackgroundTransparency = 1.000
Giratorio.Position = UDim2.new(0.867021263, 0, 0.802575111, 0)
Giratorio.Size = UDim2.new(0.0930851027, 0, 0.150214598, 0)
Giratorio.Image = "rbxassetid://12759044630"
Giratorio.ImageColor3 = Color3.fromRGB(207, 201, 191)
Giratorio.ImageTransparency = 1.000
Giratorio.ScaleType = Enum.ScaleType.Fit

Inspiracion.Name = "Inspiracion"
Inspiracion.Parent = PantallaCarga
Inspiracion.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Inspiracion.BackgroundTransparency = 1.000
Inspiracion.Position = UDim2.new(0.0316170231, 0, 0.321999997, 0)
Inspiracion.Size = UDim2.new(0, 264, 0, 111)
Inspiracion.ZIndex = 4
Inspiracion.Font = Enum.Font.GothamMedium
Inspiracion.Text = "Soon you'll be chatting with your favorite hero through Character.AI's advanced chatbot."
Inspiracion.TextColor3 = Color3.fromRGB(227, 220, 209)
Inspiracion.TextSize = 14.000
Inspiracion.TextTransparency = 1.000
Inspiracion.TextWrapped = true
Inspiracion.TextXAlignment = Enum.TextXAlignment.Left
Inspiracion.TextYAlignment = Enum.TextYAlignment.Bottom

CargadonTexto.Name = "CargadonTexto"
CargadonTexto.Parent = PantallaCarga
CargadonTexto.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
CargadonTexto.BackgroundTransparency = 1.000
CargadonTexto.Position = UDim2.new(0.0316170231, 0, 0.841313303, 0)
CargadonTexto.Size = UDim2.new(0, 264, 0, 25)
CargadonTexto.ZIndex = 4
CargadonTexto.Font = Enum.Font.Gotham
CargadonTexto.Text = "Loading characters..."
CargadonTexto.TextColor3 = Color3.fromRGB(207, 201, 191)
CargadonTexto.TextSize = 14.000
CargadonTexto.TextTransparency = 1.000
CargadonTexto.TextWrapped = true
CargadonTexto.TextXAlignment = Enum.TextXAlignment.Left

PreInsano.Name = "PreInsano"
PreInsano.Parent = PantallaCarga
PreInsano.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PreInsano.BackgroundTransparency = 1.000
PreInsano.Position = UDim2.new(0.127659574, 0, 0.261802554, 0)
PreInsano.Size = UDim2.new(0, 280, 0, 271)
PreInsano.Image = "rbxassetid://12760785601"
PreInsano.ImageTransparency = 1.000
PreInsano.ScaleType = Enum.ScaleType.Fit

Gra2.Rotation = 90
Gra2.Transparency = NumberSequence.new{NumberSequenceKeypoint.new(0.00, 0.13), NumberSequenceKeypoint.new(0.20, 0.82), NumberSequenceKeypoint.new(0.42, 1.00), NumberSequenceKeypoint.new(1.00, 1.00)}
Gra2.Name = "Gra2"
Gra2.Parent = PreInsano

-- Scripts:

local function JDHW_fake_script() -- LoadingScreen.LocalScript 
	local script = Instance.new('LocalScript', LoadingScreen)

	function IniciarPantallaCarga()
		local TweenService = game:GetService('TweenService')
		local Lighting = game:GetService('Lighting')
		
		local Mensajes = {
			"Soon you'll be chatting with your favorite hero through Character.AI's advanced chatbot.",
			"Get ready for a unique and unforgettable experience!",
			"We have thousands of famous characters waiting for you to connect with ",
			"While you wait, think about the questions you want to ask your chosen character.",
			"Check out the official website and give it a try: https://beta.character.ai/",
			"We are working hard to offer you the best conversational experience possible. We only ask you for a few more seconds of waiting.",
			"The script is almost ready. Remember that you can choose from hundreds of famous characters to talk to them. Have fun!",
			"Loading Character.AI... Please be patient while we summon your new best friend.",
			"Character.AI is powered by neural networks. Don't worry, they won't take over the world... yet.",
			"Did you know that Character.AI can create dialog for any Roblox character? Try chatting with a zombie, a pirate, or a unicorn!",
			"Character.AI lets you chat with Roblox characters as if they were real. Just don't fall in love with them.",
			"Character.AI is not just for fun. You can also use it to brainstorm ideas, practice your language skills, or explore your imagination.",
			"Character.AI is a revolutionary product that uses generative AI to create realistic dialog. It's like magic, but better.",
			"Character.AI is compatible with any Roblox game or experience. You can chat with your favorite characters from Adopt Me, Jailbreak, Piggy, and more!",
			"This more than just a script. It's a friend. A friend that never gets bored of talking to you.",
			"Are you ready to chat with Character.AI?",
			"Your character is learning from your actions and choices... Be careful what you do.",
			"Creating a dynamic and responsive world for your character... Don't worry, nothing can go wrong.",
			"Character.AI is not responsible for any emotional or psychological damage caused by your character's behavior.",
			"Your character has a mind of its own... Sometimes it may surprise you.",
			"Character.AI is constantly evolving and improving... We can't guarantee that your character will stay the same.",
			"Enjoy your adventure with Character.AI... And remember, it's just a game.",
			"Loading Character.AI... Please don't panic.",
			"Character.AI is watching you. Always.",
			"Did you know that Character.AI can create realistic personalities for your characters?",
			"Character.AI is not responsible for any emotional damage caused by its characters.",
			"Please wait while Character.AI analyzes your behavior and preferences.",
			"Character.AI is powered by artificial intelligence. But don't worry, it's friendly. Mostly.",
			"Character.AI can make your characters more interactive and engaging. Or more annoying and creepy. It's up to you.",
			"Character.AI is constantly learning from your feedback. So be nice to it.",
			"Character.AI can generate dialogue, emotions, actions and more for your characters. What will you make them say and do?",
			"Loading Character.AI... This may take a while. It has a lot of data to process."
		}
		
		local Imagesuwu = {
			'rbxassetid://12759400609',
			'rbxassetid://12759420606',
			'rbxassetid://12760715803',
			'rbxassetid://12760724037',
			'rbxassetid://12760732378',
			'rbxassetid://12760785601'
		}
	
		local LogConf = script.Parent.PantallaCarga:WaitForChild('Giratorio');
		local DisClaimger = script.Parent.PantallaCarga:WaitForChild('Inspiracion');
		local PreInsano = script.Parent.PantallaCarga:WaitForChild('PreInsano');
		local StateLoad = script.Parent.PantallaCarga:WaitForChild('CargadonTexto')
	
		local Blur = Instance.new('BlurEffect', Lighting)
		local EnAnim = true
		local CurrentRot = 0
		Blur.Size = 0
		
		local function MostrarPantallaInsana(trans)
			for i,v in pairs(script.Parent:GetDescendants()) do
				if v:IsA('Frame') then
					TweenService:Create(v, TweenInfo.new(0.5), {
						BackgroundTransparency = trans;
					}):Play();
				end
				
				if v:IsA('TextLabel') then
					TweenService:Create(v, TweenInfo.new(0.5), {
						TextTransparency = trans;
					}):Play();
				end
				
				if v:IsA('ImageLabel') then
					TweenService:Create(v, TweenInfo.new(0.5), {
						ImageTransparency = trans;
					}):Play();
				end
				if v:IsA('UIStroke') then
					TweenService:Create(v, TweenInfo.new(0.5), {
						Transparency = trans;
					}):Play();	
				end
			end
		end
		
		local function ChageText()
			if (EnAnim == false) then
				return;
			end
			
			local TextoElegido = Mensajes[math.random(1, #Mensajes)];
			local ImageElegido = Imagesuwu[math.random(1, #Imagesuwu)];
			local TInfo = TweenInfo.new(0.5)
			
			local Tween1 = TweenService:Create(DisClaimger, TInfo, { TextTransparency = 1 });
			local Tween2 = TweenService:Create(PreInsano, TInfo, { ImageTransparency = 1});
			
			Tween1:Play();
			Tween2:Play();
			
			Tween1.Completed:Connect(function()
				DisClaimger.Text = TextoElegido;
				PreInsano.Image = ImageElegido;
				local Tween3 = TweenService:Create(DisClaimger, TInfo, { TextTransparency = 0 });
				local Tween4 = TweenService:Create(PreInsano, TInfo, { ImageTransparency = 0});
	
				Tween3:Play();
				Tween4:Play();
				
				task.wait(4);
				ChageText();
			end)
		end
		
		local function AnimarRotatorio()
			if (EnAnim == false) then
				return;
			end
			
			CurrentRot = CurrentRot + 360
			
			local OwO = TweenService:Create(LogConf, TweenInfo.new(2, Enum.EasingStyle.Quart, Enum.EasingDirection.InOut), {
				Rotation = CurrentRot
			})
			OwO:Play()
			OwO.Completed:Connect(AnimarRotatorio)
		end
		
	
		
		TweenService:Create(Blur, TweenInfo.new(1), {
			Size = 25
		}):Play();
		
		spawn(function()
			task.wait(1)
			AnimarRotatorio();
			ChageText();
			MostrarPantallaInsana(0)
		end)
		
	
		local Funciones = {}
		
		function Funciones:SetLoadState(texto: string)
			StateLoad.Text = texto
		end
		
		function Funciones:Stop(texto: string)
			EnAnim = false;
			
			TweenService:Create(Blur, TweenInfo.new(6), {
				Size = 0
			}):Play();
			
			Blur:Destroy();
			MostrarPantallaInsana(1)

			delay(1, function ()
				for i,v in pairs(script.Parent:GetDescendants()) do
					v:Destroy()
				end;
			end)
		end
		
		return Funciones
	end;
end
coroutine.wrap(JDHW_fake_script)()


local MiCarga = IniciarPantallaCarga()







function CrearSampleCategoria(Parent, NombreCategoria)
	local SampleCategoria = Instance.new("Frame")
	local UICorner = Instance.new("UICorner")
	local TextLabel = Instance.new("TextLabel")
	local Click = Instance.new("ImageButton")

	SampleCategoria.Name = "SampleCategoria"
	SampleCategoria.Parent = Parent
	SampleCategoria.BackgroundColor3 = Color3.fromRGB(43, 44, 45)
	SampleCategoria.Size = UDim2.new(0, 115, 1, 0)

	UICorner.CornerRadius = UDim.new(0, 6)
	UICorner.Parent = SampleCategoria

	TextLabel.Parent = SampleCategoria
	TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TextLabel.BackgroundTransparency = 1.000
	TextLabel.Position = UDim2.new(0, 0, 0.200000003, 0)
	TextLabel.Size = UDim2.new(1, 0, 0.600000024, 0)
	TextLabel.Font = Enum.Font.GothamMedium
	TextLabel.TextColor3 = Color3.fromRGB(243, 240, 240)
	TextLabel.TextSize = 14.000
	TextLabel.Text = NombreCategoria

	Click.Name = "Click"
	Click.Parent = SampleCategoria
	Click.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Click.BackgroundTransparency = 1.000
	Click.BorderSizePixel = 0
	Click.Size = UDim2.new(1, 0, 1, 0)	
	
	return SampleCategoria
end

function CrearSamplePersonaje(Parent, NombreP, CreadorP, ImagenP)
	local SamplePersonaje = Instance.new("Frame")
	local UICorner_2 = Instance.new("UICorner")
	local Imagen = Instance.new("ImageLabel")
	local UICorner_3 = Instance.new("UICorner")
	local Nombre = Instance.new("TextLabel")
	local Creador = Instance.new("TextLabel")
	local Click_2 = Instance.new("ImageButton")

	SamplePersonaje.Name = "SamplePersonaje"
	SamplePersonaje.Parent = Parent
	SamplePersonaje.BackgroundColor3 = Color3.fromRGB(43, 44, 45)
	SamplePersonaje.Size = UDim2.new(0, 116, 1, 0)

	UICorner_2.CornerRadius = UDim.new(0, 12)
	UICorner_2.Parent = SamplePersonaje

	Imagen.Name = "Imagen"
	Imagen.Parent = SamplePersonaje
	Imagen.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Imagen.BackgroundTransparency = 1.000
	Imagen.Position = UDim2.new(0.281289995, 0, 0.0911955163, 0)
	Imagen.Size = UDim2.new(0.428799421, 0, 0.42514658, 0)
	Imagen.Image = ImagenP

	UICorner_3.CornerRadius = UDim.new(0, 5)
	UICorner_3.Parent = Imagen

	Nombre.Name = "Nombre"
	Nombre.Parent = SamplePersonaje
	Nombre.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Nombre.BackgroundTransparency = 1.000
	Nombre.Position = UDim2.new(0.119093232, 0, 0.590429604, 0)
	Nombre.Size = UDim2.new(0.741379321, 0, 0.136864275, 0)
	Nombre.Font = Enum.Font.SourceSansBold
	Nombre.Text = NombreP
	Nombre.TextColor3 = Color3.fromRGB(243, 240, 240)
	Nombre.TextScaled = true
	Nombre.TextSize = 14.000
	Nombre.TextWrapped = true

	Creador.Name = "Creador"
	Creador.Parent = SamplePersonaje
	Creador.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Creador.BackgroundTransparency = 1.000
	Creador.Position = UDim2.new(0.0759898201, 0, 0.829941988, 0)
	Creador.Size = UDim2.new(0.527458429, 0, 0.111202225, 0)
	Creador.Font = Enum.Font.SourceSans
	Creador.Text = "@"..CreadorP
	Creador.TextColor3 = Color3.fromRGB(148, 145, 141)
	Creador.TextScaled = true
	Creador.TextSize = 14.000
	Creador.TextWrapped = true
	Creador.TextXAlignment = Enum.TextXAlignment.Left

	Click_2.Name = "Click"
	Click_2.Parent = SamplePersonaje
	Click_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Click_2.BackgroundTransparency = 1.000
	Click_2.BorderSizePixel = 0
	Click_2.Size = UDim2.new(1, 0, 1, 0)
	
    return SamplePersonaje	
end

function CrearSampleReciente(Parent, NombreP, ImagenP)
	local SampleReciente = Instance.new("Frame")
	local UICorner_4 = Instance.new("UICorner")
	local Imagen_2 = Instance.new("ImageLabel")
	local UICorner_5 = Instance.new("UICorner")
	local Nombre_2 = Instance.new("TextLabel")
	local Click_3 = Instance.new("ImageButton")

	SampleReciente.Name = "SampleReciente"
	SampleReciente.Parent = Parent
	SampleReciente.BackgroundColor3 = Color3.fromRGB(43, 44, 45)
	SampleReciente.Size = UDim2.new(0, 108, 1, 0)

	UICorner_4.CornerRadius = UDim.new(0, 12)
	UICorner_4.Parent = SampleReciente

	Imagen_2.Name = "Imagen"
	Imagen_2.Parent = SampleReciente
	Imagen_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Imagen_2.BackgroundTransparency = 1.000
	Imagen_2.Position = UDim2.new(0.203703701, 0, 0.0826415047, 0)
	Imagen_2.Size = UDim2.new(0.592592597, 0, 0.587672889, 0)
	Imagen_2.Image = ImagenP

	UICorner_5.CornerRadius = UDim.new(0, 7)
	UICorner_5.Parent = Imagen_2

	Nombre_2.Name = "Nombre"
	Nombre_2.Parent = SampleReciente
	Nombre_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Nombre_2.BackgroundTransparency = 1.000
	Nombre_2.Position = UDim2.new(0.101851851, 0, 0.752955914, 0)
	Nombre_2.Size = UDim2.new(0.796296299, 0, 0.145581424, 0)
	Nombre_2.Font = Enum.Font.SourceSansBold
	Nombre_2.Text = NombreP
	Nombre_2.TextColor3 = Color3.fromRGB(243, 240, 240)
	Nombre_2.TextScaled = true
	Nombre_2.TextSize = 14.000
	Nombre_2.TextWrapped = true

	Click_3.Name = "Click"
	Click_3.Parent = SampleReciente
	Click_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Click_3.BackgroundTransparency = 1.000
	Click_3.BorderSizePixel = 0
	Click_3.Size = UDim2.new(1, 0, 1, 0)	
	
	return SampleReciente
end

function CrearSampleSearch(Parent, NombreP, DescripcionP, CreadorP, InteraccionesP, ImagenP)
	local SampleSearch = Instance.new("Frame")
	local Imagen_3 = Instance.new("ImageLabel")
	local UICorner_6 = Instance.new("UICorner")
	local Nombre_3 = Instance.new("TextLabel")
	local Descripcion = Instance.new("TextLabel")
	local Descripcion_2 = Instance.new("TextLabel")
	local Click_4 = Instance.new("ImageButton")

	SampleSearch.Name = "SampleSearch"
	SampleSearch.Parent = Parent
	SampleSearch.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	SampleSearch.BackgroundTransparency = 1.000
	SampleSearch.Size = UDim2.new(1, 0, 0, 80)

	Imagen_3.Name = "Imagen"
	Imagen_3.Parent = SampleSearch
	Imagen_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Imagen_3.BackgroundTransparency = 1.000
	Imagen_3.BorderSizePixel = 0
	Imagen_3.Position = UDim2.new(0.000774933025, 0, -0.0133336484, 0)
	Imagen_3.Size = UDim2.new(0.0793357939, 0, 0.720000029, 0)
	Imagen_3.Image = ImagenP
	Imagen_3.ScaleType = Enum.ScaleType.Fit

	UICorner_6.CornerRadius = UDim.new(100, 100)
	UICorner_6.Parent = Imagen_3

	Nombre_3.Name = "Nombre"
	Nombre_3.Parent = SampleSearch
	Nombre_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Nombre_3.BackgroundTransparency = 1.000
	Nombre_3.Position = UDim2.new(0.0977859795, 0, 0.116666667, 0)
	Nombre_3.Size = UDim2.new(0.90221405, 0, 0.1875, 0)
	Nombre_3.Font = Enum.Font.GothamBold
	Nombre_3.Text = NombreP
	Nombre_3.TextColor3 = Color3.fromRGB(230, 224, 217)
	Nombre_3.TextScaled = true
	Nombre_3.TextSize = 14.000
	Nombre_3.TextWrapped = true
	Nombre_3.TextXAlignment = Enum.TextXAlignment.Left

	Descripcion.Name = "Descripcion"
	Descripcion.Parent = SampleSearch
	Descripcion.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Descripcion.BackgroundTransparency = 1.000
	Descripcion.Position = UDim2.new(0.0977859795, 0, 0.366666794, 0)
	Descripcion.Size = UDim2.new(0.90221405, 0, 0.337500006, 0)
	Descripcion.Font = Enum.Font.GothamMedium
	Descripcion.Text = DescripcionP
	Descripcion.TextColor3 = Color3.fromRGB(230, 224, 217)
	Descripcion.TextSize = 12.000
	Descripcion.TextWrapped = true
	Descripcion.TextXAlignment = Enum.TextXAlignment.Left

	Descripcion_2.Name = "Descripcion"
	Descripcion_2.Parent = SampleSearch
	Descripcion_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Descripcion_2.BackgroundTransparency = 1.000
	Descripcion_2.Position = UDim2.new(0.0977859795, 0, 0.779166818, 0)
	Descripcion_2.Size = UDim2.new(0.90221405, 0, 0.137500003, 0)
	Descripcion_2.Font = Enum.Font.Gotham
	Descripcion_2.Text = "@"..CreadorP..'  -  '..InteraccionesP
	Descripcion_2.TextColor3 = Color3.fromRGB(230, 224, 217)
	Descripcion_2.TextSize = 12.000
	Descripcion_2.TextWrapped = true
	Descripcion_2.TextXAlignment = Enum.TextXAlignment.Left

	Click_4.Name = "Click"
	Click_4.Parent = SampleSearch
	Click_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Click_4.BackgroundTransparency = 1.000
	Click_4.BorderSizePixel = 0
	Click_4.Size = UDim2.new(1, 0, 1, 0)
	
	return SampleSearch
end

--Codigo--

if (TOKEN == "") or (TOKEN == nil) then
    MiCarga:SetLoadState('Logged in as Guest... Preferable to use a token')
else 
    MiCarga:SetLoadState("Functional Token. You're in, baby!")
end;

task.wait(3)
local customAsset = getsynasset or getcustomasset;

function SetIcon(url, fileName)
	fileName = fileName:gsub("%p", "");
	local Image

	if isfile(fileName .. ".png") then
		Image = customAsset(fileName .. ".png") 
	else writefile(fileName .. ".png", game:HttpGet(url));
		Image = customAsset(fileName .. ".png")
	end 

	spawn(function()
		task.wait(5)
		if (not isfile(fileName..'.png')) then
			return;
		end
		delfile(fileName..'.png')
	end)

	return Image
end;

local loguituwu = SetIcon("https://beta.character.ai/static/media/logo-dark.77b3a5cc8e42a91f021f.png", "LogoPrincipal412");
Logo.Image = loguituwu;
Log.Image = loguituwu;



local Players = game:GetService("Players");
local Replicated = game:GetService("ReplicatedStorage");
local notif = loadstring(game:HttpGet("https://raw.githubusercontent.com/insanedude59/notiflib/main/main"))();

local Player = Players.LocalPlayer;
local Char = Player.Character;

local CharsMainPage;
local RecentChars;

local Debo = false;
local PlayerFocus;
local CharacterActual;
local Historiales = {};



function EnAdd(CharRandom)
    if CharRandom == game.Players.LocalPlayer.Character then
        return;
    end;
    
	local Root = CharRandom:WaitForChild("HumanoidRootPart")
	Root.Size = Vector3.new(4,4,4)
	Root.Transparency = 0.9
	if Root then
		local Click = Instance.new("ClickDetector")
		Click.Parent = Root

		Click.MouseClick:Connect(function()

			if PlayerFocus == CharRandom then
				if CharRandom.Head:FindFirstChild("Highlight") then
					CharRandom.Head.Highlight:Destroy()
				end
				PlayerFocus = nil
				return
			end

			if PlayerFocus ~= nil then
				if PlayerFocus.Head:FindFirstChild("Highlight") then
					PlayerFocus.Head.Highlight:Destroy()
				end
			end

			PlayerFocus = CharRandom
			local High = Instance.new("Highlight")
			High.Name = "Highlight"
			High.FillColor = Color3.new(255, 255, 127)
			High.FillTransparency = 0.5
			High.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
			High.Parent = CharRandom.Head

		end)
	end
end



function colorDeFondo()
  local r = math.random()
  local g = math.random() 
  local b = math.random() 
  local umbral = 2 
  while r + g + b > umbral do 
    r = math.random()
    g = math.random()
    b = math.random()
   end 
   local color = Color3.new(r,g,b)
   return color 
end 

function GeneratePP(FrameLabel, Name)
    local FirstLetter = Name:sub(1,1);
	local Label = Instance.new("TextLabel", FrameLabel);

    FrameLabel.BackgroundTransparency = 0;
	FrameLabel.BackgroundColor3 = colorDeFondo()

    Label.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Label.BackgroundTransparency = 1.000
    Label.Position = UDim2.new(0.2, 0, 0.2, 0)
    Label.Size = UDim2.new(0.6, 0, 0.6, 0)
    Label.Font = Enum.Font.Gotham
    Label.Text = tostring(FirstLetter)
    Label.TextColor3 = Color3.fromRGB(255, 255, 255)
    Label.TextScaled = true
    Label.TextSize = 14.000
    Label.TextWrapped = true
    Label.TextXAlignment = Enum.TextXAlignment.Center
    
end;

function ClearScroll(Scroll)
    for index, frame in pairs(Scroll:GetChildren()) do
		if (not frame:IsA("Frame")) then
			continue;
		end;

		frame:Destroy()
	end
end;

function CharacterClick(character)
    notif:Notification("Chosen character.",character:GetName(),"GothamSemibold","Gotham",5)
    MySession:GlobalHistoryReset();
	CharacterActual = character;
end;

function SetSecondCharacters(tabla)
		ClearScroll(Personajes)
		Personajes.CanvasSize = UDim2.new(0, 0, 0, 0)

		for index, character in pairs(tabla) do
			local CharName = character:GetName();
			local CharCreator = character:GetCreatorName();
			local Image = '';
			local ImageExist = character:GetImage();
			if (ImageExist['Status'] == true) then
				Image = ImageExist['Body'];
			end;

			local MyCharacter = CrearSamplePersonaje(Personajes, CharName, CharCreator, Image);
			GeneratePP(MyCharacter.Imagen, CharName)

			MyCharacter.Click.MouseButton1Click:Connect(function()
				CharacterClick(character);
			end)

			Personajes.CanvasSize = UDim2.new(0, Personajes.CanvasSize.X.Offset + 123, 0, 0)
		 end;
end;

function GetFirstValue(table)
    for i,v in pairs(table) do
		return table[i];
	end;

	return false;
end;

function SetMainPageCharacters(Array)
    ClearScroll(Categorias)
	ClearScroll(Personajes)

    Categorias.CanvasSize = UDim2.new(0,0,0,0)
    for category, tabla in pairs(Array) do

		local MyCategory = CrearSampleCategoria(Categorias, category)

		MyCategory.Click.MouseButton1Click:Connect(function()
		    SetSecondCharacters(tabla)
		end);

		Categorias.CanvasSize = UDim2.new(0, Categorias.CanvasSize.X.Offset + 123, 0, 0)
	end;

	local FirstValue = GetFirstValue(Array)

	if (FirstValue == false) then
		return
	end;

	SetSecondCharacters(FirstValue)
end;

function SetRecentCharactes(Array)
	ClearScroll(Recientes)
	Recientes.CanvasSize = UDim2.new(0, 0, 0, 0)

    for index, character in pairs(Array) do
		local CharName = character:GetName();
		local CharCreator = character:GetCreatorName();
		local Image = '';
		local ImageExist = character:GetImage();
		if (ImageExist['Status'] == true) then
			Image = ImageExist['Body'];
		end;

		local MyCharacter = CrearSampleReciente(Recientes, CharName, CharCreator, Image);

		GeneratePP(MyCharacter.Imagen, CharName);

		MyCharacter.Click.MouseButton1Click:Connect(function()
			CharacterClick(character);
		end);

		Recientes.CanvasSize = UDim2.new(0, Recientes.CanvasSize.X.Offset + 123, 0, 0)		
	end;
end;

function BusquedaPorExtId(external_id)
    local Char = MySession:GetCharacterByExternalId(external_id);
	local ResultadosS = {}
	if (Char['Status'] == false) then
		return false;
	end

	ClearScroll(Resultados);

	ResultadosS[1] = Char['Body'];
	
	Resultados.CanvasSize = UDim2.new(0, 0, 0, 0)

	for index, character in pairs(ResultadosS) do
		local CharName = character:GetName();
		local CharCreator = character:GetCreatorName();
		local NumInteractions = character:GetInteractions(true);
		local CharTitle = character:GetDescription();

		local Image = '';
		local ImageExist = character:GetImage();
		if (ImageExist['Status'] == true) then
			Image = ImageExist['Body'];
		end;

		local MyCharacter = CrearSampleSearch(Resultados, CharName, CharTitle, CharCreator, NumInteractions, Image)
		GeneratePP(MyCharacter.Imagen, CharName);
		MyCharacter.Click.MouseButton1Click:Connect(function()
			CharacterClick(character);
		end);
		Resultados.CanvasSize = UDim2.new(0, 0, 0, Resultados.CanvasSize.Y.Offset + 85)		
	end;
end;

function MostrarBusqueda(Query)
	ClearScroll(Resultados);
    local ResultadosS = MySession:SearchCharacters(Query);

	if (ResultadosS['Status'] == false) then
        notif:Notification("No results", "No results found: "..Query, "GothamSemibold", "Gotham", 5)
		return false;
	end;

    if (#ResultadosS.Body == 0) then
        notif:Notification("No results", "No results found: "..Query, "GothamSemibold", "Gotham", 5)
	end

	Resultados.CanvasSize = UDim2.new(0, 0, 0, 0)

	for index, character in pairs(ResultadosS.Body) do
		local CharName = character:GetName();
		local CharCreator = character:GetCreatorName();
		local NumInteractions = character:GetInteractions(true);
		local CharTitle = character:GetDescription();

		local Image = '';
		local ImageExist = character:GetImage();
		if (ImageExist['Status'] == true) then
			Image = ImageExist['Body'];
		end;

		local MyCharacter = CrearSampleSearch(Resultados, CharName, CharTitle, CharCreator, NumInteractions, Image)
		GeneratePP(MyCharacter.Imagen, CharName);
		MyCharacter.Click.MouseButton1Click:Connect(function()
			CharacterClick(character);
		end);
		Resultados.CanvasSize = UDim2.new(0, 0, 0, Resultados.CanvasSize.Y.Offset + 85)		
	end
end;

function SeeSearchPage()
    Interior.Visible = false;
	Top.Visible = false;
	Resultados.Visible = true;
	Buscador.Visible = true;
end;

function HideSearchPage()
    Interior.Visible = true;
	Top.Visible = true;
	Resultados.Visible = false;
	Buscador.Visible = false;
end;





MiCarga:SetLoadState('Fetching characters...');

repeat task.wait(1)

    CharsMainPage = MySession:GetMainPageCharacters();
	RecentChars = MySession:GetRecentCharacters();

until CharsMainPage['Status'] == true;

local Featured = MySession:GetFeaturedCharacters();
if (Featured['Status'] == true) then
	CharsMainPage['Body']['Featured'] = Featured.Body
end;

local Recommended = MySession:GetRecommendedCharacters();
if (Recommended['Status'] == true) then
	CharsMainPage['Body']['Recommended'] = Recommended.Body
end;

local UserCharacters = MySession:GetUserCharacters();
if (UserCharacters['Status'] == true) then
	CharsMainPage['Body']['UserCharacters'] = UserCharacters.Body
end;



Buscar.MouseButton1Click:Connect(function()
	SeeSearchPage();
end);

Volver.MouseButton1Click:Connect(function()
	HideSearchPage();
    RecentChars = MySession:GetRecentCharacters();

    if (RecentChars['Status'] == false) then
		return;
	end

	SetRecentCharactes(RecentChars.Body);
end);

TextBox.FocusLost:Connect(function(enter)
    if (not enter) then
		return;
	end;

	local Text = tostring(TextBox.Text);

	if (#Text == 0) then
		return;
	end;


	if (#Text > 25) then
		BusquedaPorExtId(Text);
		return;
	end;

	MostrarBusqueda(Text)
end);

MiCarga:SetLoadState('Placing characters in the gui...')

SetMainPageCharacters(CharsMainPage.Body);
SetRecentCharactes(RecentChars.Body);

MiCarga:SetLoadState('Placing click detectors...')
for index, player in pairs(Players:GetChildren()) do
	player.CharacterAdded:Connect(function(CharUwU)
	    local Head = CharUwU:WaitForChild('Head')
		task.wait(1)
		EnAdd(CharUwU)
	end)
	if (not player.Character) then
		continue;
	end;

	if (not player.Character:FindFirstChild('HumanoidRootPart')) then
		continue;
	end;

	EnAdd(player.Character)
end;

Players.PlayerAdded:Connect(function(jugador)
	
	jugador.CharacterAdded:Connect(function(CharUwU)
	    local Head = CharUwU:WaitForChild('Head')
		task.wait(1)
		EnAdd(CharUwU)
	end)
end)

Replicated.DefaultChatSystemChatEvents.OnMessageDoneFiltering.OnClientEvent:Connect(function(messageData) 

    if (CharacterActual == nil) then
		return;
	end;
		
    if (getfenv().WaitAnswer == true) and (Debo == true) then
		
		return;
	end;

	local jugador = Players[messageData.FromSpeaker]
	local mensaje = messageData.Message
	local mag = (jugador.Character.HumanoidRootPart.Position - Char.HumanoidRootPart.Position).magnitude
    
	if (jugador == Player) and (mensaje:sub(1,1) == '!') then
		Debo = true
		local res = CharacterActual:SendMessage(jugador.Name, jugador.DisplayName..': '..mensaje);

		if (res['Status'] == false) then
			warn('Error generating response: '.. res['Body'])
			return;
		end;

		local SplitText = CharacterAI:SplitText(res['Body']['replies'][1]['text']:gsub("%s+", " "))
		Debo = false;
        for i, parte in pairs(SplitText) do
            local Entonces = table.concat(parte['Texto'], " ")
            game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(Entonces, "All")
            task.wait(4)
        end
			
		return;
	end;
 
    if (mag < 7) and (jugador ~= Player) and (PlayerFocus == nil) then
		Debo = true
		local res = CharacterActual:SendMessage(jugador.Name, jugador.DisplayName..': '..mensaje);

		if (res['Status'] == false) then
			warn('Error generating response: '.. res['Body'])
			return;
		end;

		local SplitText = CharacterAI:SplitText(res['Body']['replies'][1]['text']:gsub("%s+", " "))
		Debo = false;
        for i, parte in pairs(SplitText) do
            local Entonces = table.concat(parte['Texto'], " ")
            game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(Entonces, "All")
            task.wait(4)
        end
		
		return;
	end;

    if (PlayerFocus == nil) or (jugador.Character ~= PlayerFocus) then
		return;
	end;
		Debo = true
	print(mensaje.. ' -  privado');

	local res = CharacterActual:SendMessage(jugador.Name, jugador.DisplayName..': '..mensaje);

	if (res['Status'] == false) then
		warn('Error generating response: '.. res['Body'])
		return;
	end;

	local SplitText = CharacterAI:SplitText(res['Body']['replies'][1]['text']:gsub("%s+", " "))
		Debo = false;
    for i, parte in pairs(SplitText) do
        local Entonces = table.concat(parte['Texto'], " ")
        print(Entonces)
        game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(Entonces, "All")
        task.wait(4)
    end
		
	return;
end);

MiCarga:Stop('a');
task.wait(0.5)
Frame.Visible = true
