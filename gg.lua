local LionHub = {}
local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- Configuration
local Config = {
    UIName = "Lion Hub",
    BackgroundColor = Color3.fromRGB(20, 20, 20),  -- Dark background
    BackgroundTransparency = 0.3,
    TextColor = Color3.fromRGB(255, 255, 255),
    AccentColor = Color3.fromRGB(0, 120, 215),     -- Blue accent
    CheckmarkColor = Color3.fromRGB(0, 255, 0),    -- Green for owned items
    MissingItemColor = Color3.fromRGB(255, 50, 50),-- Red for missing items
    Font = Enum.Font.SourceSansBold,
    RefreshRate = 1,
    CompactMode = true
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
local DragStart, OriginalPos

-- Helper function to apply common UI styling
local function ApplyStyle(frame, color, thickness, cornerRadius)
    local stroke = Instance.new("UIStroke")
    stroke.Color = color or Config.AccentColor
    stroke.Thickness = thickness or 1
    stroke.Parent = frame
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, cornerRadius or 6)
    corner.Parent = frame
end

-- Create compact UI
function LionHub:CreateUI()
    print("Creating compact UI...")
    
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
    
    -- Main container frame
    local mainFrame = Instance.new("Frame")
    mainFrame.Name = "MainFrame"
    mainFrame.BackgroundColor3 = Config.BackgroundColor
    mainFrame.BackgroundTransparency = Config.BackgroundTransparency
    mainFrame.Size = UDim2.new(0, 600, 0, 200)  -- Compact size
    mainFrame.Position = UDim2.new(0.5, -300, 0.05, 0)  -- Centered near top
    mainFrame.AnchorPoint = Vector2.new(0.5, 0)
    mainFrame.Parent = GUI
    ApplyStyle(mainFrame)
    
    -- Title bar
    local titleBar = Instance.new("Frame")
    titleBar.Name = "TitleBar"
    titleBar.BackgroundColor3 = Config.AccentColor
    titleBar.BackgroundTransparency = 0.7
    titleBar.Size = UDim2.new(1, 0, 0, 25)
    titleBar.Parent = mainFrame
    ApplyStyle(titleBar, nil, 0, 0)
    
    local titleLabel = Instance.new("TextLabel")
    titleLabel.Name = "TitleLabel"
    titleLabel.BackgroundTransparency = 1
    titleLabel.Size = UDim2.new(1, 0, 1, 0)
    titleLabel.Font = Config.Font
    titleLabel.Text = Config.UIName
    titleLabel.TextColor3 = Config.TextColor
    titleLabel.TextSize = 16
    titleLabel.Parent = titleBar
    
    -- Three-column layout
    local columnsFrame = Instance.new("Frame")
    columnsFrame.Name = "ColumnsFrame"
    columnsFrame.BackgroundTransparency = 1
    columnsFrame.Size = UDim2.new(1, -10, 1, -35)
    columnsFrame.Position = UDim2.new(0, 5, 0, 30)
    columnsFrame.Parent = mainFrame
    
    local gridLayout = Instance.new("UIGridLayout")
    gridLayout.CellPadding = UDim2.new(0, 5, 0, 0)
    gridLayout.CellSize = UDim2.new(0.33, -5, 1, 0)
    gridLayout.FillDirection = Enum.FillDirection.Horizontal
    gridLayout.SortOrder = Enum.SortOrder.LayoutOrder
    gridLayout.Parent = columnsFrame
    
    -- Left column: Items
    local itemsColumn = Instance.new("Frame")
    itemsColumn.Name = "ItemsColumn"
    itemsColumn.BackgroundTransparency = 1
    itemsColumn.Parent = columnsFrame
    
    local itemsTitle = Instance.new("TextLabel")
    itemsTitle.Name = "ItemsTitle"
    itemsTitle.BackgroundTransparency = 1
    itemsTitle.Size = UDim2.new(1, 0, 0, 20)
    itemsTitle.Font = Config.Font
    itemsTitle.Text = "Vật phẩm cần lấy"
    itemsTitle.TextColor3 = Config.AccentColor
    itemsTitle.TextSize = 14
    itemsTitle.Parent = itemsColumn
    
    local itemsList = Instance.new("Frame")
    itemsList.Name = "ItemsList"
    itemsList.BackgroundTransparency = 1
    itemsList.Size = UDim2.new(1, 0, 1, -25)
    itemsList.Position = UDim2.new(0, 0, 0, 25)
    itemsList.Parent = itemsColumn
    
    local itemsLayout = Instance.new("UIListLayout")
    itemsLayout.Padding = UDim.new(0, 5)
    itemsLayout.Parent = itemsList
    
    -- Create item entries
    for _, itemName in ipairs(PremiumItems) do
        local itemFrame = Instance.new("Frame")
        itemFrame.Name = "Item_" .. itemName:gsub(" ", "_")
        itemFrame.BackgroundTransparency = 1
        itemFrame.Size = UDim2.new(1, 0, 0, 25)
        itemFrame.Parent = itemsList
        
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
        itemLabel.Size = UDim2.new(0.8, 0, 1, 0)
        itemLabel.Position = UDim2.new(0.1, 0, 0, 0)
        itemLabel.Font = Config.Font
        itemLabel.Text = itemName
        itemLabel.TextColor3 = Config.MissingItemColor  -- Start as red (missing)
        itemLabel.TextSize = 14
        itemLabel.TextXAlignment = Enum.TextXAlignment.Left
        itemLabel.Parent = itemFrame
    end
    
    -- Middle column: Player Status
    local playerColumn = Instance.new("Frame")
    playerColumn.Name = "PlayerColumn"
    playerColumn.BackgroundTransparency = 1
    playerColumn.Parent = columnsFrame
    
    local playerTitle = Instance.new("TextLabel")
    playerTitle.Name = "PlayerTitle"
    playerTitle.BackgroundTransparency = 1
    playerTitle.Size = UDim2.new(1, 0, 0, 20)
    playerTitle.Font = Config.Font
    playerTitle.Text = "Trạng thái người chơi"
    playerTitle.TextColor3 = Config.AccentColor
    playerTitle.TextSize = 14
    playerTitle.Parent = playerColumn
    
    local playerStats = Instance.new("Frame")
    playerStats.Name = "PlayerStats"
    playerStats.BackgroundTransparency = 1
    playerStats.Size = UDim2.new(1, 0, 1, -25)
    playerStats.Position = UDim2.new(0, 0, 0, 25)
    playerStats.Parent = playerColumn
    
    local statsLayout = Instance.new("UIListLayout")
    statsLayout.Padding = UDim.new(0, 5)
    statsLayout.Parent = playerStats
    
    -- Player stats labels
    local playerLabels = {
        {Name = "PlayerName", Text = "Tên: "},
        {Name = "Level", Text = "Cấp độ: "},
        {Name = "Beli", Text = "Beli: "},
        {Name = "Fragments", Text = "Fragments: "},
        {Name = "Race", Text = "Race: "}
    }
    
    for _, label in ipairs(playerLabels) do
        local statLabel = Instance.new("TextLabel")
        statLabel.Name = label.Name
        statLabel.BackgroundTransparency = 1
        statLabel.Size = UDim2.new(1, 0, 0, 20)
        statLabel.Font = Config.Font
        statLabel.Text = label.Text .. "Đang tải..."
        statLabel.TextColor3 = Config.TextColor
        statLabel.TextSize = 14
        statLabel.TextXAlignment = Enum.TextXAlignment.Left
        statLabel.Parent = playerStats
    end
    
    -- Right column: Quest Status
    local questColumn = Instance.new("Frame")
    questColumn.Name = "QuestColumn"
    questColumn.BackgroundTransparency = 1
    questColumn.Parent = columnsFrame
    
    local questTitle = Instance.new("TextLabel")
    questTitle.Name = "QuestTitle"
    questTitle.BackgroundTransparency = 1
    questTitle.Size = UDim2.new(1, 0, 0, 20)
    questTitle.Font = Config.Font
    questTitle.Text = "Trạng thái nhiệm vụ"
    questTitle.TextColor3 = Config.AccentColor
    questTitle.TextSize = 14
    questTitle.Parent = questColumn
    
    local questStats = Instance.new("Frame")
    questStats.Name = "QuestStats"
    questStats.BackgroundTransparency = 1
    questStats.Size = UDim2.new(1, 0, 1, -25)
    questStats.Position = UDim2.new(0, 0, 0, 25)
    questStats.Parent = questColumn
    
    local questLayout = Instance.new("UIListLayout")
    questLayout.Padding = UDim.new(0, 5)
    questLayout.Parent = questStats
    
    -- Quest stats labels
    local questLabels = {
        {Name = "QuestName", Text = "Nhiệm vụ: "},
        {Name = "Objective", Text = "Mục tiêu: "},
        {Name = "Status", Text = "Tiến trình: "}
    }
    
    for _, label in ipairs(questLabels) do
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
        statLabel.Parent = questStats
    end
    
    -- Drag handler for main frame
    titleBar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            IsDragging = true
            DragStart = input.Position
            OriginalPos = mainFrame.Position
        end
    end)
    
    UserInputService.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement and IsDragging then
            local delta = input.Position - DragStart
            mainFrame.Position = UDim2.new(
                OriginalPos.X.Scale,
                OriginalPos.X.Offset + delta.X,
                OriginalPos.Y.Scale,
                OriginalPos.Y.Offset + delta.Y
            )
        end
    end)
    
    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            IsDragging = false
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
    if not GUI or not GUI:FindFirstChild("MainFrame") then return end
    
    local questStats = GUI.MainFrame.ColumnsFrame.QuestColumn.QuestStats
    local questData = self:GetCurrentQuest()
    
    local stats = {
        QuestName = questData.QuestName,
        Objective = questData.Objective,
        Status = questData.Status
    }
    
    for statName, value in pairs(stats) do
        local label = questStats:FindFirstChild(statName)
        if label then label.Text = label.Text:match("^.-: ") .. value end
    end
end

-- Update player info
function LionHub:UpdatePlayerInfo()
    if not GUI or not GUI:FindFirstChild("MainFrame") then return end
    
    local playerStats = GUI.MainFrame.ColumnsFrame.PlayerColumn.PlayerStats
    local data = LocalPlayer:FindFirstChild("Data")
    
    local stats = {
        PlayerName = LocalPlayer.Name,
        Level = data and data:FindFirstChild("Level") and data.Level.Value or "N/A",
        Beli = data and data:FindFirstChild("Beli") and self:FormatNumber(data.Beli.Value) or "0",
        Fragments = data and data:FindFirstChild("Fragments") and self:FormatNumber(data.Fragments.Value) or "0",
        Race = data and data:FindFirstChild("Race") and data.Race.Value or "Human"
    }
    
    for statName, value in pairs(stats) do
        local label = playerStats:FindFirstChild(statName)
        if label then label.Text = label.Text:match("^.-: ") .. value end
    end
    
    self:UpdatePremiumItems()
end

-- Update premium items
function LionHub:UpdatePremiumItems()
    if not GUI or not GUI:FindFirstChild("MainFrame") then return end
    
    local itemsList = GUI.MainFrame.ColumnsFrame.ItemsColumn.ItemsList
    for _, itemName in ipairs(PremiumItems) do
        local itemFrame = itemsList:FindFirstChild("Item_" .. itemName:gsub(" ", "_"))
        if itemFrame then
            local checkmark = itemFrame.CheckBox.Checkmark
            local itemLabel = itemFrame:FindFirstChild("ItemLabel")
            local hasItem = self:HasPremiumItem(itemName)
            checkmark.Visible = hasItem
            if itemLabel then
                itemLabel.TextColor3 = hasItem and Config.CheckmarkColor or Config.MissingItemColor
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
