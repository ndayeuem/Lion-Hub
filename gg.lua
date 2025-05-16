local LionHub = {}
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- Configuration
local Config = {
    UIName = "Lion Hub",
    BackgroundColor = Color3.fromRGB(15, 15, 20),  -- Dark blue-black background
    BackgroundTransparency = 0.2,
    TextColor = Color3.fromRGB(255, 255, 255),
    AccentColor = Color3.fromRGB(0, 150, 255),     -- Bright blue accent
    CheckmarkColor = Color3.fromRGB(50, 255, 50),  -- Bright green for owned items
    MissingItemColor = Color3.fromRGB(255, 70, 70),-- Bright red for missing items
    Font = Enum.Font.GothamBold,
    RefreshRate = 1,
    CornerRadius = 12,
    BorderThickness = 2
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
    print("Creating enhanced fixed UI...")
    
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
    
    -- Main container frame (fixed position)
    local mainFrame = Instance.new("Frame")
    mainFrame.Name = "MainFrame"
    mainFrame.BackgroundColor3 = Config.BackgroundColor
    mainFrame.BackgroundTransparency = Config.BackgroundTransparency
    mainFrame.Size = UDim2.new(0, 650, 0, 220)  -- Slightly larger for decorations
    mainFrame.Position = UDim2.new(0.02, 0, 0.02, 0)  -- Fixed position top-left
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
    
    -- Lion emblem decoration
    local emblem = Instance.new("ImageLabel")
    emblem.Name = "Emblem"
    emblem.BackgroundTransparency = 1
    emblem.Size = UDim2.new(0, 24, 0, 24)
    emblem.Position = UDim2.new(0, 8, 0, 3)
    emblem.Image = "rbxassetid://123456789" -- Replace with your emblem image ID
    emblem.ImageColor3 = Color3.fromRGB(255, 255, 255)
    emblem.Parent = titleBar
    
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
    
    -- Left column: Items with decorative header
    local itemsColumn = self:CreateColumn(columnsFrame, "Vật phẩm cần lấy", true)
    
    -- Middle column: Player Status with decorative header
    local playerColumn = self:CreateColumn(columnsFrame, "Trạng thái người chơi", false)
    
    -- Right column: Quest Status with decorative header
    local questColumn = self:CreateColumn(columnsFrame, "Trạng thái nhiệm vụ", false)
    
    -- Add separator lines between columns
    self:AddColumnSeparators(columnsFrame)
    
    -- Initialize content for each column
    self:InitializeItemsColumn(itemsColumn)
    self:InitializePlayerColumn(playerColumn)
    self:InitializeQuestColumn(questColumn)
end

-- Create a standardized column with header
function LionHub:CreateColumn(parent, title, isItemsColumn)
    local column = Instance.new("Frame")
    column.Name = title:gsub(" ", "") .. "Column"
    column.BackgroundTransparency = 1
    column.Parent = parent
    
    -- Column header with decoration
    local header = Instance.new("Frame")
    header.Name = "Header"
    header.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
    header.BackgroundTransparency = 0.7
    header.Size = UDim2.new(1, 0, 0, 25)
    header.Parent = column
    
    local headerCorner = Instance.new("UICorner")
    headerCorner.CornerRadius = UDim.new(0, 6)
    headerCorner.Parent = header
    
    local headerLabel = Instance.new("TextLabel")
    headerLabel.Name = "HeaderLabel"
    headerLabel.BackgroundTransparency = 1
    headerLabel.Size = UDim2.new(1, -10, 1, 0)
    headerLabel.Position = UDim2.new(0, 10, 0, 0)
    headerLabel.Font = Config.Font
    headerLabel.Text = title
    headerLabel.TextColor3 = isItemsColumn and Config.AccentColor or Config.TextColor
    headerLabel.TextSize = 14
    headerLabel.TextXAlignment = Enum.TextXAlignment.Left
    headerLabel.Parent = header
    
    -- Content frame
    local content = Instance.new("Frame")
    content.Name = "Content"
    content.BackgroundTransparency = 1
    content.Size = UDim2.new(1, 0, 1, -30)
    content.Position = UDim2.new(0, 0, 0, 30)
    content.Parent = column
    
    local contentLayout = Instance.new("UIListLayout")
    contentLayout.Padding = UDim.new(0, 5)
    contentLayout.Parent = content
    
    return column
end

-- Add decorative separators between columns
function LionHub:AddColumnSeparators(columnsFrame)
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
        
        -- Add glow effect
        local glow = Instance.new("UIStroke")
        glow.Color = Config.AccentColor
        glow.Thickness = 2
        glow.Transparency = 0.5
        glow.Parent = separator
    end
end

-- Initialize items column content
function LionHub:InitializeItemsColumn(column)
    local content = column.Content
    
    -- Create item entries with decorative elements
    for _, itemName in ipairs(PremiumItems) do
        local itemFrame = Instance.new("Frame")
        itemFrame.Name = "Item_" .. itemName:gsub(" ", "_")
        itemFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 30)
        itemFrame.BackgroundTransparency = 0.7
        itemFrame.Size = UDim2.new(1, 0, 0, 30)
        itemFrame.Parent = content
        ApplyStyle(itemFrame, Config.AccentColor, 1, 6)
        
        local checkBox = Instance.new("Frame")
        checkBox.Name = "CheckBox"
        checkBox.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
        checkBox.BackgroundTransparency = 0.5
        checkBox.Size = UDim2.new(0, 22, 0, 22)
        checkBox.Position = UDim2.new(0, 5, 0, 4)
        checkBox.Parent = itemFrame
        ApplyStyle(checkBox, Color3.fromRGB(100, 100, 120), 1, 4)
        
        local checkmark = Instance.new("TextLabel")
        checkmark.Name = "Checkmark"
        checkmark.BackgroundTransparency = 1
        checkmark.Size = UDim2.new(1, 0, 1, 0)
        checkmark.Font = Enum.Font.GothamBlack
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
        itemLabel.TextColor3 = Config.MissingItemColor
        itemLabel.TextSize = 14
        itemLabel.TextXAlignment = Enum.TextXAlignment.Left
        itemLabel.Parent = itemFrame
        
        -- Add hover effect
        itemFrame.MouseEnter:Connect(function()
            itemFrame.BackgroundTransparency = 0.6
        end)
        
        itemFrame.MouseLeave:Connect(function()
            itemFrame.BackgroundTransparency = 0.7
        end)
    end
end

-- Initialize player column content
function LionHub:InitializePlayerColumn(column)
    local content = column.Content
    
    -- Player stats labels with decorative backgrounds
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
        statFrame.Size = UDim2.new(1, 0, 0, 25)
        statFrame.Parent = content
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
end

-- Initialize quest column content
function LionHub:InitializeQuestColumn(column)
    local content = column.Content
    
    -- Quest stats labels with decorative backgrounds
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
        statFrame.Parent = content
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
end

-- [Rest of the code remains the same as previous version for functionality]
-- (GetCurrentQuest, UpdateQuestInfo, UpdatePlayerInfo, UpdatePremiumItems, 
-- HasPremiumItem, FormatNumber, Start functions)

-- Initialize
LionHub:Start()

return LionHub
