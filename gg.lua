local Players = game:GetService("Players")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "GameUI"
screenGui.ResetOnSpawn = false
screenGui.Parent = playerGui

-- Helper function tạo frame
local function CreateFrame(parent, props)
    local f = Instance.new("Frame")
    for k, v in pairs(props) do f[k] = v end
    f.Parent = parent
    return f
end

-- Helper function tạo label
local function CreateLabel(parent, props)
    local l = Instance.new("TextLabel")
    for k, v in pairs(props) do l[k] = v end
    l.Parent = parent
    return l
end

-- Items UI
local itemsFrame = CreateFrame(screenGui, {
    Name = "ItemsFrame",
    Size = UDim2.new(0, 300, 0, 220),
    Position = UDim2.new(0.5, -150, 0.5, -125),
    BackgroundColor3 = Color3.fromRGB(0,0,0),
    BackgroundTransparency = 0.3,
    BorderSizePixel = 0
})
local itemsStroke = Instance.new("UIStroke")
itemsStroke.Thickness = 2
itemsStroke.Color = Color3.fromRGB(255, 204, 0)
itemsStroke.Parent = itemsFrame

CreateLabel(itemsFrame, {
    Size = UDim2.new(1, 0, 0, 30),
    BackgroundTransparency = 1,
    Text = "Vật phẩm cao cấp",
    Font = Enum.Font.SourceSansBold,
    TextSize = 18,
    TextColor3 = Color3.fromRGB(255, 204, 0)
})

local itemsContent = CreateFrame(itemsFrame, {
    Size = UDim2.new(1, 0, 1, -30),
    Position = UDim2.new(0, 0, 0, 30),
    BackgroundTransparency = 1
})
local itemsLayout = Instance.new("UIListLayout")
itemsLayout.Padding = UDim.new(0, 5)
itemsLayout.Parent = itemsContent

local itemList = {
    "God Human",
    "Cursed Dual Katana",
    "Soul Guitar",
    "Mirror Fractal",
    "Valkyrie Helm"
}

for _, itemName in ipairs(itemList) do
    local itemFrame = CreateFrame(itemsContent, {
        Size = UDim2.new(1, 0, 0, 30),
        BackgroundTransparency = 1
    })
    local box = CreateFrame(itemFrame, {
        Size = UDim2.new(0, 20, 0, 20),
        Position = UDim2.new(0, 5, 0, 5),
        BackgroundColor3 = Color3.fromRGB(255, 0, 0),
        BorderSizePixel = 1,
        BorderColor3 = Color3.fromRGB(0, 0, 0)
    })
    CreateLabel(itemFrame, {
        Size = UDim2.new(1, -30, 1, 0),
        Position = UDim2.new(0, 30, 0, 0),
        BackgroundTransparency = 1,
        Text = itemName,
        Font = Enum.Font.SourceSans,
        TextSize = 16,
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextXAlignment = Enum.TextXAlignment.Left
    })
end

-- Info UI
local infoFrame = CreateFrame(screenGui, {
    Name = "InfoFrame",
    Size = UDim2.new(0, 250, 0, 180),
    Position = UDim2.new(0.5, 70, 0.4, 0),
    BackgroundColor3 = Color3.fromRGB(0, 0, 0),
    BackgroundTransparency = 0.3,
    BorderSizePixel = 0
})
local infoStroke = Instance.new("UIStroke")
infoStroke.Thickness = 2
infoStroke.Color = Color3.fromRGB(255, 204, 0)
infoStroke.Parent = infoFrame

CreateLabel(infoFrame, {
    Size = UDim2.new(1, 0, 0, 30),
    BackgroundTransparency = 1,
    Text = "Thông tin người chơi",
    Font = Enum.Font.SourceSansBold,
    TextSize = 20,
    TextColor3 = Color3.fromRGB(255, 255, 0)
})

local infoContent = CreateFrame(infoFrame, {
    Size = UDim2.new(1, 0, 1, -30),
    Position = UDim2.new(0, 0, 0, 30),
    BackgroundTransparency = 1
})
local infoLayout = Instance.new("UIListLayout")
infoLayout.Padding = UDim.new(0, 5)
infoLayout.Parent = infoContent

local playerLabels = {
    {Name = "PlayerName", Text = "Tên: " .. player.Name},
    {Name = "Level", Text = "Level:"},
    {Name = "Beli", Text = "Beli:"},
    {Name = "Fragments", Text = "Fragments:"},
    {Name = "Race", Text = "Race:"}
}

for _, label in ipairs(playerLabels) do
    local statFrame = CreateFrame(infoContent, {
        Size = UDim2.new(1, 0, 0, 25),
        BackgroundColor3 = Color3.fromRGB(25, 25, 30),
        BackgroundTransparency = 0.8
    })
    CreateLabel(statFrame, {
        Size = UDim2.new(1, -10, 1, 0),
        Position = UDim2.new(0, 10, 0, 0),
        BackgroundTransparency = 1,
        Text = label.Text,
        Font = Enum.Font.SourceSans,
        TextSize = 14,
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextXAlignment = Enum.TextXAlignment.Left
    })
end
