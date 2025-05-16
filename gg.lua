local LionHub = {}
local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- Configuration
local Config = {
    UIName = "Lion Hub",
    BackgroundColor = Color3.fromRGB(0, 0, 0),
    BackgroundTransparency = 0.6,
    TextColor = Color3.fromRGB(255, 255, 255),
    AccentColor = Color3.fromRGB(0, 120, 215), -- Blue color
    CheckmarkColor = Color3.fromRGB(0, 255, 0),
    Font = Enum.Font.SourceSansBold,
    RefreshRate = 1
}

-- Premium items to track
local PremiumItems = {
    "God Human",
    "Cursed Dual Katana",
    "Soul Guitar",
    "Mirror Fractal",
    "Valkyrie Helm"
}

-- UI state
local GUI
local IsDragging = false
local IsResizing = false
local DragStart, ResizeStart, OriginalSize, OriginalPos

-- Helper function to apply common UI styling
local function ApplyStyle(frame, color, thickness, cornerRadius)
    local stroke = Instance.new("UIStroke")
    stroke.Color = color or Config.AccentColor
    stroke.Thickness = thickness or 2
    stroke.Parent = frame
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, cornerRadius or 8)
    corner.Parent = frame
end

-- Create UI
function LionHub:CreateUI()
    print("Creating UI...")
    
    -- Clean up existing UI
    for _, parent in ipairs({game.CoreGui, LocalPlayer.PlayerGui}) do
        local existingUI = parent:FindFirstChild("LionHubUI")
        if existingUI then existingUI:Destroy() end
    end
    
    -- Initialize ScreenGui
    GUI = Instance.new("ScreenGui")
    GUI.Name = "LionHubUI"
    GUI.ResetOnSpawn = false
    GUI.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    
    -- Set parent with fallback
    local parentSet = pcall(function() GUI.Parent = game.CoreGui end)
    if not parentSet then
        GUI.Parent = LocalPlayer.PlayerGui
        print("Using PlayerGui (CoreGui inaccessible)")
    else
        print("Using CoreGui")
    end
    
    -- Background
    local background = Instance.new("Frame")
    background.Name = "Background"
    background.BackgroundColor3 = Config.BackgroundColor
    background.BackgroundTransparency = Config.BackgroundTransparency
    background.Size = UDim2.new(1, 0, 1, 0)
    background.Parent = GUI
    
    -- Quest Info Frame (at the top)
    local questInfoFrame = Instance.new("Frame")
    questInfoFrame.Name = "QuestInfoFrame"
    questInfoFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    questInfoFrame.BackgroundTransparency = 0.5
    questInfoFrame.Size = UDim2.new(0.35, 0, 0.15, 0)
    questInfoFrame.Position = UDim2.new(0.325, 0, 0.05, 0)
    questInfoFrame.Parent = GUI
    ApplyStyle(questInfoFrame)
    
    local questInfoTitle = Instance.new("TextLabel")
    questInfoTitle.Name = "QuestInfoTitle"
    questInfoTitle.BackgroundTransparency = 1
    questInfoTitle.Size = UDim2.new(1, 0, 0.25, 0)
    questInfoTitle.Font = Config.Font
    questInfoTitle.Text = "Thông tin nhiệm vụ"
    questInfoTitle.TextColor3 = Config.AccentColor
    questInfoTitle.TextSize = 16
    questInfoTitle.Parent = questInfoFrame
    
    local questStatsContainer = Instance.new("Frame")
    questStatsContainer.Name = "QuestStatsContainer"
    questStatsContainer.BackgroundTransparency = 1
    questStatsContainer.Size = UDim2.new(0.95, 0, 0.7, 0)
    questStatsContainer.Position = UDim2.new(0.025, 0, 0.3, 0)
    questStatsContainer.Parent = questInfoFrame
    
    local questStatsLayout = Instance.new("UIListLayout")
    questStatsLayout.SortOrder = Enum.SortOrder.LayoutOrder
    questStatsLayout.Padding = UDim.new(0, 5)
    questStatsLayout.Parent = questStatsContainer
    
    -- Quest stats labels
    local questLabels = {
        {Name = "QuestName", Text = "Tên nhiệm vụ: "},
        {Name = "Objective", Text = "Mục tiêu: "},
        {Name = "Status", Text = "Trạng thái: "}
    }
    
    for i, label in ipairs(questLabels) do
        local statLabel = Instance.new("TextLabel")
        statLabel.Name = label.Name
        statLabel.BackgroundTransparency = 1
        statLabel.Size = UDim2.new(1, 0, 0, 20)
        statLabel.Font = Config.Font
        statLabel.Text = label.Text .. "Đang tải..."
        statLabel.TextColor3 = Config.TextColor
        statLabel.TextSize = 14
        statLabel.TextXAlignment = Enum.TextXAlignment.Left
        statLabel.TextWrapped = true
        statLabel.LayoutOrder = i
        statLabel.Parent = questStatsContainer
    end
    
    -- Items Frame (now includes player info)
    local itemsFrame = Instance.new("Frame")
    itemsFrame.Name = "ItemsFrame"
    itemsFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    itemsFrame.BackgroundTransparency = 0.5
    itemsFrame.Size = UDim2.new(0.35, 0, 0.45, 0)
    itemsFrame.Position = UDim2.new(0.325, 0, 0.1, 0)
    itemsFrame.Parent = GUI
    ApplyStyle(itemsFrame)
    
    local itemsTitle = Instance.new("TextLabel")
    itemsTitle.Name = "ItemsTitle"
    itemsTitle.BackgroundTransparency = 1
    itemsTitle.Size = UDim2.new(1, 0, 0.1, 0)
    itemsTitle.Font = Config.Font
    itemsTitle.Text = "Thông tin & Vật phẩm"
    itemsTitle.TextColor3 = Config.AccentColor
    itemsTitle.TextSize = 16
    itemsTitle.Parent = itemsFrame
    
    -- Player stats inside ItemsFrame
    local playerStatsContainer = Instance.new("Frame")
    playerStatsContainer.Name = "PlayerStatsContainer"
    playerStatsContainer.BackgroundTransparency = 1
    playerStatsContainer.Size = UDim2.new(0.95, 0, 0.35, 0)
    playerStatsContainer.Position = UDim2.new(0.025, 0, 0.12, 0)
    playerStatsContainer.Parent = itemsFrame
    
    local playerStatsLayout = Instance.new("UIListLayout")
    playerStatsLayout.SortOrder = Enum.SortOrder.LayoutOrder
    playerStatsLayout.Padding = UDim.new(0, 5)
    playerStatsLayout.Parent = playerStatsContainer
    
    -- Player stats labels
    local playerLabels = {
        {Name = "PlayerName", Text = "Tên: "},
        {Name = "Level", Text = "Cấp độ: "},
        {Name = "Beli", Text = "Beli: "},
        {Name = "Fragments", Text = "Fragments: "},
        {Name = "Race", Text = "Race: "}
    }
    
    for i, label in ipairs(playerLabels) do
        local statLabel = Instance.new("TextLabel")
        statLabel.Name = label.Name
        statLabel.BackgroundTransparency = 1
        statLabel.Size = UDim2.new(1, 0, 0, 20)
        statLabel.Font = Config.Font
        statLabel.Text = label.Text .. "Đang tải..."
        statLabel.TextColor3 = Config.TextColor
        statLabel.TextSize = 14
        statLabel.TextXAlignment = Enum.TextXAlignment.Left
        statLabel.LayoutOrder = i
        statLabel.Parent = playerStatsContainer
    end
    
    -- Items list inside ItemsFrame
    local itemsContainer = Instance.new("Frame")
    itemsContainer.Name = "ItemsContainer"
    itemsContainer.BackgroundTransparency = 1
    itemsContainer.Size = UDim2.new(0.95, 0, 0.53, 0)
    itemsContainer.Position = UDim2.new(0.025, 0, 0.45, 0)
    itemsContainer.Parent = itemsFrame
    
    local itemsLayout = Instance.new("UIListLayout")
    itemsLayout.SortOrder = Enum.SortOrder.LayoutOrder
    itemsLayout.Padding = UDim.new(0, 10)
    itemsLayout.Parent = itemsContainer
    
    -- Premium items
    for i, itemName in ipairs(PremiumItems) do
        local itemFrame = Instance.new("Frame")
        itemFrame.Name = "Item_" .. itemName:gsub(" ", "_")
        itemFrame.BackgroundTransparency = 1
        itemFrame.Size = UDim2.new(1, 0, 0, 25)
        itemFrame.LayoutOrder = i
        itemFrame.Parent = itemsContainer
        
        local checkBox = Instance.new("Frame")
        checkBox.Name = "CheckBox"
        checkBox.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
        checkBox.BackgroundTransparency = 0.5
        checkBox.Size = UDim2.new(0, 20, 0, 20)
        checkBox.Position = UDim2.new(0, 0, 0, 2)
        checkBox.Parent = itemFrame
        ApplyStyle(checkBox, Color3.fromRGB(100, 100, 100), 1, 4)
        
        local checkmark = Instance.new("TextLabel")
        checkmark.Name = "Checkmark"
        checkmark.BackgroundTransparency = 1
        checkmark.Size = UDim2.new(1, 0, 1, 0)
        checkmark.Font = Config.Font
        checkmark.Text = "✓"
        checkmark.TextColor3 = Config.CheckmarkColor
        checkmark.TextSize = 18
        checkmark.Visible = false
        checkmark.Parent = checkBox
        
        local itemLabel = Instance.new("TextLabel")
        itemLabel.Name = "ItemLabel"
        itemLabel.BackgroundTransparency = 1
        itemLabel.Size = UDim2.new(0.9, 0, 1, 0)
        itemLabel.Position = UDim2.new(0.1, 0, 0, 0)
        itemLabel.Font = Config.Font
        itemLabel.Text = itemName
        itemLabel.TextColor3 = Config.TextColor
        itemLabel.TextSize = 14
        itemLabel.TextXAlignment = Enum.TextXAlignment.Left
        itemLabel.Parent = itemFrame
    end
    
    -- Resize handle for ItemsFrame
    local resizeHandle = Instance.new("Frame")
    resizeHandle.Name = "ResizeHandle"
    resizeHandle.BackgroundColor3 = Config.AccentColor
    resizeHandle.BackgroundTransparency = 0.5
    resizeHandle.Size = UDim2.new(0, 10, 0, 10)
    resizeHandle.Position = UDim2.new(1, -10, 1, -10)
    resizeHandle.Parent = itemsFrame
    ApplyStyle(resizeHandle, nil, nil, 4)
    
    -- Drag and resize handlers for ItemsFrame
    itemsTitle.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            IsDragging = true
            DragStart = input.Position
            OriginalPos = itemsFrame.Position
        end
    end)
    
    resizeHandle.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            IsResizing = true
            ResizeStart = input.Position
            OriginalSize = itemsFrame.Size
        end
    end)
    
    UserInputService.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement then
            if IsDragging then
                local delta = input.Position - DragStart
                itemsFrame.Position = UDim2.new(
                    OriginalPos.X.Scale + (delta.X / GUI.AbsoluteSize.X),
                    0,
                    OriginalPos.Y.Scale + (delta.Y / GUI.AbsoluteSize.Y),
                    0
                )
            elseif IsResizing then
                local delta = input.Position - ResizeStart
                local newWidth = math.clamp(OriginalSize.X.Scale + (delta.X / GUI.AbsoluteSize.X), 0.2, 0.6)
                local newHeight = math.clamp(OriginalSize.Y.Scale + (delta.Y / GUI.AbsoluteSize.Y), 0.3, 0.7)
                itemsFrame.Size = UDim2.new(newWidth, 0, newHeight, 0)
            end
        end
    end)
    
    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            IsDragging = false
            IsResizing = false
        end
    end)
end

-- Fetch current quest (simulated for Blox Fruit)
function LionHub:GetCurrentQuest()
    local data = LocalPlayer:FindFirstChild("Data")
    local questData = {
        QuestName = "Không có nhiệm vụ",
        Objective = "N/A",
        Status = "N/A"
    }
    
    if data then
        local questFolder = data:FindFirstChild("Quests")
        if questFolder and #questFolder:GetChildren() > 0 then
            local activeQuest = questFolder:GetChildren()[1]
            questData.QuestName = activeQuest.Name or "Nhiệm vụ không xác định"
            questData.Objective = activeQuest:FindFirstChild("Objective") and activeQuest.Objective.Value or "Hoàn thành mục tiêu"
            questData.Status = activeQuest:FindFirstChild("Completed") and activeQuest.Completed.Value and "Hoàn thành" or "Đang thực hiện"
        end
    end
    
    return questData
end

-- Update quest info
function LionHub:UpdateQuestInfo()
    if not GUI or not GUI:FindFirstChild("QuestInfoFrame") then return end
    
    local statsContainer = GUI.QuestInfoFrame.QuestStatsContainer
    local questData = self:GetCurrentQuest()
    
    local stats = {
        QuestName = questData.QuestName,
        Objective = questData.Objective,
        Status = questData.Status
    }
    
    for statName, value in pairs(stats) do
        local label = statsContainer:FindFirstChild(statName)
        if label then label.Text = label.Text:match("^.-: ") .. value end
    end
end

-- Update player info (now inside ItemsFrame)
function LionHub:UpdatePlayerInfo()
    if not GUI or not GUI:FindFirstChild("ItemsFrame") then return end
    
    local statsContainer = GUI.ItemsFrame.PlayerStatsContainer
    local data = LocalPlayer:FindFirstChild("Data")
    
    local stats = {
        PlayerName = LocalPlayer.Name,
        Level = data and data:FindFirstChild("Level") and data.Level.Value or "N/A",
        Beli = data and data:FindFirstChild("Beli") and self:FormatNumber(data.Beli.Value) or "0",
        Fragments = data and data:FindFirstChild("Fragments") and self:FormatNumber(data.Fragments.Value) or "0",
        Race = data and data:FindFirstChild("Race") and data.Race.Value or "Human"
    }
    
    for statName, value in pairs(stats) do
        local label = statsContainer:FindFirstChild(statName)
        if label then label.Text = label.Text:match("^.-: ") .. value end
    end
    
    self:UpdatePremiumItems()
end

-- Update premium items
function LionHub:UpdatePremiumItems()
    if not GUI or not GUI:FindFirstChild("ItemsFrame") then return end
    
    local itemsContainer = GUI.ItemsFrame.ItemsContainer
    for _, itemName in ipairs(PremiumItems) do
        local itemFrame = itemsContainer:FindFirstChild("Item_" .. itemName:gsub(" ", "_"))
        if itemFrame and itemFrame:FindFirstChild("CheckBox") then
            local checkmark = itemFrame.CheckBox.Checkmark
            local itemLabel = itemFrame:FindFirstChild("ItemLabel")
            local hasItem = self:HasPremiumItem(itemName)
            checkmark.Visible = hasItem
            if itemLabel then
                itemLabel.TextColor3 = hasItem and Config.CheckmarkColor or Config.TextColor
            end
        end
    end
end

-- Check for premium item
function LionHub:HasPremiumItem(itemName)
    local backpack = LocalPlayer:FindFirstChild("Backpack")
    if backpack then
        for _, item in ipairs(backpack:GetChildren()) do
            if item.Name == itemName then return true end
        end
    end
    
    local character = LocalPlayer.Character
    if character then
        for _, item in ipairs(character:GetChildren()) do
            if item.Name == itemName then return true end
        end
    end
    
    local data = LocalPlayer:FindFirstChild("Data")
    if data and data:FindFirstChild("Inventory") then
        for _, item in ipairs(data.Inventory:GetChildren()) do
            if item.Name == itemName then return true end
        end
    end
    
    return false
end

-- Format large numbers
function LionHub:FormatNumber(number)
    number = tonumber(number) or 0
    if number >= 1e9 then return string.format("%.2fB", number / 1e9) end
    if number >= 1e6 then return string.format("%.2fM", number / 1e6) end
    if number >= 1e3 then return string.format("%.2fK", number / 1e3) end
    return tostring(number)
end

-- Start Lion Hub
function LionHub:Start()
    local success, err = pcall(function()
        self:CreateUI()
        spawn(function()
            while wait(Config.RefreshRate) do
                self:UpdatePlayerInfo()
                self:UpdateQuestInfo()
            end
        end)
    end)
    if not success then warn("Failed to start Lion Hub: " .. err) end
end

-- Initialize
LionHub:Start()

return LionHub
