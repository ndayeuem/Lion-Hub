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

-- Status tên và level người chơi
local PlayerStatus = Instance.new("TextLabel")
PlayerStatus.Parent = MainFrame
PlayerStatus.Size = UDim2.new(1, 0, 0, 32)
PlayerStatus.Position = UDim2.new(0, 0, 0, 104)
PlayerStatus.BackgroundTransparency = 1
PlayerStatus.Font = Enum.Font.GothamBold
PlayerStatus.TextSize = 26
PlayerStatus.TextColor3 = Color3.fromRGB(255, 255, 255)
PlayerStatus.TextStrokeTransparency = 0.7
PlayerStatus.TextXAlignment = Enum.TextXAlignment.Center
PlayerStatus.Text = "👤 Name: ... | Level: ..."

-- Status Beli và Fragments (F màu tím)
local MoneyStatus = Instance.new("TextLabel")
MoneyStatus.Parent = MainFrame
MoneyStatus.Size = UDim2.new(1, 0, 0, 28)
MoneyStatus.Position = UDim2.new(0, 0, 0, 136)
MoneyStatus.BackgroundTransparency = 1
MoneyStatus.Font = Enum.Font.GothamBold
MoneyStatus.TextSize = 22
MoneyStatus.TextColor3 = Color3.fromRGB(255, 255, 255)
MoneyStatus.TextStrokeTransparency = 0.7
MoneyStatus.TextXAlignment = Enum.TextXAlignment.Center
MoneyStatus.RichText = true
MoneyStatus.Text = '💰 Beli: ... | <font color="#b400ff">F</font>: ...'

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

-- Thời gian trong server
local TimeLabel = Instance.new("TextLabel")
TimeLabel.Parent = MainFrame
TimeLabel.Size = UDim2.new(0, 500, 0, 28)
TimeLabel.Position = UDim2.new(0.5, -250, 0.5, -12)
TimeLabel.BackgroundTransparency = 1
TimeLabel.Font = Enum.Font.GothamBold
TimeLabel.TextSize = 22
TimeLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TimeLabel.TextStrokeTransparency = 0.7
TimeLabel.TextXAlignment = Enum.TextXAlignment.Center
TimeLabel.Text = "⏰ Time in server: ..."

-- Check Sea status
local SeaLabel = Instance.new("TextLabel")
SeaLabel.Parent = MainFrame
SeaLabel.Size = UDim2.new(0, 500, 0, 28)
SeaLabel.Position = UDim2.new(0.5, -250, 0.5, 20)
SeaLabel.BackgroundTransparency = 1
SeaLabel.Font = Enum.Font.GothamBold
SeaLabel.TextSize = 22
SeaLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
SeaLabel.TextStrokeTransparency = 0.7
SeaLabel.TextXAlignment = Enum.TextXAlignment.Center
SeaLabel.RichText = true
SeaLabel.Text = "🌊 Sea: ..."

-- Check nhiệm vụ đang làm
local MissionLabel = Instance.new("TextLabel")
MissionLabel.Parent = MainFrame
MissionLabel.Size = UDim2.new(0, 500, 0, 32)
MissionLabel.Position = UDim2.new(0.5, -250, 0.5, 52)
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
ItemLabel.Position = UDim2.new(0.5, -250, 0.5, 88)
ItemLabel.BackgroundTransparency = 1
ItemLabel.Font = Enum.Font.GothamBold
ItemLabel.TextSize = 22
ItemLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
ItemLabel.TextStrokeTransparency = 0.7
ItemLabel.Text = "🎒 Item: Đang kiểm tra..."

-- Hàm kiểm tra God Human (mọi trường hợp)
local function hasGodHuman(player)
    -- Check Data.Melee
    local data = player:FindFirstChild("Data")
    if data and data:FindFirstChild("Melee") then
        local melee = data.Melee.Value
        if melee == "God Human" or melee == "GodHuman" then
            return true
        end
    end
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
    -- Check Inventory
    if data and data:FindFirstChild("Inventory") then
        for _, inv in ipairs(data.Inventory:GetChildren()) do
            if inv.Name == "God Human" or inv.Name == "GodHuman" then
                return true
            end
        end
    end
    return false
end

-- Hàm kiểm tra item trong kho đồ (Inventory, Backpack, Character)
local function hasItem(player, itemName)
    local data = player:FindFirstChild("Data")
    local backpack = player:FindFirstChild("Backpack")
    local character = player.Character
    local inventory = data and data:FindFirstChild("Inventory")
    -- Check Backpack
    if backpack and backpack:FindFirstChild(itemName) then return true end
    -- Check Character
    if character and character:FindFirstChild(itemName) then return true end
    -- Check Inventory
    if inventory then
        for _, inv in ipairs(inventory:GetChildren()) do
            if inv.Name == itemName then return true end
        end
    end
    return false
end

-- Hàm cập nhật trạng thái item
local function updateItems()
    local player = game.Players.LocalPlayer
    local items = {
        {name = "God Human", check = function() return hasGodHuman(player) end},
        {name = "Cursed Dual Katana", check = function() return hasItem(player, "Cursed Dual Katana") end},
        {name = "Skull Guitar", check = function() return hasItem(player, "Skull Guitar") end},
        {name = "Mirror Fractal", check = function() return hasItem(player, "Mirror Fractal") end},
        {name = "Valkyrie Helm", check = function() return hasItem(player, "Valkyrie Helm") end}
    }
    local status = {}
    for _, item in ipairs(items) do
        local has = false
        if item.check then
            has = item.check()
        end
        table.insert(status, (has and "✅" or "❌") .. " " .. item.name)
    end
    ItemLabel.Text = "🎒 Item: " .. table.concat(status, " | ")
end

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

-- Hàm cập nhật thời gian trong server
local function updateTimeLabel()
    local t = math.floor(workspace.DistributedGameTime)
    local h = math.floor(t / 3600)
    local m = math.floor((t % 3600) / 60)
    local s = t % 60
    TimeLabel.Text = string.format("⏰ Time in server: %02d:%02d:%02d", h, m, s)
end

-- Hàm cập nhật trạng thái Sea
local function updateSeaLabel()
    local player = game.Players.LocalPlayer
    local data = player:FindFirstChild("Data")
    local sea = 1
    if placeId == 2753915549 then sea = 1 end
    if placeId == 4442272183 then sea = 2 end
    if placeId == 7449423635 then sea = 3 end

    -- Check đã qua Sea nào (dựa vào level hoặc có thể dựa vào giá trị Data)
    local level = 0
    if data and data:FindFirstChild("Level") then
        level = tonumber(data.Level.Value)
    end
    -- Mặc định: Sea 1 luôn ✅, Sea 2 nếu đã qua level 700, Sea 3 nếu đã qua level 1500
    local sea1 = '<font color="#00ff00">✅</font> Sea 1'
    local sea2 = (level >= 700 or sea >= 2) and '<font color="#00ff00">✅</font> Sea 2' or '<font color="#ff0000">❌</font> Sea 2'
    local sea3 = (level >= 1500 or sea == 3) and '<font color="#00ff00">✅</font> Sea 3' or '<font color="#ff0000">❌</font> Sea 3'
    SeaLabel.Text = "🌊 Sea: " .. sea1 .. " | " .. sea2 .. " | " .. sea3
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

-- Hàm cập nhật tên, level, beli, fragments
local function updatePlayerStatus()
    local player = game.Players.LocalPlayer
    local name = player.Name
    local level = "N/A"
    local beli = "N/A"
    local fragments = "N/A"
    local data = player:FindFirstChild("Data")
    if data then
        if data:FindFirstChild("Level") then
            level = tostring(data.Level.Value)
        end
        if data:FindFirstChild("Beli") then
            beli = tostring(data.Beli.Value)
        end
        if data:FindFirstChild("Fragments") then
            fragments = tostring(data.Fragments.Value)
        end
    end
    PlayerStatus.Text = "👤 Name: " .. name .. " | Level: " .. level
    MoneyStatus.Text = '💰 Beli: ' .. beli .. ' | <font color="#b400ff">F</font>: ' .. fragments
end

-- Cập nhật liên tục
updateFullMoon()
updateTimeLabel()
updateSeaLabel()
updateMission()
updateItems()
updatePlayerStatus()
game:GetService("RunService").RenderStepped:Connect(function()
    updateFullMoon()
    updateTimeLabel()
    updateSeaLabel()
    updateMission()
    updateItems()
    updatePlayerStatus()
end)

-- Nền đen toàn bộ game khi bật UI
local Lighting = game:GetService("Lighting")
local original = {
    Ambient = Lighting.Ambient,
    OutdoorAmbient = Lighting.OutdoorAmbient,
    Brightness = Lighting.Brightness,
    ColorShift_Bottom = Lighting.ColorShift_Bottom,
    ColorShift_Top = Lighting.ColorShift_Top,
    FogEnd = Lighting.FogEnd,
    FogStart = Lighting.FogStart,
    FogColor = Lighting.FogColor,
    ExposureCompensation = Lighting.ExposureCompensation
}
local function setDark()
    Lighting.Ambient = Color3.new(0,0,0)
    Lighting.OutdoorAmbient = Color3.new(0,0,0)
    Lighting.Brightness = 0
    Lighting.ColorShift_Bottom = Color3.new(0,0,0)
    Lighting.ColorShift_Top = Color3.new(0,0,0)
    Lighting.FogEnd = 100
    Lighting.FogStart = 0
    Lighting.FogColor = Color3.new(0,0,0)
    Lighting.ExposureCompensation = -10
end
local function restoreLighting()
    Lighting.Ambient = original.Ambient
    Lighting.OutdoorAmbient = original.OutdoorAmbient
    Lighting.Brightness = original.Brightness
    Lighting.ColorShift_Bottom = original.ColorShift_Bottom
    Lighting.ColorShift_Top = original.ColorShift_Top
    Lighting.FogEnd = original.FogEnd
    Lighting.FogStart = original.FogStart
    Lighting.FogColor = original.FogColor
    Lighting.ExposureCompensation = original.ExposureCompensation
end
setDark()

-- Toggle bật/tắt ui bằng phím B
local togle_up = true
game:GetService("UserInputService").InputBegan:Connect(function(input, isTyping)
    if not isTyping then
        if input.KeyCode == Enum.KeyCode.B then
            if togle_up then
                LionHub.Enabled = false
                restoreLighting()
                togle_up = false
            else
                LionHub.Enabled = true
                setDark()
                togle_up = true
            end
        end
    end
end)
