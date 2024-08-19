local eggsh = require(game.ReplicatedStorage.Shared.eggshell.Main);
local StarterGui = game:GetService("StarterGui");

local Div01 = eggsh.ESGui.New("Frame", "Div01", StarterGui.Screen, {
	BorderRadius=20,
    Display="List",
    Position=UDim2.new(0,15,0,15),
    -- AnchorPoint=Vector2.new(0.5,0.5),
    Size=UDim2.new(0,550,0,250),
    Active=true,
    BackgroundColor3=Color3.fromHex("#111"),
    BackgroundTransparency=.15,
    Padding=10,
    HorizontalAlign="Center",
    VerticalAlign="Center",
});

local Txt01 = eggsh.ESGui.New("TextLabel", "Txt01", Div01.Self, {
	Text="Welcome to Egg.sh",
    RichText=true,
    TextSize=75,
    Weight=Enum.FontWeight.Light,
    Font=Enum.Font.TitilliumWeb,
    Size=UDim2.new(.75,0,0,50),
    BackgroundTransparency=1,
    -- AnchorPoint=Vector2.new(0.5,0.5),
    TextColor3=Color3.fromHex("#fff"),
    -- Position=UDim2.new(.5,0,.5,0),
});

local Txt02 = eggsh.ESGui.New("TextLabel", "Txt02", Div01.Self, {
	Text='"We got CSS in Roblox before GTA 6"',
    RichText=true,
    TextSize=40,
    Weight=Enum.FontWeight.ExtraLight,
    Font=Enum.Font.TitilliumWeb,
    Size=UDim2.new(.75,0,0,50),
    BackgroundTransparency=1,
    -- AnchorPoint=Vector2.new(0.5,0.5),
    TextColor3=Color3.fromHex("#e5e5e5"),
    -- Position=UDim2.new(.5,0,.5,0),
});

local Btn01 = eggsh.ESGui.New("TextButton", "Btn01", Div01.Self, {
	Text='Click Me!',
    RichText=true,
    TextSize=40,
    Weight=Enum.FontWeight.ExtraLight,
    Font=Enum.Font.TitilliumWeb,
    Size=UDim2.new(.75,0,0,50),
    BorderRadius=10,
    -- AnchorPoint=Vector2.new(0.5,0.5),
    TextColor3=Color3.fromHex("#151515"),
    BackgroundColor3=Color3.fromHex("#15e87d"),
    BackgroundTransparency=0,
    -- Position=UDim2.new(.5,0,.5,0),
    --? For future feature
    -- Transition=TweenInfo.new(
        -- .35,
        -- Enum.EasingStyle.Cubic,
        -- Enum.EasingDirection.InOut),
    -- Hover={
        -- BackgroundColor3=Color3.fromHex("#fff"),
        -- TextColor3=Color3.fromHex("#15e87d"),
    -- }
});


-- todo | fix this stupid shit
-- Txt01:ApplyNewStyle({TextSize=5000})