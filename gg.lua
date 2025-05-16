local LionHub = {}
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- Config
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

local PremiumItems = {
    ["God Human"] = {"God Human", "GodHuman"},
    ["Cursed Dual Katana"] = {"Cursed Dual Katana"},
    ["Soul Guitar"] = {"Soul Guitar", "Skull Guitar"},
    ["Mirror Fractal"] = {"Mirror Fractal"},
    ["Valkyrie Helm"] = {"Valkyrie Helm"}
}

local GUI

local function ApplyStyle(frame, color, thickness, cornerRadius)
    local stroke = Instance.new("UIStroke")
    stroke.Color = color or Config.AccentColor
    stroke.Thickness = thickness or Config.BorderThickness
    stroke.Parent = frame
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, cornerRadius or Config.CornerRadius)
    corner.Parent = frame
end

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

function LionHub:CreateUI()
    -- Clean up
    for _, parent in ipairs({game.CoreGui, LocalPlayer.PlayerGui}) do
        local existingUI = parent:FindFirstChild("LionHubUI")
        if existingUI then existingUI:Destroy() end
    end

    -- ScreenGui full screen
    GUI = Instance.new("ScreenGui")
    GUI.Name = "LionHubUI"
    GUI.ResetOnSpawn = false
    GUI.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    GUI.IgnoreGuiInset = true
    local parentSet = pcall(function() GUI.Parent = game.CoreGui end)
    if not parentSet then
        GUI.Parent = LocalPlayer:WaitForChild("PlayerGui")
    end

    -- Main frame full screen
    local mainFrame = Instance.new("Frame")
    mainFrame.Name = "MainFrame"
    mainFrame.BackgroundColor3 = Config.BackgroundColor
    mainFrame.BackgroundTransparency = Config.BackgroundTransparency
    mainFrame.Size = UDim2.new(1, 0, 1, 0)
    mainFrame.Position = UDim2.new(0, 0, 0, 0)
    mainFrame.ClipsDescendants = true
    mainFrame.Parent = GUI
    ApplyStyle(mainFrame)
    AddDecorativeBorder(mainFrame)

    -- Title bar
    local titleBar = Instance.new("Frame")
    titleBar.Name = "TitleBar"
    titleBar.BackgroundColor3 = Config.AccentColor
    titleBar.BackgroundTransparency = 0.85
    titleBar.Size = UDim2.new(1, 0, 0, 40)
    titleBar.Parent = mainFrame
    local gradient = Instance.new("UIGradient")
    gradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Config.AccentColor),
        ColorSequenceKeypoint.new(0.5, Color3.fromRGB(0, 180, 255)),
        ColorSequenceKeypoint.new(1, Config.AccentColor)
    })
    gradient.Rotation = 90
    gradient.Parent = titleBar
    local titleCorner = Instance.new("UICorner")
    titleCorner.CornerRadius = UDim.new(0, Config.CornerRadius)
    titleCorner.Parent = titleBar
    local titleLabel = Instance.new("TextLabel")
    titleLabel.Name = "TitleLabel"
    titleLabel.BackgroundTransparency = 1
    titleLabel.Size = UDim2.new(1, -40, 1, 0)
    titleLabel.Position = UDim2.new(0, 40, 0, 0)
    titleLabel.Font = Config.Font
    titleLabel.Text = Config.UIName
    titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    titleLabel.TextSize = 22
    titleLabel.TextXAlignment = Enum.TextXAlignment.Left
    titleLabel.Parent = titleBar
    local textGlow = Instance.new("UIStroke")
    textGlow.Color = Color3.fromRGB(255, 255, 255)
    textGlow.Thickness = 2
    textGlow.Transparency = 0.7
    textGlow.Parent = titleLabel

    -- Columns
    local columnsFrame = Instance.new("Frame")
    columnsFrame.Name = "ColumnsFrame"
    columnsFrame.BackgroundTransparency = 1
    columnsFrame.Size = UDim2.new(1, -20, 1, -60)
    columnsFrame.Position = UDim2.new(0, 10, 0, 50)
    columnsFrame.Parent = mainFrame
    local gridLayout = Instance.new("UIGridLayout")
    gridLayout.CellPadding = UDim2.new(0, 10, 0, 0)
    gridLayout.CellSize = UDim2.new(0.33, -10, 1, 0)
    gridLayout.FillDirection = Enum.FillDirection.Horizontal
    gridLayout.SortOrder = Enum.SortOrder.LayoutOrder
    gridLayout.Parent = columnsFrame

    -- Helper for column
    local function CreateColumn(name, headerText, color)
        local col = Instance.new("Frame")
        col.Name = name
        col.BackgroundTransparency = 1
        local header = Instance.new("Frame")
        header.Name = "Header"
        header.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
        header.BackgroundTransparency = 0.7
        header.Size = UDim2.new(1, 0, 0, 30)
        header.Parent = col
        local headerLabel = Instance.new("TextLabel")
        headerLabel.Name = "HeaderLabel"
        headerLabel.BackgroundTransparency = 1
        headerLabel.Size = UDim2.new(1, -10, 1, 0)
        headerLabel.Position = UDim2.new(0, 10, 0, 0)
        headerLabel.Font = Config.Font
        headerLabel.Text = headerText
        headerLabel.TextColor3 = color or Config.TextColor
        headerLabel.TextSize = 16
        headerLabel.TextXAlignment = Enum.TextXAlignment.Left
        headerLabel.Parent = header
        local content = Instance.new("Frame")
        content.Name = "Content"
        content.BackgroundTransparency = 1
        content.Size = UDim2.new(1, 0, 1, -35)
        content.Position = UDim2.new(0, 0, 0, 35)
        content.Parent = col
        local layout = Instance.new("UIListLayout")
        layout.Padding = UDim.new(0, 5)
        layout.Parent = content
        col.Parent = columnsFrame
        return content
    end

    -- Left: Items
    local itemsContent = CreateColumn("ItemsColumn", "Vật phẩm cần lấy", Config.AccentColor)
    for mainItemName in pairs(PremiumItems) do
        local itemFrame = Instance.new("Frame")
        itemFrame.Name = "Item_" .. mainItemName:gsub(" ", "_")
        itemFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 30)
        itemFrame.BackgroundTransparency = 0.7
        itemFrame.Size = UDim2.new(1, 0, 0, 28)
        itemFrame.Parent = itemsContent
        ApplyStyle(itemFrame, Config.AccentColor, 1, 6)
        local checkBox = Instance.new("Frame")
        checkBox.Name = "CheckBox"
        checkBox.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
        checkBox.BackgroundTransparency = 0.5
        checkBox.Size = UDim2.new(0, 20, 0, 20)
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
        itemLabel.Position = UDim2.new(0.13, 0, 0, 0)
        itemLabel.Font = Config.Font
        itemLabel.Text = mainItemName
        itemLabel.TextColor3 = Config.MissingItemColor
        itemLabel.TextSize = 15
        itemLabel.TextXAlignment = Enum.TextXAlignment.Left
        itemLabel.Parent = itemFrame
    end

    -- Middle: Player
    local playerContent = CreateColumn("PlayerColumn", "Trạng thái người chơi")
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
        statFrame.Size = UDim2.new(1, 0, 0, 22)
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

    -- Right: Quest
    local questContent = CreateColumn("QuestColumn", "Trạng thái nhiệm vụ")
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
        statFrame.Size = UDim2.new(1, 0, 0, 22)
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

    -- Separator
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

-- Check for premium item (tối ưu, kiểm tra nhiều nơi)
function LionHub:HasPremiumItem(mainItemName)
    local alternativeNames = PremiumItems[mainItemName] or {mainItemName}
    local function itemMatches(item)
        for _, name in ipairs(alternativeNames) do
            if item.Name == name or (item.Value and item.Value == name) then
                return true
            end
        end
        return false
    end
    -- Backpack
    local backpack = LocalPlayer:FindFirstChild("Backpack")
    if backpack then
        for _, item in ipairs(backpack:GetChildren()) do
            if itemMatches(item) then return true end
        end
    end
    -- Character
    local character = LocalPlayer.Character
    if character then
        for _, item in ipairs(character:GetChildren()) do
            if itemMatches(item) then return true end
        end
    end
    -- Data inventory & các folder đặc biệt
    local data = LocalPlayer:FindFirstChild("Data")
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
        -- Trường hợp đặc biệt: God Human, Mirror Fractal, Valkyrie Helm là Value trực tiếp
        for _, name in ipairs(alternativeNames) do
            local v = data:FindFirstChild(name)
            if v and ((v.Value and v.Value ~= "" and v.Value ~= false and v.Value ~= 0) or (v:IsA("BoolValue") and v.Value)) then
                return true
            end
        end
    end
    return false
end

function LionHub:UpdatePremiumItems()
    if not GUI or not GUI:FindFirstChild("MainFrame") then return end
    local itemsContent = GUI.MainFrame.ColumnsFrame.ItemsColumn.Content
    for mainItemName in pairs(PremiumItems) do
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

function LionHub:FormatNumber(number)
    number = tonumber(number) or 0
    if number >= 1e9 then return string.format("%.2fB", number / 1e9) end
    if number >= 1e6 then return string.format("%.2fM", number / 1e6) end
    if number >= 1e3 then return string.format("%.2fK", number / 1e3) end
    return tostring(number)
end

function LionHub:Start()
    local success, err = pcall(function()
        self:CreateUI()
        self:UpdatePlayerInfo()
        self:UpdateQuestInfo()
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

LionHub:Start()
return LionHub
