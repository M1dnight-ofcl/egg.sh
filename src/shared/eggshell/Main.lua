local eggshell = {};

local CheckForUpdate = function()
    
end

-- CLASS:class (methods: Apply(elm), New(style))
local Class = {};
Class.__index = Class;

function Class.New(style)
    local self = {};
    setmetatable(self, Class);
    local checkValidProperties = function()
        -- ! OLD CHECK (check is now integrated to ":Apply()" method)
        -- local ValidProperties = {
        --     "BorderRadius", "Position", "Size",
        --     "AnchorPoint", "BackgroundColor3",
        --     "BorderColor3", "BackgroundTransparency",
        --     "Size", "Active", "Text"
        -- };
        -- for property, value in pairs(style) do
        --     if not table.find(ValidProperties, property) then
        --         error("invalid property");
        --         return false;
        --     end
        -- end
        return true;
    end
    local checks =
    style
    and type(style)=="table"
    and checkValidProperties();
    -- print(checks)
    if checks then print("checks passed")
    else
        error("please supply valid style property")
    end
    self.Style = style;
    return self;
end

function Class:Apply(element)
    local i=0;
    for property, value in pairs(self.Style) do
        if property=="BorderRadius" then
            local BorderRadItem = Instance.new("UICorner");
            BorderRadItem.Parent = element;
            BorderRadItem.CornerRadius =
                typeof(value)=="UDim"
                and value
                or UDim.new(0,value);
        elseif
            (property=="Position" and typeof(value)=="UDim2") or
            (property=="BackgroundColor3" and typeof(value)=="Color3") or
            (property=="BackgroundTransparency" and typeof(value)=="number") or
            (property=="BorderColor3" and typeof(value)=="Color3") or
            (property=="Active" and typeof(value)=="boolean") or
            (property=="Size" and typeof(value)=="UDim2") or
            (property=="Text" and typeof(value)=="string") or
            (property=="AnchorPoint" and typeof(value)=="Vector2")
            then element[property]=value;
        else error("invalid property") end
        i=i+1;
    end
end


-- NewObject:class ( New(class, name, parent, style) )
local ESGui = {};
ESGui.__index = ESGui;

function ESGui.New(class, name, parent, style)
    local self = {};
    setmetatable(self, ESGui);

    local ValidClasses={
        "Frame", "TextButton", "ImageButton",
        "ImageLabel", "TextBox", "TextLabel"
    }
    if table.find(ValidClasses, class) then
        local NewESGui = Instance.new(class);
        NewESGui.Name = name;
        NewESGui.Parent = parent;
        Class.New(style):Apply(NewESGui);
    else
        error("invalid class");
    end

    return self;
end

CheckForUpdate()

-- export code
eggshell.ESGui=ESGui;
eggshell.Class=Class;
return eggshell;