local placeId = game.PlaceId
if placeId == 2753915549 then
    Old_World = true
elseif placeId == 4442272183 then
    New_World = true
elseif placeId == 7449423635 then
    Three_World = true
end

if game:GetService("CoreGui"):FindFirstChild('Lion Hub') then
    game:GetService("CoreGui"):FindFirstChild('Lion Hub'):Destroy()
end

local LionHub = Instance.new("ScreenGui")
LionHub.Name = "Lion Hub"
LionHub.Parent = game:GetService("CoreGui")
LionHub.Enabled = true

-- UI full màn hình, màu đen hoàn toàn
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Parent = LionHub
MainFrame.Size = UDim2.new(1, 0, 1, 0)
MainFrame.Position = UDim2.new(0, 0, 0, 0)
MainFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
MainFrame.BackgroundTransparency = 0
MainFrame.BorderSizePixel = 0

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 0)
corner.Parent = MainFrame

-- Logo Discord
local Logo = Instance.new("ImageLabel")
Logo.Name = "Logo"
Logo.Parent = MainFrame
Logo.Size = UDim2.new(0, 64, 0, 64)
Logo.Position = UDim2.new(0, 24, 0, 24)
Logo.BackgroundTransparency = 1
Logo.Image = "https://cdn.discordapp.com/icons/1304070654601199657/bd60d83d852dad91fc1c666d0defb0fe.webp"

-- Header căn giữa trên cùng
local Header = Instance.new("TextLabel")
Header.Parent = MainFrame
Header.Size = UDim2.new(1, 0, 0, 64)
Header.Position = UDim2.new(0, 0, 0, 24)
Header.BackgroundTransparency = 1
Header.Text = "Lion Hub Kaitun"
Header.Font = Enum.Font.GothamBold
Header.TextSize = 48
Header.TextColor3 = Color3.fromRGB(255, 255, 255)
Header.TextXAlignment = Enum.TextXAlignment.Center

-- Check % full moon
local FullMoonLabel = Instance.new("TextLabel")
FullMoonLabel.Parent = MainFrame
FullMoonLabel.Size = UDim2.new(0, 500, 0, 48)
FullMoonLabel.Position = UDim2.new(0.5, -250, 0.5, -60)
FullMoonLabel.BackgroundTransparency = 1
FullMoonLabel.Font = Enum.Font.GothamBold
FullMoonLabel.TextSize = 36
FullMoonLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
FullMoonLabel.TextStrokeTransparency = 0.7
FullMoonLabel.Text = "🌕 Full Moon: Đang kiểm tra..."

-- Check nhiệm vụ đang làm
local MissionLabel = Instance.new("TextLabel")
MissionLabel.Parent = MainFrame
MissionLabel.Size = UDim2.new(0, 500, 0, 32)
MissionLabel.Position = UDim2.new(0.5, -250, 0.5, 0)
MissionLabel.BackgroundTransparency = 1
MissionLabel.Font = Enum.Font.GothamBold
MissionLabel.TextSize = 26
MissionLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
MissionLabel.TextStrokeTransparency = 0.7
MissionLabel.Text = "📋 Nhiệm vụ: Đang kiểm tra..."

-- Check item nhỏ gọn
local ItemLabel = Instance.new("TextLabel")
ItemLabel.Parent = MainFrame
ItemLabel.Size = UDim2.new(0, 500, 0, 28)
ItemLabel.Position = UDim2.new(0.5, -250, 0.5, 36)
ItemLabel.BackgroundTransparency = 1
ItemLabel.Font = Enum.Font.GothamBold
ItemLabel.TextSize = 22
ItemLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
ItemLabel.TextStrokeTransparency = 0.7
ItemLabel.Text = "🎒 Item: Đang kiểm tra..."

-- Hàm cập nhật trạng thái % full moon 
local function updateFullMoon()
    local moon = game:GetService("Lighting").Sky.MoonTextureId
    local percent = "0%"
    if moon == "http://www.roblox.com/asset/?id=9709149431" then
        percent = "100%"
    elseif moon == "http://www.roblox.com/asset/?id=9709149052" then
        percent = "75%"
    elseif moon == "http://www.roblox.com/asset/?id=9709143733" then
        percent = "50%"
    elseif moon == "http://www.roblox.com/asset/?id=9709150401" then
        percent = "25%"
    elseif moon == "http://www.roblox.com/asset/?id=9709149680" then
        percent = "15%"
    end
    FullMoonLabel.Text = "🌕 Full Moon: " .. percent
end

-- Hàm cập nhật nhiệm vụ đang làm
local function updateMission()
    local player = game.Players.LocalPlayer
    local quest = "Không có"
    pcall(function()
        if player.PlayerGui:FindFirstChild("Main") and player.PlayerGui.Main:FindFirstChild("Quest") and player.PlayerGui.Main.Quest.Visible then
            quest = player.PlayerGui.Main.Quest.Container.Title.Text
        end
    end)
    MissionLabel.Text = "📋 Nhiệm vụ: " .. quest
end

-- Hàm kiểm tra God Human (Melee)
local function hasGodHuman(player)
    -- Check Backpack
    local backpack = player:FindFirstChild("Backpack")
    if backpack then
        for _, tool in ipairs(backpack:GetChildren()) do
            if tool.Name == "God Human" or tool.Name == "GodHuman" then
                return true
            end
        end
    end
    -- Check Character
    local character = player.Character
    if character then
        for _, tool in ipairs(character:GetChildren()) do
            if tool.Name == "God Human" or tool.Name == "GodHuman" then
                return true
            end
        end
    end
    -- Check Melee slot (nhiều game sẽ có giá trị Melee trong Data)
    local data = player:FindFirstChild("Data")
    if data and data:FindFirstChild("Melee") then
        local melee = data.Melee.Value
        if melee == "God Human" or melee == "GodHuman" then
            return true
        end
    end
    return false
end

-- Hàm kiểm tra item trong kho đồ (Inventory)
local function hasInInventory(inventory, itemName)
    if not inventory then return false end
    for _, inv in ipairs(inventory:GetChildren()) do
        if inv.Name == itemName then return true end
    end
    return false
end

-- Hàm cập nhật trạng thái item
local function updateItems()
    local player = game.Players.LocalPlayer
    local backpack = player:FindFirstChild("Backpack")
    local character = player.Character
    local data = player:FindFirstChild("Data")
    local inventory = data and data:FindFirstChild("Inventory")
    local items = {
        {name = "God Human", check = function() return hasGodHuman(player) end},
        {name = "Cursed Dual Katana"},
        {name = "Soul Guitar"},
        {name = "Mirror Fractal"},
        {name = "Valkyrie Helm"}
    }
    local status = {}
    for _, item in ipairs(items) do
        local has = false
        if item.check then
            has = item.check()
        else
            -- Check Backpack
            if backpack and backpack:FindFirstChild(item.name) then has = true end
            -- Check Character
            if not has and character and character:FindFirstChild(item.name) then has = true end
            -- Check Inventory
            if not has and hasInInventory(inventory, item.name) then has = true end
        end
        table.insert(status, (has and "✅" or "❌") .. " " .. item.name)
    end
    ItemLabel.Text = "🎒 Item: " .. table.concat(status, " | ")
end

-- Cập nhật liên tục
updateFullMoon()
updateMission()
updateItems()
game:GetService("RunService").RenderStepped:Connect(function()
    updateFullMoon()
    updateMission()
    updateItems()
end)

-- Nền đen toàn bộ game
local Lighting = game:GetService("Lighting")
Lighting.Ambient = Color3.new(0,0,0)
Lighting.OutdoorAmbient = Color3.new(0,0,0)
Lighting.Brightness = 0
Lighting.ColorShift_Bottom = Color3.new(0,0,0)
Lighting.ColorShift_Top = Color3.new(0,0,0)
Lighting.FogEnd = 100
Lighting.FogStart = 0
Lighting.FogColor = Color3.new(0,0,0)
Lighting.ExposureCompensation = -10

-- Toggle bật/tắt ui bằng phím B
local togle_up = true
game:GetService("UserInputService").InputBegan:Connect(function(input, isTyping)
    if not isTyping then
        if input.KeyCode == Enum.KeyCode.B then
            if togle_up then
                LionHub.Enabled = false
                Lighting.ExposureCompensation = 0
                togle_up = false
            else
                LionHub.Enabled = true
                Lighting.ExposureCompensation = -10
                togle_up = true
            end
        end
    end
end)
