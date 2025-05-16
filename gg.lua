local LocalPlayer = Players.LocalPlayer

-- Configuration
local Config = {
    UIName = "Lion Hub",
    BackgroundColor = Color3.fromRGB(15, 15, 20),
    BackgroundTransparency = 0.2,
    TextColor = Color3.fromRGB(255, 255, 255),
    AccentColor = Color3.fromRGB(0, 150, 255),
    CheckmarkColor = Color3.fromRGB(50, 255, 50),
    MissingItemColor = Color3.fromRGB(255, 70, 70),
    Font = Enum.Font.GothamBold,
    RefreshRate = 1,
    CornerRadius = 12,
    BorderThickness = 2
}

-- Premium items to track with their alternative names
local PremiumItems = {
    ["God Human"] = {"God Human", "GodHuman"},
    ["Cursed Dual Katana"] = {"Cursed Dual Katana"},
    ["Soul Guitar"] = {"Soul Guitar", "Skull Guitar"},
    ["Mirror Fractal"] = {"Mirror Fractal"},
    ["Valkyrie Helm"] = {"Valkyrie Helm"}
}

-- UI state
local GUI

-- Helper function to apply common UI styling
local function ApplyStyle(frame, color, thickness, cornerRadius)
    local stroke = Instance.new("UIStroke")
    stroke.Color = color or Config.AccentColor
    stroke.Thickness = thickness or Config.BorderThickness
    stroke.Parent = frame
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, cornerRadius or Config.CornerRadius)
    corner.Parent = frame
end

-- Create decorative border effect
local function AddDecorativeBorder(parent)
    local border = Instance.new("Frame")
    border.Name = "DecorativeBorder"
    border.BackgroundTransparency = 1
    border.Size = UDim2.new(1, 6, 1, 6)
    border.Position = UDim2.new(0, -3, 0, -3)
    border.ZIndex = -1
    
    local innerGlow = Instance.new("UIStroke")
    innerGlow.Color = Config.AccentColor
    innerGlow.Thickness = 2
    innerGlow.Transparency = 0.7
    innerGlow.Parent = border
    
    local outerGlow = Instance.new("UIStroke")
    outerGlow.Color = Config.AccentColor
    outerGlow.Thickness = 4
    outerGlow.Transparency = 0.9
    outerGlow.Parent = border
    
    ApplyStyle(border)
    border.Parent = parent
end

-- Create fixed UI with decorations
function LionHub:CreateUI()
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
        GUI.Parent = LocalPlayer:WaitForChild("PlayerGui")
    end
    
    -- Main container frame (fixed position) - INCREASED WIDTH, DECREASED HEIGHT
    local mainFrame = Instance.new("Frame")
    mainFrame.Name = "MainFrame"
    mainFrame.BackgroundColor3 = Config.BackgroundColor
    mainFrame.BackgroundTransparency = Config.BackgroundTransparency
    mainFrame.Size = UDim2.new(0, 800, 0, 170) -- Wider but shorter UI
    mainFrame.Position = UDim2.new(0.02, 0, 0.02, 0)
    mainFrame.ClipsDescendants = true
    mainFrame.Parent = GUI
    
    -- Add decorative border
    AddDecorativeBorder(mainFrame)
    
    -- Title bar with decorative elements
    local titleBar = Instance.new("Frame")
    titleBar.Name = "TitleBar"
    titleBar.BackgroundColor3 = Config.AccentColor
    titleBar.BackgroundTransparency = 0.85
    titleBar.Size = UDim2.new(1, 0, 0, 30)
    titleBar.Parent = mainFrame
    
    -- Title bar gradient effect
    local gradient = Instance.new("UIGradient")
    gradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Config.AccentColor),
        ColorSequenceKeypoint.new(0.5, Color3.fromRGB(0, 180, 255)),
        ColorSequenceKeypoint.new(1, Config.AccentColor)
    })
    gradient.Rotation = 90
    gradient.Parent = titleBar
    
    -- Corner mask for title bar
    local titleCorner = Instance.new("UICorner")
    titleCorner.CornerRadius = UDim.new(0, Config.CornerRadius)
    titleCorner.Parent = titleBar
    
    -- Title label with glow effect
    local titleLabel = Instance.new("TextLabel")
    titleLabel.Name = "TitleLabel"
    titleLabel.BackgroundTransparency = 1
    titleLabel.Size = UDim2.new(1, -40, 1, 0)
    titleLabel.Position = UDim2.new(0, 40, 0, 0)
    titleLabel.Font = Config.Font
    titleLabel.Text = Config.UIName
    titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    titleLabel.TextSize = 18
    titleLabel.TextXAlignment = Enum.TextXAlignment.Left
    titleLabel.Parent = titleBar
    
    -- Add text glow effect
    local textGlow = Instance.new("UIStroke")
    textGlow.Color = Color3.fromRGB(255, 255, 255)
    textGlow.Thickness = 2
    textGlow.Transparency = 0.7
    textGlow.Parent = titleLabel
    
    -- Three-column layout container
    local columnsFrame = Instance.new("Frame")
    columnsFrame.Name = "ColumnsFrame"
    columnsFrame.BackgroundTransparency = 1
    columnsFrame.Size = UDim2.new(1, -20, 1, -40)
    columnsFrame.Position = UDim2.new(0, 10, 0, 35)
    columnsFrame.Parent = mainFrame
    
    local gridLayout = Instance.new("UIGridLayout")
    gridLayout.CellPadding = UDim2.new(0, 10, 0, 0)
    gridLayout.CellSize = UDim2.new(0.33, -10, 1, 0)
    gridLayout.FillDirection = Enum.FillDirection.Horizontal
    gridLayout.SortOrder = Enum.SortOrder.LayoutOrder
    gridLayout.Parent = columnsFrame
    
    -- Left column: Items
    local itemsColumn = Instance.new("Frame")
    itemsColumn.Name = "ItemsColumn"
    itemsColumn.BackgroundTransparency = 1
    itemsColumn.Parent = columnsFrame
    
    local itemsHeader = Instance.new("Frame")
    itemsHeader.Name = "Header"
    itemsHeader.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
    itemsHeader.BackgroundTransparency = 0.7
    itemsHeader.Size = UDim2.new(1, 0, 0, 25)
    itemsHeader.Parent = itemsColumn
    
    local itemsHeaderLabel = Instance.new("TextLabel")
    itemsHeaderLabel.Name = "HeaderLabel"
    itemsHeaderLabel.BackgroundTransparency = 1
    itemsHeaderLabel.Size = UDim2.new(1, -10, 1, 0)
    itemsHeaderLabel.Position = UDim2.new(0, 10, 0, 0)
    itemsHeaderLabel.Font = Config.Font
    itemsHeaderLabel.Text = "Vật phẩm cần lấy"
    itemsHeaderLabel.TextColor3 = Config.AccentColor
    itemsHeaderLabel.TextSize = 14
    itemsHeaderLabel.TextXAlignment = Enum.TextXAlignment.Left
    itemsHeaderLabel.Parent = itemsHeader
    
    local itemsContent = Instance.new("Frame")
    itemsContent.Name = "Content"
    itemsContent.BackgroundTransparency = 1
    itemsContent.Size = UDim2.new(1, 0, 1, -30)
    itemsContent.Position = UDim2.new(0, 0, 0, 30)
    itemsContent.Parent = itemsColumn
    
    local itemsLayout = Instance.new("UIListLayout")
    itemsLayout.Padding = UDim.new(0, 5)
    itemsLayout.Parent = itemsContent
    
    -- Create item entries
    for mainItemName, alternativeNames in pairs(PremiumItems) do
        local itemFrame = Instance.new("Frame")
        itemFrame.Name = "Item_" .. mainItemName:gsub(" ", "_")
        itemFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 30)
        itemFrame.BackgroundTransparency = 0.7
        itemFrame.Size = UDim2.new(1, 0, 0, 22) -- Reduced height for items
        itemFrame.Parent = itemsContent
        ApplyStyle(itemFrame, Config.AccentColor, 1, 6)
        
        local checkBox = Instance.new("Frame")
        checkBox.Name = "CheckBox"
        checkBox.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
        checkBox.BackgroundTransparency = 0.5
        checkBox.Size = UDim2.new(0, 18, 0, 18) -- Smaller checkbox
        checkBox.Position = UDim2.new(0, 5, 0, 2)
        checkBox.Parent = itemFrame
        ApplyStyle(checkBox, Color3.fromRGB(100, 100, 120), 1, 4)
        
        local checkmark = Instance.new("TextLabel")
        checkmark.Name = "Checkmark"
        checkmark.BackgroundTransparency = 1
        checkmark.Size = UDim2.new(1, 0, 1, 0)
        checkmark.Font = Enum.Font.GothamBlack
        checkmark.Text = "✓"
        checkmark.TextColor3 = Config.CheckmarkColor
        checkmark.TextSize = 16 -- Smaller checkmark
        checkmark.Visible = false
        checkmark.Parent = checkBox
        
        local itemLabel = Instance.new("TextLabel")
        itemLabel.Name = "ItemLabel"
        itemLabel.BackgroundTransparency = 1
        itemLabel.Size = UDim2.new(0.8, 0, 1, 0)
        itemLabel.Position = UDim2.new(0.1, 0, 0, 0)
        itemLabel.Font = Config.Font
        itemLabel.Text = mainItemName
        itemLabel.TextColor3 = Config.MissingItemColor
        itemLabel.TextSize = 14
        itemLabel.TextXAlignment = Enum.TextXAlignment.Left
        itemLabel.Parent = itemFrame
    end
    
    -- Middle column: Player Status
    local playerColumn = Instance.new("Frame")
    playerColumn.Name = "PlayerColumn"
    playerColumn.BackgroundTransparency = 1
    playerColumn.Parent = columnsFrame
    
    local playerHeader = Instance.new("Frame")
    playerHeader.Name = "Header"
    playerHeader.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
    playerHeader.BackgroundTransparency = 0.7
    playerHeader.Size = UDim2.new(1, 0, 0, 25)
    playerHeader.Parent = playerColumn
    
    local playerHeaderLabel = Instance.new("TextLabel")
    playerHeaderLabel.Name = "HeaderLabel"
    playerHeaderLabel.BackgroundTransparency = 1
    playerHeaderLabel.Size = UDim2.new(1, -10, 1, 0)
    playerHeaderLabel.Position = UDim2.new(0, 10, 0, 0)
    playerHeaderLabel.Font = Config.Font
    playerHeaderLabel.Text = "Trạng thái người chơi"
    playerHeaderLabel.TextColor3 = Config.TextColor
    playerHeaderLabel.TextSize = 14
    playerHeaderLabel.TextXAlignment = Enum.TextXAlignment.Left
    playerHeaderLabel.Parent = playerHeader
    
    local playerContent = Instance.new("Frame")
    playerContent.Name = "Content"
    playerContent.BackgroundTransparency = 1
    playerContent.Size = UDim2.new(1, 0, 1, -30)
    playerContent.Position = UDim2.new(0, 0, 0, 30)
    playerContent.Parent = playerColumn
    
    local playerLayout = Instance.new("UIListLayout")
    playerLayout.Padding = UDim.new(0, 5)
    playerLayout.Parent = playerContent
    
    -- Player stats labels
    local playerLabels = {
        {Name = "PlayerName", Text = "Tên: "},
        {Name = "Level", Text = "Cấp độ: "},
        {Name = "Beli", Text = "Beli: "},
        {Name = "Fragments", Text = "Fragments: "},
        {Name = "Race", Text = "Race: "}
    }
    
    for _, label in ipairs(playerLabels) do
        local statFrame = Instance.new("Frame")
        statFrame.Name = label.Name .. "Frame"
        statFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 30)
        statFrame.BackgroundTransparency = 0.8
        statFrame.Size = UDim2.new(1, 0, 0, 20) -- Reduced height for stats
        statFrame.Parent = playerContent
        ApplyStyle(statFrame, nil, 1, 6)
        
        local statLabel = Instance.new("TextLabel")
        statLabel.Name = label.Name
        statLabel.BackgroundTransparency = 1
        statLabel.Size = UDim2.new(1, -10, 1, 0)
        statLabel.Position = UDim2.new(0, 10, 0, 0)
        statLabel.Font = Config.Font
        statLabel.Text = label.Text .. "Đang tải..."
        statLabel.TextColor3 = Config.TextColor
        statLabel.TextSize = 14
        statLabel.TextXAlignment = Enum.TextXAlignment.Left
        statLabel.Parent = statFrame
    end
    
    -- Right column: Quest Status
    local questColumn = Instance.new("Frame")
    questColumn.Name = "QuestColumn"
    questColumn.BackgroundTransparency = 1
    questColumn.Parent = columnsFrame
    
    local questHeader = Instance.new("Frame")
    questHeader.Name = "Header"
    questHeader.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
    questHeader.BackgroundTransparency = 0.7
    questHeader.Size = UDim2.new(1, 0, 0, 25)
    questHeader.Parent = questColumn
    
    local questHeaderLabel = Instance.new("TextLabel")
    questHeaderLabel.Name = "HeaderLabel"
    questHeaderLabel.BackgroundTransparency = 1
    questHeaderLabel.Size = UDim2.new(1, -10, 1, 0)
    questHeaderLabel.Position = UDim2.new(0, 10, 0, 0)
    questHeaderLabel.Font = Config.Font
    questHeaderLabel.Text = "Trạng thái nhiệm vụ"
    questHeaderLabel.TextColor3 = Config.TextColor
    questHeaderLabel.TextSize = 14
    questHeaderLabel.TextXAlignment = Enum.TextXAlignment.Left
    questHeaderLabel.Parent = questHeader
    
    local questContent = Instance.new("Frame")
    questContent.Name = "Content"
    questContent.BackgroundTransparency = 1
    questContent.Size = UDim2.new(1, 0, 1, -30)
    questContent.Position = UDim2.new(0, 0, 0, 30)
    questContent.Parent = questColumn
    
    local questLayout = Instance.new("UIListLayout")
    questLayout.Padding = UDim.new(0, 5)
    questLayout.Parent = questContent
    
    -- Quest stats labels
    local questLabels = {
        {Name = "QuestName", Text = "Nhiệm vụ: "},
        {Name = "Objective", Text = "Mục tiêu: "},
        {Name = "Status", Text = "Tiến trình: "}
    }
    
    for _, label in ipairs(questLabels) do
        local statFrame = Instance.new("Frame")
        statFrame.Name = label.Name .. "Frame"
        statFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 30)
        statFrame.BackgroundTransparency = 0.8
        statFrame.Size = UDim2.new(1, 0, 0, 25)
        statFrame.Parent = questContent
        ApplyStyle(statFrame, nil, 1, 6)
        
        local statLabel = Instance.new("TextLabel")
        statLabel.Name = label.Name
        statLabel.BackgroundTransparency = 1
        statLabel.Size = UDim2.new(1, -10, 1, 0)
        statLabel.Position = UDim2.new(0, 10, 0, 0)
        statLabel.Font = Config.Font
        statLabel.Text = label.Text .. "Đang tải..."
        statLabel.TextColor3 = Config.TextColor
        statLabel.TextSize = 14
        statLabel.TextXAlignment = Enum.TextXAlignment.Left
        statLabel.TextWrapped = true
        statLabel.Parent = statFrame
    end
    
    -- Add separator lines between columns
    for i = 1, 2 do
        local separator = Instance.new("Frame")
        separator.Name = "Separator_" .. i
        separator.BackgroundColor3 = Config.AccentColor
        separator.BackgroundTransparency = 0.8
        separator.BorderSizePixel = 0
        separator.Size = UDim2.new(0, 1, 0.9, 0)
        separator.Position = UDim2.new(0.33 * i, -1, 0.05, 0)
        separator.ZIndex = 2
        separator.Parent = columnsFrame
        
        local glow = Instance.new("UIStroke")
        glow.Color = Config.AccentColor
        glow.Thickness = 2
        glow.Transparency = 0.5
        glow.Parent = separator
    end
end

-- Fetch current quest
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
    
    local questContent = GUI.MainFrame.ColumnsFrame.QuestColumn.Content
    local questData = self:GetCurrentQuest()
    
    local stats = {
        QuestName = questData.QuestName,
        Objective = questData.Objective,
        Status = questData.Status
    }
    
    for statName, value in pairs(stats) do
        local frame = questContent:FindFirstChild(statName .. "Frame")
        if frame then
            local label = frame:FindFirstChild(statName)
            if label then label.Text = label.Text:match("^.-: ") .. value end
        end
    end
end

-- Update player info
function LionHub:UpdatePlayerInfo()
    if not GUI or not GUI:FindFirstChild("MainFrame") then return end
    
    local playerContent = GUI.MainFrame.ColumnsFrame.PlayerColumn.Content
    local data = LocalPlayer:FindFirstChild("Data")
    
    local stats = {
        PlayerName = LocalPlayer.Name,
        Level = data and data:FindFirstChild("Level") and data.Level.Value or "N/A",
        Beli = data and data:FindFirstChild("Beli") and self:FormatNumber(data.Beli.Value) or "0",
        Fragments = data and data:FindFirstChild("Fragments") and self:FormatNumber(data.Fragments.Value) or "0",
        Race = data and data:FindFirstChild("Race") and data.Race.Value or "Human"
    }
    
    for statName, value in pairs(stats) do
        local frame = playerContent:FindFirstChild(statName .. "Frame")
        if frame then
            local label = frame:FindFirstChild(statName)
            if label then label.Text = label.Text:match("^.-: ") .. value end
        end
    end
    
    self:UpdatePremiumItems()
end

-- Update premium items - IMPROVED TO CHECK ALTERNATIVE NAMES
function LionHub:UpdatePremiumItems()
    if not GUI or not GUI:FindFirstChild("MainFrame") then return end
    
    local itemsContent = GUI.MainFrame.ColumnsFrame.ItemsColumn.Content
    for mainItemName, _ in pairs(PremiumItems) do
        local itemFrame = itemsContent:FindFirstChild("Item_" .. mainItemName:gsub(" ", "_"))
        if itemFrame then
            local checkmark = itemFrame.CheckBox.Checkmark
            local itemLabel = itemFrame:FindFirstChild("ItemLabel")
            local hasItem = self:HasPremiumItem(mainItemName)
            checkmark.Visible = hasItem
            if itemLabel then
                itemLabel.TextColor3 = hasItem and Config.CheckmarkColor or Config.MissingItemColor
            end
        end
    end
end

-- Check for premium item WITH ALTERNATIVE NAMES
function LionHub:HasPremiumItem(mainItemName)
    local alternativeNames = PremiumItems[mainItemName] or {mainItemName}
    
    -- Function to check if an item matches any of the alternative names
    local function itemMatches(item)
        for _, name in ipairs(alternativeNames) do
            if item.Name == name then
                return true
            end
        end
        return false
    end
    
    -- Check backpack
    local backpack = LocalPlayer:FindFirstChild("Backpack")
    if backpack then
        for _, item in ipairs(backpack:GetChildren()) do
            if itemMatches(item) then return true end
        end
    end
    
    -- Check character
    local character = LocalPlayer.Character
    if character then
        for _, item in ipairs(character:GetChildren()) do
            if itemMatches(item) then return true end
        end
    end
    
    -- Check data inventory
    local data = LocalPlayer:FindFirstChild("Data")
    if data and data:FindFirstChild("Inventory") then
        for _, item in ipairs(data.Inventory:GetChildren()) do
            if itemMatches(item) then return true end
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
        
        -- Initial update
        self:UpdatePlayerInfo()
        self:UpdateQuestInfo()
        
        -- Set up periodic updates
        spawn(function()
            while wait(Config.RefreshRate) do
                self:UpdatePlayerInfo()
                self:UpdateQuestInfo()
            end
        end)
    end)
    
    if not success then
        warn("Lion Hub Error: " .. tostring(err))
    end
end

-- Initialize
LionHub:Start()

return LionHub
