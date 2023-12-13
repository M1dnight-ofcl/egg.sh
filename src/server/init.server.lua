local eggsh = require(game.ReplicatedStorage.Shared.eggshell.Main)
local StarterGui = game:GetService("StarterGui")

local Div01 = eggsh.ESGui.New("Frame", "Div01", StarterGui.Screen, {
	BorderRadius=20,
    Position=UDim2.new(0,15,0,15),
    -- AnchorPoint=Vector2.new(0.5,0.5),
    Size=UDim2.new(0,550,0,250),
    Active=true,
    BackgroundColor3=Color3.fromHex("#111"),
    BackgroundTransparency=.15,
    Padding=10,
})

local Txt01 = eggsh.ESGui.New("TextLabel", "Txt01", StarterGui.Screen.Div01, {
	Text="Test UI",
    TextSize=35,
    TextColor3=Color3.fromHex("#fff"),
    Position=UDim2.new(.5,0,.5,0),
})