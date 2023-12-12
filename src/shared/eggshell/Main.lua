local eggshell = {};
eggshell.Class = {};
eggshell.Class.__index = eggshell.Class;

function eggshell.Class.New(style)
    local class = {}
    setmetatable(class, eggshell)
    local checkValidProperties = function()
        local ValidProperties = {
            "BorderRadius", "Position", "Size",
            "AnchorPoint", "BackgroundColor3",
            "BorderColor3", "BackgroundTransparency"
        }
        for property, value in pairs(style) do
            if not table.find(ValidProperties, property) then
                error("invalid property")
            end
        end
    end
    if style and type(style)==table and checkValidProperties() then
        print("checks passed")
    else
        error("please supply valid  style property") 
    end
    class.Style = style;

    return class
end

function eggshell.Class:Apply(element)
    local i=0;
    for property, value in pairs(self.Style) do
        if property=="BorderRadius" then
            local BorderRadItem = Instance.new("UICorner");
            BorderRadItem.Parent = element;
            BorderRadItem.CornerRadius = 
                typeof(value)=="UDim" 
                and UDim.new(0,value) 
                or value;
        elseif property=="Position" then
            element.Position = 
            typeof(value)=="UDim2" 
            and UDim2.new(0,value[0],0,value[1]) 
            or value;
        else 
            error("invalid property")
        end
        i=i+1;
    end
end

return eggshell;