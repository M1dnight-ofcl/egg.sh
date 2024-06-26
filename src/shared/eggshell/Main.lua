local eggshell = {};
local HttpService = game:GetService("HttpService")

local GH_DEPLOYMENT_URL = "https://m1dnight-ofcl.github.io/egg.sh/current.json";
local VERSION = 0.3;
local FAIL_MSG = "ran into error whilst checking for updates, skipping check";

local CheckForUpdate = function()
    local response;
    local data;
    print("Checking for egg.sh update");
	local status, err = pcall(function()
        response = HttpService:GetAsync(GH_DEPLOYMENT_URL);
        data = HttpService:JSONDecode(response); end);
    if data and status then
        if data.v > VERSION then print("\n------\nThere is a new egg.sh update avaliable\nDownload it at:\nhttps://m1dnight-ofcl.github.io/egg.sh/\n("..VERSION.."->"..data.v..")\n------\n");
        else print("Using latest egg.sh version "..VERSION) end
    else print(FAIL_MSG); end
end

-- CLASS:class (methods: Apply(elm), New(style))
local Class = {};
Class.__index = Class;

function Class.New(style)
    local self = {};
    setmetatable(self, Class);
    local checkValidProperties = function()
        -- ! OLD CHECK (check is now integrated to ":Apply()" method)
        --[[
        local ValidProperties = {
            "BorderRadius", "Position", "Size",
            "AnchorPoint", "BackgroundColor3",
            "BorderColor3", "BackgroundTransparency",
            "Size", "Active", "Text"
        };
        for property, value in pairs(style) do
            if not table.find(ValidProperties, property) then
                error("invalid property");
                return false;
            end 
        end ]]
        return true;
    end
    local checks =
    style
    and type(style)=="table"
    and checkValidProperties();
    -- print(checks)
    if checks then print("checks passed")
    else error("please supply valid style property") end
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
        elseif property=="Padding" then
            local Padding = Instance.new("UIPadding");
            Padding.Parent = element;
            Padding.PaddingBottom =
            typeof(value)=="UDim"
            and value
            or UDim.new(0,value);
            Padding.PaddingLeft =
            typeof(value)=="UDim"
            and value
            or UDim.new(0,value);
            Padding.PaddingTop =
            typeof(value)=="UDim"
            and value
            or UDim.new(0,value); 
            Padding.PaddingRight =
            typeof(value)=="UDim"
            and value
            or UDim.new(0,value);
        elseif property=="Weight" then element.FontFace.Weight = value;
        elseif property=="Display" then
            if value == "List" then
                local myUIList = Instance.new("UIListLayout")
                myUIList.Parent=element;
            end
        elseif
            -- specific required type
            (property=="Position" and typeof(value)=="UDim2") or
            (property=="BackgroundColor3" and typeof(value)=="Color3") or
            (property=="BackgroundTransparency" and typeof(value)=="number") or
            (property=="BorderColor3" and typeof(value)=="Color3") or
            (property=="TextColor3" and typeof(value)=="Color3") or
            (property=="BorderColor3" and typeof(value)=="Color3") or
            (property=="Active" and typeof(value)=="boolean") or
            (property=="RichText" and typeof(value)=="boolean") or
            (property=="TextScaled" and typeof(value)=="boolean") or
            (property=="TextWrapped" and typeof(value)=="boolean") or
            (property=="TextSize" and typeof(value)=="number") or
            (property=="TextStrokeTransparency" and typeof(value)=="number") or
            (property=="Size" and typeof(value)=="UDim2") or
            (property=="Text" and typeof(value)=="string") or
            (property=="AnchorPoint" and typeof(value)=="Vector2") or
            -- unknown type
            (property=="Font")
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
        "ImageLabel", "TextBox", "TextLabel" }
    if table.find(ValidClasses, class) then
        self.Self = Instance.new(class);
        self.Self.Name = name;
        self.Self.Parent = parent;
        Class.New(style):Apply(self.Self);
    else error("invalid class"); end
    return self;
end

-- todo | fix this stupid pos
-- function ESGui:ApplyNewStyle(style) Class.New(style):Apply(self.NewESGui) end

-- check updates
CheckForUpdate()

-- export code
eggshell.ESGui=ESGui;
eggshell.Class=Class;
return eggshell;