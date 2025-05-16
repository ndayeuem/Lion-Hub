if game:GetService("CoreGui"):FindFirstChild('Lion Hub Kaitun') then
    game:GetService("CoreGui"):FindFirstChild('Lion Hub Kaitun'):Destroy()
end

-- Toggle Button UI
local ToggleGui = Instance.new("ScreenGui")
ToggleGui.Name = "LionHubToggle"
ToggleGui.Parent = game:GetService("CoreGui")
ToggleGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local ToggleBtn = Instance.new("ImageButton")
ToggleBtn.Name = "ToggleBtn"
ToggleBtn.Parent = ToggleGui
ToggleBtn.Size = UDim2.new(0, 40, 0, 40)
ToggleBtn.Position = UDim2.new(1, -60, 0, 60)
ToggleBtn.BackgroundTransparency = 1
ToggleBtn.Image = "rbxassetid://17260696651" -- icon giống switch
ToggleBtn.ImageColor3 = Color3.fromRGB(0, 150, 255)

-- Main UI
local LionHub = Instance.new("ScreenGui")
LionHub.Name = "Lion Hub Kaitun"
LionHub.Parent = game:GetService("CoreGui")
LionHub.Enabled = true

local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Parent = LionHub
MainFrame.Size = UDim2.new(0, 500, 0, 340)
MainFrame.Position = UDim2.new(0.5, -250, 0.5, -170)
MainFrame.BackgroundColor3 = Color3.fromRGB(255,255,255)
MainFrame.BorderSizePixel = 0

local border = Instance.new("UIStroke")
border.Color = Color3.fromRGB(0, 150, 255)
border.Thickness = 2
border.Parent = MainFrame

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 12)
corner.Parent = MainFrame

-- Header
local Header = Instance.new("TextLabel")
Header.Parent = MainFrame
Header.Size = UDim2.new(1, 0, 0, 44)
Header.Position = UDim2.new(0, 0, 0, 0)
Header.BackgroundTransparency = 1
Header.Text = "Lion Hub Kaitun"
Header.Font = Enum.Font.GothamBold
Header.TextSize = 28
Header.TextColor3 = Color3.fromRGB(0, 150, 255)
Header.TextStrokeTransparency = 0.8

-- Status Section
local StatusFrame = Instance.new("Frame")
StatusFrame.Parent = MainFrame
StatusFrame.Size = UDim2.new(1, -40, 0, 110)
StatusFrame.Position = UDim2.new(0, 20, 0, 60)
StatusFrame.BackgroundTransparency = 1

local StatusLayout = Instance.new("UIListLayout")
StatusLayout.Parent = StatusFrame
StatusLayout.Padding = UDim.new(0, 8)

local player = game.Players.LocalPlayer
local sea = "Unknown"
if game.PlaceId == 2753915549 then sea = "Sea 1"
elseif game.PlaceId == 4442272183 then sea = "Sea 2"
elseif game.PlaceId == 7449423635 then sea = "Sea 3" end

local statusLabels = {
    "Name: "..player.Name,
    "Sea: "..sea,
    "Race: "..(player.Data and player.Data:FindFirstChild("Race") and player.Data.Race.Value or "Unknown"),
    "Fruit: ",
    "Awaken: "
}
for _, text in ipairs(statusLabels) do
    local lbl = Instance.new("TextLabel")
    lbl.Size = UDim2.new(1, 0, 0, 22)
    lbl.BackgroundTransparency = 1
    lbl.Text = text
    lbl.Font = Enum.Font.Gotham
    lbl.TextSize = 16
    lbl.TextColor3 = Color3.fromRGB(0,0,0)
    lbl.TextXAlignment = Enum.TextXAlignment.Left
    lbl.Parent = StatusFrame
end

-- Check Item Section
local ItemsFrame = Instance.new("Frame")
ItemsFrame.Parent = MainFrame
ItemsFrame.Size = UDim2.new(1, -40, 0, 120)
ItemsFrame.Position = UDim2.new(0, 20, 0, 180)
ItemsFrame.BackgroundTransparency = 1

local ItemsLayout = Instance.new("UIListLayout")
ItemsLayout.Parent = ItemsFrame
ItemsLayout.Padding = UDim.new(0, 8)

local PremiumItems = {
    ["God Human"] = {"God Human", "GodHuman"},
    ["Cursed Dual Katana"] = {"Cursed Dual Katana"},
    ["Soul Guitar"] = {"Soul Guitar", "Skull Guitar"},
    ["Mirror Fractal"] = {"Mirror Fractal"},
    ["Valkyrie Helm"] = {"Valkyrie Helm"}
}

local function HasPremiumItem(mainItemName)
    local alternativeNames = PremiumItems[mainItemName] or {mainItemName}
    local function itemMatches(item)
        for _, name in ipairs(alternativeNames) do
            if item.Name == name or (item.Value and item.Value == name) then
                return true
            end
        end
        return false
    end
    local player = game.Players.LocalPlayer
    local backpack = player:FindFirstChild("Backpack")
    if backpack then
        for _, item in ipairs(backpack:GetChildren()) do
            if itemMatches(item) then return true end
        end
    end
    local character = player.Character
    if character then
        for _, item in ipairs(character:GetChildren()) do
            if itemMatches(item) then return true end
        end
    end
    local data = player:FindFirstChild("Data")
    if data then
        local folders = {"Inventory", "Talents", "Skills", "Race", "Misc"}
        for _, folderName in ipairs(folders) do
            local folder = data:FindFirstChild(folderName)
            if folder then
                for _, item in ipairs(folder:GetChildren()) do
                    if itemMatches(item) then return true end
                    if typeof(item.Value) == "string" or typeof(item.Value) == "boolean" or typeof(item.Value) == "number" then
                        for _, name in ipairs(alternativeNames) do
                            if item.Value == name or (item:IsA("BoolValue") and item.Value == true and name == item.Name) then
                                return true
                            end
                        end
                    end
                end
            end
        end
        for _, name in ipairs(alternativeNames) do
            local v = data:FindFirstChild(name)
            if v and ((v.Value and v.Value ~= "" and v.Value ~= false and v.Value ~= 0) or (v:IsA("BoolValue") and v.Value)) then
                return true
            end
        end
    end
    return false
end

local itemHeader = Instance.new("TextLabel")
itemHeader.Size = UDim2.new(1, 0, 0, 22)
itemHeader.BackgroundTransparency = 1
itemHeader.Text = "Premium Items:"
itemHeader.Font = Enum.Font.GothamBold
itemHeader.TextSize = 17
itemHeader.TextColor3 = Color3.fromRGB(0, 150, 255)
itemHeader.TextXAlignment = Enum.TextXAlignment.Left
itemHeader.Parent = ItemsFrame

for mainItemName in pairs(PremiumItems) do
    local itemFrame = Instance.new("Frame")
    itemFrame.Size = UDim2.new(1, 0, 0, 22)
    itemFrame.BackgroundTransparency = 1
    itemFrame.Parent = ItemsFrame

    local checkBox = Instance.new("TextLabel")
    checkBox.Size = UDim2.new(0, 24, 0, 22)
    checkBox.Position = UDim2.new(0, 0, 0, 0)
    checkBox.BackgroundTransparency = 1
    checkBox.Text = HasPremiumItem(mainItemName) and "✓" or "✗"
    checkBox.TextColor3 = HasPremiumItem(mainItemName) and Color3.fromRGB(50, 255, 50) or Color3.fromRGB(200,0,0)
    checkBox.Font = Enum.Font.GothamBold
    checkBox.TextSize = 18
    checkBox.Parent = itemFrame

    local itemLabel = Instance.new("TextLabel")
    itemLabel.Size = UDim2.new(1, -30, 1, 0)
    itemLabel.Position = UDim2.new(0, 30, 0, 0)
    itemLabel.BackgroundTransparency = 1
    itemLabel.Text = mainItemName
    itemLabel.Font = Enum.Font.Gotham
    itemLabel.TextSize = 16
    itemLabel.TextColor3 = Color3.fromRGB(0,0,0)
    itemLabel.TextXAlignment = Enum.TextXAlignment.Left
    itemLabel.Parent = itemFrame
end

-- Footer (giống Switch: dòng nhỏ dưới cùng)
local Footer = Instance.new("TextLabel")
Footer.Parent = MainFrame
Footer.Size = UDim2.new(1, 0, 0, 20)
Footer.Position = UDim2.new(0, 0, 1, -20)
Footer.BackgroundTransparency = 1
Footer.Text = "Lion Hub Kaitun | "..player.Name.." | Sea: "..sea
Footer.Font = Enum.Font.Gotham
Footer.TextSize = 13
Footer.TextColor3 = Color3.fromRGB(0, 150, 255)
Footer.TextXAlignment = Enum.TextXAlignment.Center

-- Toggle logic
local visible = true
ToggleBtn.MouseButton1Click:Connect(function()
    visible = not visible
    LionHub.Enabled = visible
end)
