local placeId = game.PlaceId
local Old_World, New_World, Three_World

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

local function createElement(className, props)
    local element = Instance.new(className)
    for prop, value in pairs(props) do
        element[prop] = value
    end
    return element
end

local MainFrame = createElement("Frame", {
    Name = "MainFrame",
    Parent = LionHub,
    Size = UDim2.new(1, 0, 1, 0),
    Position = UDim2.new(0, 0, 0, 0),
    BackgroundColor3 = Color3.fromRGB(0, 0, 0),
    BackgroundTransparency = 0,
    BorderSizePixel = 0
})

createElement("UICorner", {
    CornerRadius = UDim.new(0, 0), 
    Parent = MainFrame
})

local Logo = createElement("ImageLabel", {
    Name = "Logo",
    Parent = MainFrame,
    Size = UDim2.new(0, 48, 0, 48),
    Position = UDim2.new(0, 16, 0, 16),
    BackgroundTransparency = 1,
    Image = "https://cdn.discordapp.com/icons/1304070654601199657/bd60d83d852dad91fc1c666d0defb0fe.webp"
})

local Header = createElement("TextLabel", {
    Parent = MainFrame,
    Size = UDim2.new(1, 0, 0, 48),
    Position = UDim2.new(0, 0, 0, 16),
    BackgroundTransparency = 1,
    Text = "Lion Hub Kaitun",
    Font = Enum.Font.GothamBold,
    TextSize = 32,
    TextColor3 = Color3.fromRGB(255, 255, 255),
    TextXAlignment = Enum.TextXAlignment.Center,
    TextScaled = true
})

local PlayerStatus = createElement("TextLabel", {
    Parent = MainFrame,
    Size = UDim2.new(1, 0, 0, 24),
    Position = UDim2.new(0, 0, 0, 72),
    BackgroundTransparency = 1,
    Font = Enum.Font.GothamBold,
    TextSize = 18,
    TextColor3 = Color3.fromRGB(255, 255, 255),
    TextStrokeTransparency = 0.7,
    TextXAlignment = Enum.TextXAlignment.Center,
    TextScaled = true,
    Text = "👤 Name: ... | Level: ..."
})

local MoneyStatus = createElement("TextLabel", {
    Parent = MainFrame,
    Size = UDim2.new(1, 0, 0, 20),
    Position = UDim2.new(0, 0, 0, 100),
    BackgroundTransparency = 1,
    Font = Enum.Font.GothamBold,
    TextSize = 16,
    TextColor3 = Color3.fromRGB(255, 255, 255),
    TextStrokeTransparency = 0.7,
    TextXAlignment = Enum.TextXAlignment.Center,
    RichText = true,
    TextScaled = true,
    Text = '💰 Beli: ... | <font color="#b400ff">F</font>: ...'
})

local FullMoonLabel = createElement("TextLabel", {
    Parent = MainFrame,
    Size = UDim2.new(0, 300, 0, 32),
    Position = UDim2.new(0.5, -150, 0, 130),
    BackgroundTransparency = 1,
    Font = Enum.Font.GothamBold,
    TextSize = 24,
    TextColor3 = Color3.fromRGB(255, 255, 255),
    TextStrokeTransparency = 0.7,
    TextXAlignment = Enum.TextXAlignment.Center,
    TextScaled = true,
    Text = "🌕 Full Moon: Checking..."
})

local TimeLabel = createElement("TextLabel", {
    Parent = MainFrame,
    Size = UDim2.new(0, 300, 0, 20),
    Position = UDim2.new(0.5, -150, 0, 170),
    BackgroundTransparency = 1,
    Font = Enum.Font.GothamBold,
    TextSize = 16,
    TextColor3 = Color3.fromRGB(255, 255, 255),
    TextStrokeTransparency = 0.7,
    TextXAlignment = Enum.TextXAlignment.Center,
    TextScaled = true,
    Text = "⏰ Time in server: ..."
})

local SeaLabel = createElement("TextLabel", {
    Parent = MainFrame,
    Size = UDim2.new(0, 300, 0, 20),
    Position = UDim2.new(0.5, -150, 0, 200),
    BackgroundTransparency = 1,
    Font = Enum.Font.GothamBold,
    TextSize = 16,
    TextColor3 = Color3.fromRGB(255, 255, 255),
    TextStrokeTransparency = 0.7,
    TextXAlignment = Enum.TextXAlignment.Center,
    RichText = true,
    TextScaled = true,
    Text = "🌊 Sea: ..."
})

local MissionLabel = createElement("TextLabel", {
    Parent = MainFrame,
    Size = UDim2.new(0, 300, 0, 24),
    Position = UDim2.new(0.5, -150, 0, 230),
    BackgroundTransparency = 1,
    Font = Enum.Font.GothamBold,
    TextSize = 18,
    TextColor3 = Color3.fromRGB(255, 255, 255),
    TextStrokeTransparency = 0.7,
    TextXAlignment = Enum.TextXAlignment.Center,
    TextScaled = true,
    Text = "📋 Quest: Checking..."
})

local ItemLabel = createElement("TextLabel", {
    Parent = MainFrame,
    Size = UDim2.new(0, 300, 0, 40),
    Position = UDim2.new(0.5, -150, 0, 260),
    BackgroundTransparency = 1,
    Font = Enum.Font.GothamBold,
    TextSize = 14,
    TextColor3 = Color3.fromRGB(255, 255, 255),
    TextStrokeTransparency = 0.7,
    TextXAlignment = Enum.TextXAlignment.Center,
    TextWrapped = true,
    TextScaled = true,
    Text = "👜 Item: Checking..."
})

local function checkInventory(name)
    local inventory = game.ReplicatedStorage.Remotes.CommF_:InvokeServer("getInventory")
    for _, item in pairs(inventory) do
        if item.Name == name then
            return true
        end
    end
    return false
end

local function updateItems()
    local items = {
        {name = "God Human", check = function() return game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyGodhuman") == 1 or game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyGodhuman") == 2 end},
        {name = "Cursed Dual Katana", check = function() return checkInventory("Cursed Dual Katana") end},
        {name = "Skull Guitar", check = function() return checkInventory("Skull Guitar") end},
        {name = "Mirror Fractal", check = function() return checkInventory("Mirror Fractal") end},
        {name = "Valkyrie Helm", check = function() return checkInventory("Valkyrie Helm") end}
    }
    local status = {}
    for _, item in ipairs(items) do
        table.insert(status, (item.check() and "✅" or "❌") .. " " .. item.name)
    end
    ItemLabel.Text = "👜 Item: " .. table.concat(status, " | ")
end

local function updateFullMoon()
    local moon = game:GetService("Lighting").Sky.MoonTextureId
    local percent = "0%"
    if moon == "http://www.roblox.com/asset/?id=9709149431" then percent = "100%"
    elseif moon == "http://www.roblox.com/asset/?id=9709149052" then percent = "75%"
    elseif moon == "http://www.roblox.com/asset/?id=9709143733" then percent = "50%"
    elseif moon == "http://www.roblox.com/asset/?id=9709150401" then percent = "25%"
    elseif moon == "http://www.roblox.com/asset/?id=9709149680" then percent = "15%" end
    FullMoonLabel.Text = "🌕 Full Moon: " .. percent
end

local function updateTimeLabel()
    local t = math.floor(workspace.DistributedGameTime)
    TimeLabel.Text = string.format("⏰ Time in server: %02d:%02d:%02d", math.floor(t / 3600), math.floor((t % 3600) / 60), t % 60)
end

local function updateSeaLabel()
    local player = game.Players.LocalPlayer
    local data = player:FindFirstChild("Data")
    local level = data and data:FindFirstChild("Level") and tonumber(data.Level.Value) or 0
    local sea = Old_World and 1 or New_World and 2 or Three_World and 3 or 1
    local sea1 = '<font color="#00ff00">✅</font> Sea 1'
    local sea2 = (level >= 700 and game.ReplicatedStorage.Remotes.CommF_:InvokeServer("DressrosaQuestProgress")['KilledIceBoss'] == true or sea >= 2) and '<font color="#00ff00">✅</font> Sea 2' or '<font color="#ff0000">❌</font> Sea 2'
    local sea3 = (level >= 1500 and game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ZQuestProgress", "Check") == 1 or sea == 3) and '<font color="#00ff00">✅</font> Sea 3' or '<font color="#ff0000">❌</font> Sea 3'
    SeaLabel.Text = "🌊 Sea: " .. sea1 .. " | " .. sea2 .. " | " .. sea3
end

local function updateMission()
    local player = game.Players.LocalPlayer
    local quest = "None"
    pcall(function()
        if player.PlayerGui:FindFirstChild("Main") and player.PlayerGui.Main:FindFirstChild("Quest") and player.PlayerGui.Main.Quest.Visible then
            quest = player.PlayerGui.Main.Quest.Container.Title.Text
        end
    end)
    MissionLabel.Text = "📋 Quest: " .. quest
end

local function updatePlayerStatus()
    local player = game.Players.LocalPlayer
    local data = player:FindFirstChild("Data")
    local level = data and data:FindFirstChild("Level") and tostring(data.Level.Value) or "N/A"
    local beli = data and data:FindFirstChild("Beli") and tostring(data.Beli.Value) or "N/A"
    local fragments = data and data:FindFirstChild("Fragments") and tostring(data.Fragments.Value) or "N/A"
    PlayerStatus.Text = "👤 Name: " .. player.Name .. " | Level: " .. level
    MoneyStatus.Text = '💰 Beli: ' .. beli .. ' | <font color="#b400ff">F</font>: ' .. fragments
end

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
    for prop, value in pairs({
        Ambient = Color3.new(0,0,0),
        OutdoorAmbient = Color3.new(0,0,0),
        Brightness = 0,
        ColorShift_Bottom = Color3.new(0,0,0),
        ColorShift_Top = Color3.new(0,0,0),
        FogEnd = 100,
        FogStart = 0,
        FogColor = Color3.new(0,0,0),
        ExposureCompensation = -10
    }) do
        Lighting[prop] = value
    end
end

local function restoreLighting()
    for prop, value in pairs(original) do
        Lighting[prop] = value
    end
end

local function updateAll()
    updateFullMoon()
    updateTimeLabel()
    updateSeaLabel()
    updateMission()
    updateItems()
    updatePlayerStatus()
end

updateAll()
game:GetService("RunService").RenderStepped:Connect(updateAll)

local ToggleButton = createElement("ImageButton", {
    Name = "ToggleButton",
    Parent = LionHub,
    Size = UDim2.new(0, 40, 0, 40),
    Position = UDim2.new(1, -48, 0.5, -20),
    BackgroundColor3 = Color3.fromRGB(30, 30, 30),
    Image = "rbxassetid://123709024751036",
    ZIndex = 2
})

createElement("UICorner", {
    CornerRadius = UDim.new(1, 0),
    Parent = ToggleButton
})

local ToggleIcon = createElement("TextLabel", {
    Parent = ToggleButton,
    Size = UDim2.new(0.5, 0, 0.5, 0),
    BackgroundTransparency = 1,
    Text = "⬇",
    TextColor3 = Color3.fromRGB(255, 255, 255),
    TextSize = 16,
    Font = Enum.Font.GothamBold,
    TextScaled = true,
    ZIndex = 3
})

local uiVisible = true
setDark()

local function toggleUI()
    uiVisible = not uiVisible
    MainFrame.Visible = uiVisible
    ToggleIcon.Text = uiVisible and "⬇" or "▲"
    if uiVisible then
        setDark()
    else
        restoreLighting()
    end
end

ToggleButton.MouseButton1Click:Connect(toggleUI)

game:GetService("UserInputService").InputBegan:Connect(function(input, isTyping)
    if not isTyping and input.KeyCode == Enum.KeyCode.LeftControl then
        toggleUI()
    end
end)
