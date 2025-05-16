if game:GetService("CoreGui"):FindFirstChild('Lion Hub') then
    game:GetService("CoreGui"):FindFirstChild('Lion Hub'):Destroy()
end

local Lion_Hub = Instance.new("ScreenGui")
Lion_Hub.Name = "Lion Hub"
Lion_Hub.Parent = game:GetService("CoreGui")
Lion_Hub.Enabled = true

-- Nền trắng
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Parent = Lion_Hub
MainFrame.Size = UDim2.new(0.3, 0, 0.5, 0)
MainFrame.Position = UDim2.new(0.35, 0, 0.25, 0)
MainFrame.BackgroundColor3 = Color3.fromRGB(255,255,255)
MainFrame.BackgroundTransparency = 0

-- Header
local Header = Instance.new("TextLabel")
Header.Parent = MainFrame
Header.Size = UDim2.new(1, 0, 0, 40)
Header.Position = UDim2.new(0, 0, 0, 0)
Header.BackgroundTransparency = 1
Header.Text = "Lion Hub Kaitun"
Header.Font = Enum.Font.GothamBold
Header.TextSize = 22
Header.TextColor3 = Color3.fromRGB(0, 150, 255)

-- Thêm phần check item
local ItemsFrame = Instance.new("Frame")
ItemsFrame.Parent = MainFrame
ItemsFrame.Size = UDim2.new(1, -20, 0, 150)
ItemsFrame.Position = UDim2.new(0, 10, 0, 50)
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

for mainItemName in pairs(PremiumItems) do
    local itemFrame = Instance.new("Frame")
    itemFrame.Size = UDim2.new(1, 0, 0, 28)
    itemFrame.BackgroundTransparency = 1
    itemFrame.Parent = ItemsFrame

    local checkBox = Instance.new("TextLabel")
    checkBox.Size = UDim2.new(0, 24, 0, 24)
    checkBox.Position = UDim2.new(0, 0, 0, 2)
    checkBox.BackgroundTransparency = 1
    checkBox.Text = HasPremiumItem(mainItemName) and "✓" or "✗"
    checkBox.TextColor3 = Color3.fromRGB(50, 255, 50)
    checkBox.Font = Enum.Font.GothamBold
    checkBox.TextSize = 20
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

-- Thêm các phần status khác nếu muốn (ví dụ: tên, world, race, fruit...)
local StatusFrame = Instance.new("Frame")
StatusFrame.Parent = MainFrame
StatusFrame.Size = UDim2.new(1, -20, 0, 120)
StatusFrame.Position = UDim2.new(0, 10, 0, 210)
StatusFrame.BackgroundTransparency = 1

local StatusLayout = Instance.new("UIListLayout")
StatusLayout.Parent = StatusFrame
StatusLayout.Padding = UDim.new(0, 10)

local player = game.Players.LocalPlayer
local world = "Unknown"
if game.PlaceId == 2753915549 then world = "Old World"
elseif game.PlaceId == 4442272183 then world = "New World"
elseif game.PlaceId == 7449423635 then world = "Third World" end

local statusLabels = {
    "Name: "..player.Name,
    "World: "..world,
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
    lbl.TextSize = 15
    lbl.TextColor3 = Color3.fromRGB(0,0,0)
    lbl.TextXAlignment = Enum.TextXAlignment.Left
    lbl.Parent = StatusFrame
end
