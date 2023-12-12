local eggsh = require(game.ReplicatedStorage.Shared.eggshell.Main)

local Div1 = Instance.new("Frame");
Div1.Parent = game.StarterGui.Screen
local style = eggsh.Class.New({
	BorderRadius=5,
})
style:Apply(Div1)