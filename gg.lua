-- Lion Hub UI dành cho Blox Fruit
-- Giao diện theo dõi trạng thái người chơi với hiệu ứng làm mờ màn hình

local LionHub = {}
local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local Lighting = game:GetService("Lighting")
local LocalPlayer = Players.LocalPlayer

-- Cấu hình giao diện
local Config = {
    UIName = "Lion Hub",
    BackgroundColor = Color3.fromRGB(0, 0, 0),
    BackgroundTransparency = 0.6,
    TextColor = Color3.fromRGB(255, 255, 255),
    AccentColor = Color3.fromRGB(255, 215, 0), -- Màu vàng
    CheckmarkColor = Color3.fromRGB(0, 255, 0), -- Màu xanh cho dấu tích
    FontSize = Enum.FontSize.Size14,
    Font = Enum.Font.SourceSansBold,
    RefreshRate = 1, -- Tần suất cập nhật (giây)
    ToggleKey = Enum.KeyCode.RightShift
}

-- Các vật phẩm cao cấp cần theo dõi
local PremiumItems = {
    "God Human",
    "Cursed Dual Katana",
    "Soul Guitar",
    "Mirror Fractal"
}

-- Biến lưu trữ UI và hiệu ứng
local GUI = nil
local ColorEffect = nil
local IsVisible = true
local IsDragging = false
local IsResizing = false
local DragStart = nil
local ResizeStart = nil
local OriginalSize = nil
local OriginalPos = nil

-- Hàm tạo giao diện
function LionHub:CreateUI()
    print("Bắt đầu tạo UI...")
    
    -- Xóa UI cũ nếu tồn tại
    local existingUI = game.CoreGui:FindFirstChild("LionHubUI") or LocalPlayer.PlayerGui:FindFirstChild("LionHubUI")
    if existingUI then
        existingUI:Destroy()
        print("Đã xóa UI cũ")
    end
    
    -- Tạo ScreenGui mới
    local success, result = pcall(function()
        GUI = Instance.new("ScreenGui")
        GUI.Name = "LionHubUI"
        GUI.ResetOnSpawn = false
        GUI.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
        
        -- Thử parent vào CoreGui trước, nếu không được thì dùng PlayerGui
        local parentSet = false
        if pcall(function() GUI.Parent = game.CoreGui end) then
            print("Đã đặt parent vào CoreGui")
            parentSet = true
        else
            GUI.Parent = LocalPlayer.PlayerGui
            print("Đã đặt parent vào PlayerGui (CoreGui không khả dụng)")
            parentSet = true
        end
        
        if not parentSet then
            error("Không thể đặt parent cho ScreenGui")
        end
        
        -- TEra nền mờ toàn màn hình cho UI
        local Background = Instance.new("Frame")
        Background.Name = "Background"
        Background.BackgroundColor3 = Config.BackgroundColor
        Background.BackgroundTransparency = Config.BackgroundTransparency
        Background.Size = UDim2.new(1, 0, 1, 0)
        Background.Position = UDim2.new(0, 0, 0, 0)
        Background.Parent = GUI
        
        -- Tạo tiêu đề "Lion Hub"
        local TitleBar = Instance.new("Frame")
        TitleBar.Name = "TitleBar"
        TitleBar.BackgroundColor3 = Config.AccentColor
        TitleBar.BackgroundTransparency = 0.3
        TitleBar.Size = UDim2.new(1, 0, 0.05, 0)
        TitleBar.Position = UDim2.new(0, 0, 0, 0)
        TitleBar.Parent = GUI
        
        local TitleText = Instance.new("TextLabel")
        TitleText.Name = "TitleText"
        TitleText.BackgroundTransparency = 1
        TitleText.Size = UDim2.new(1, 0, 1, 0)
        TitleText.Position = UDim2.new(0, 0, 0, 0)
        TitleText.Font = Config.Font
        TitleText.Text = Config.UIName
        TitleText.TextColor3 = Config.TextColor
        TitleText.TextSize = 20
        TitleText.Parent = TitleBar
        
        -- Tạo khung thông tin người chơi
        local PlayerInfoFrame = Instance.new("Frame")
        PlayerInfoFrame.Name = "PlayerInfoFrame"
        PlayerInfoFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
        PlayerInfoFrame.BackgroundTransparency = 0.5
        PlayerInfoFrame.Size = UDim2.new(0.2, 0, 0.25, 0)
        PlayerInfoFrame.Position = UDim2.new(0.4, 0, 0.55, 0)
        PlayerInfoFrame.BorderSizePixel = 0
        PlayerInfoFrame.Parent = GUI
        
        -- Thêm viền cho khung thông tin
        local UIStrokeInfo = Instance.new("UIStroke")
        UIStrokeInfo.Color = Config.AccentColor
        UIStrokeInfo.Thickness = 2
        UIStrokeInfo.Parent = PlayerInfoFrame
        
        -- Làm tròn góc cho khungPlace thông tin
        local UICornerInfo = Instance.new("UICorner")
        UICornerInfo.CornerRadius = UDim.new(0, 8)
        UICornerInfo.Parent = PlayerInfoFrame
        
        -- Tiêu đề khung thông tin
        local InfoTitle = Instance.new("TextLabel")
        InfoTitle.Name = "InfoTitle"
        InfoTitle.BackgroundTransparency = 1
        InfoTitle.Size = UDim2.new(1, 0, 0.12, 0)
        InfoTitle.Position = UDim2.new(0, 0, 0, 0)
        InfoTitle.Font = Config.Font
        InfoTitle.Text = "Thông tin người chơi"
        InfoTitle.TextColor3 = Config.AccentColor
        InfoTitle.TextSize = 16
        InfoTitle.Parent = PlayerInfoFrame
        
        -- Khung chứa thông tin người chơi
        local PlayerStatsContainer = Instance.new("Frame")
        PlayerStatsContainer.Name = "PlayerStatsContainer"
        PlayerStatsContainer.BackgroundTransparency = 1
        PlayerStatsContainer.Size = UDim2.new(0.95, 0, 0.85, 0)
        PlayerStatsContainer.Position = UDim2.new(0.025, 0, 0.14, 0)
        PlayerStatsContainer.Parent = PlayerInfoFrame
        
        -- Khung để hiển thị các thông tin
        local StatsLayout = Instance.new("UIListLayout")
        StatsLayout.SortOrder = Enum.SortOrder.LayoutOrder
        StatsLayout.Padding = UDim.new(0, 8)
        StatsLayout.Parent = PlayerStatsContainer
        
        -- Tạo các label thông tin cơ bản
        local labels = {
            {Name = "PlayerName", Text = "Tên: ", LayoutOrder = 1},
            {Name = "Level", Text = "Cấp độ: ", LayoutOrder = 2},
            {Name = "Beli", Text = "Beli: ", LayoutOrder = 3},
            {Name = "Fragments", Text = "Fragments: ", LayoutOrder = 4},
            {Name = "Race", Text = "Race: ", LayoutOrder = 5}
        }
        
        for _, label in ipairs(labels) do
            local StatLabel = Instance.new("TextLabel")
            StatLabel.Name = label.Name
            StatLabel.BackgroundTransparency = 1
            StatLabel.Size = UDim2.new(1, 0, 0, 25)
            StatLabel.Font = Config.Font
            StatLabel.Text = label.Text .. "Đang tải..."
            StatLabel.TextColor3 = Config.TextColor
            StatLabel.TextSize = 14
            StatLabel.TextXAlignment = Enum.TextXAlignment.Left
            StatLabel.LayoutOrder = label.LayoutOrder
            StatLabel.Parent = PlayerStatsContainer
        end
        
        -- Tạo khung hiển thị các vật phẩm cao cấp
        local ItemsFrame = Instance.new("Frame")
        ItemsFrame.Name = "ItemsFrame"
        ItemsFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
        ItemsFrame.BackgroundTransparency = 0.5
        ItemsFrame.Size = UDim2.new(0.25, 0, 0.35, 0)
        ItemsFrame.Position = UDim2.new(0.375, 0, 0.15, 0)
        ItemsFrame.BorderSizePixel = 0
        ItemsFrame.Parent = GUI
        
        -- Thêm viền cho khung vật phẩm
        local UIStrokeItems = Instance.new("UIStroke")
        UIStrokeItems.Color = Config.AccentColor
        UIStrokeItems.Thickness = 2
        UIStrokeItems.Parent = ItemsFrame
        
        -- Làm tròn góc cho khung vật phẩm
        local UICornerItems = Instance.new("UICorner")
        UICornerItems.CornerRadius = UDim.new(0, 8)
        UICornerItems.Parent = ItemsFrame
        
        -- Tiêu đề khung vật phẩm
        local ItemsTitle = Instance.new("TextLabel")
        ItemsTitle.Name = "ItemsTitle"
        ItemsTitle.BackgroundTransparency = 1
        ItemsTitle.Size = UDim2.new(1, 0, 0.12, 0)
        ItemsTitle.Position = UDim2.new(0, 0, 0, 0)
        ItemsTitle.Font = Config.Font
        ItemsTitle.Text = "Vật phẩm cao cấp"
        ItemsTitle.TextColor3 = Config.AccentColor
        ItemsTitle.TextSize = 16
        ItemsTitle.Parent = ItemsFrame
        
        -- Khung chứa danh sách vật phẩm
        local ItemsContainer = Instance.new("Frame")
        ItemsContainer.Name = "ItemsContainer"
        ItemsContainer.BackgroundTransparency = 1
        ItemsContainer.Size = UDim2.new(0.95, 0, 0.85, 0)
        ItemsContainer.Position = UDim2.new(0.025, 0, 0.14, 0)
        ItemsContainer.Parent = ItemsFrame
        
        -- Layout cho danh sách vật phẩm
        local ItemsLayout = Instance.new("UIListLayout")
        ItemsLayout.SortOrder = Enum.SortOrder.LayoutOrder
        ItemsLayout.Padding = UDim.new(0, 8)
        ItemsLayout.Parent = ItemsContainer
        
        -- Tạo các item với dấu tích
        for i, itemName in ipairs(PremiumItems) do
            local ItemFrame = Instance.new("Frame")
            ItemFrame.Name = "Item_" .. itemName:gsub(" ", "_")
            ItemFrame.BackgroundTransparency = 1
            ItemFrame.Size = UDim2.new(1, 0, 0, 25)
            ItemFrame.LayoutOrder = i
            ItemFrame.Parent = ItemsContainer
            
            local CheckBox = Instance.new("Frame")
            CheckBox.Name = "CheckBox"
            CheckBox.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
            CheckBox.BackgroundTransparency = 0.5
            CheckBox.Size = UDim2.new(0, 20, 0, 20)
            CheckBox.Position = UDim2.new(0, 0, 0, 2)
            CheckBox.Parent = ItemFrame
            
            local UICornerCheck = Instance.new("UICorner")
            UICornerCheck.CornerRadius = UDim.new(0, 4)
            UICornerCheck.Parent = CheckBox
            
            local UIStrokeCheck = Instance.new("UIStroke")
            UIStrokeCheck.Color = Color3.fromRGB(100, 100, 100)
            UIStrokeCheck.Thickness = 1
            UIStrokeCheck.Parent = CheckBox
            
            local Checkmark = Instance.new("TextLabel")
            Checkmark.Name = "Checkmark"
            Checkmark.BackgroundTransparency = 1
            Checkmark.Size = UDim2.new(1, 0, 1, 0)
            Checkmark.Font = Enum.Font.SourceSansBold
            Checkmark.Text = "✓"
            Checkmark.TextColor3 = Config.CheckmarkColor
            Checkmark.TextSize = 18
            Checkmark.Visible = false -- Mặc định ẩn dấu tích
            Checkmark.Parent = CheckBox
            
            local ItemLabel = Instance.new("TextLabel")
            ItemLabel.Name = "ItemLabel"
            ItemLabel.BackgroundTransparency = 1
            ItemLabel.Size = UDim2.new(0.9, 0, 1, 0)
            ItemLabel.Position = UDim2.new(0.1, 0, 0, 0)
            ItemLabel.Font = Config.Font
            ItemLabel.Text = itemName
            ItemLabel.TextColor3 = Config.TextColor
            ItemLabel.TextSize = 14
            ItemLabel.TextXAlignment = Enum.TextXAlignment.Left
            ItemLabel.Parent = ItemFrame
        end
        
        -- Tạo nút resize cho ItemsFrame
        local ResizeHandle = Instance.new("Frame")
        ResizeHandle.Name = "ResizeHandle"
        ResizeHandle.BackgroundColor3 = Config.AccentColor
        ResizeHandle.BackgroundTransparency = 0.5
        ResizeHandle.Size = UDim2.new(0, 10, 0, 10)
        ResizeHandle.Position = UDim2.new(1, -10, 1, -10)
        ResizeHandle.Parent = ItemsFrame
        
        local UICornerResize = Instance.new("UICorner")
        UICornerResize.CornerRadius = UDim.new(0, 4)
        UICornerResize.Parent = ResizeHandle
        
        -- Thiết lập kéo thả và thay đổi kích thước cho ItemsFrame
        ItemsTitle.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                IsDragging = true
                DragStart = input.Position
                OriginalPos = ItemsFrame.Position
            end
        end)
        
        ResizeHandle.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                IsResizing = true
                ResizeStart = input.Position
                OriginalSize = ItemsFrame.Size
            end
        end)
        
        UserInputService.InputChanged:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseMovement then
                if IsDragging then
                    local delta = input.Position - DragStart
                    local newPosX = OriginalPos.X.Scale + (delta.X / GUI.AbsoluteSize.X)
                    local newPosY = OriginalPos.Y.Scale + (delta.Y / GUI.AbsoluteSize.Y)
                    ItemsFrame.Position = UDim2.new(newPosX, 0, newPosY, 0)
                elseif IsResizing then
                    local delta = input.Position - ResizeStart
                    local newWidth = OriginalSize.X.Scale + (delta.X / GUI.AbsoluteSize.X)
                    local newHeight = OriginalSize.Y.Scale + (delta.Y / GUI.AbsoluteSize.Y)
                    newWidth = math.clamp(newWidth, 0.15, 0.5) -- Giới hạn kích thước
                    newHeight = math.clamp(newHeight, 0.2, 0.6)
                    ItemsFrame.Size = UDim2.new(newWidth, 0, newHeight, 0)
                end
            end
        end)
        
        UserInputService.InputEnded:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                IsDragging = false
                IsResizing = false
            end
        end)
        
        -- Thiết lập phím tắt để bật/tắt giao diện
        UserInputService.InputBegan:Connect(function(input, gameProcessed)
            if not gameProcessed and input.KeyCode == Config.ToggleKey then
                self:ToggleVisibility()
            end
        end)
        
        -- Tạo hiệu ứng màu trắng đục cho game
        local existingEffect = Lighting:FindFirstChild("LionHubColorEffect")
        if existingEffect then
            existingEffect:Destroy()
            print("Đã xóa ColorEffect cũ")
        end
        
        ColorEffect = Instance.new("ColorCorrectionEffect")
        ColorEffect.Name = "LionHubColorEffect"
        ColorEffect.TintColor = Color3.fromRGB(255, 255, 255)
        ColorEffect.Brightness = 0.8 -- Tăng độ sáng để tạo hiệu ứng trắng đục
        ColorEffect.Contrast = 0.2
        ColorEffect.Saturation = -0.5
        ColorEffect.Enabled = true
        ColorEffect.Parent = Lighting
        print("Đã tạo ColorCorrectionEffect")
        
        return GUI
    end)
    
    if not success then
        warn("Lỗi khi tạo UI: " .. tostring(result))
        return nil
    end
    
    print("UI được tạo thành công")
    return GUI
end

-- Hàm cập nhật thông tin người chơi
function LionHub:UpdatePlayerInfo()
    if not GUI then
        print("GUI không tồn tại, không thể cập nhật thông tin")
        return
    end
    local playerStatsContainer = GUI.PlayerInfoFrame.PlayerStatsContainer
    
    -- Cập nhật thông tin cơ bản
    local success, result = pcall(function()
        local playerName = LocalPlayer.Name
        local level = self:GetPlayerLevel() or "N/A"
        local beli = self:GetPlayerBeli() or "0"
        local fragments = self:GetPlayerFragments() or "0"
        local race = self:GetPlayerRace() or "Human"
        
        -- Cập nhật text cho các label
        if playerStatsContainer:FindFirstChild("PlayerName") then
            playerStatsContainer.PlayerName.Text = "Tên: " .. playerName
        end
        
        if playerStatsContainer:FindFirstChild("Level") then
            playerStatsContainer.Level.Text = "Cấp độ: " .. level
        end
        
        if playerStatsContainer:FindFirstChild("Beli") then
            playerStatsContainer.Beli.Text = "Beli: " .. self:FormatNumber(beli)
        end
        
        if playerStatsContainer:FindFirstChild("Fragments") then
            playerStatsContainer.Fragments.Text = "Fragments: " .. self:FormatNumber(fragments)
        end
        
        if playerStatsContainer:FindFirstChild("Race") then
            playerStatsContainer.Race.Text = "Race: " .. race
        end
        
        -- Cập nhật trạng thái các vật phẩm cao cấp
        self:UpdatePremiumItems()
    end)
    
    if not success then
        warn("Lỗi khi cập nhật thông tin người chơi: " .. tostring(result))
    end
end

-- Hàm để cập nhật dấu tích cho các vật phẩm cao cấp
function LionHub:UpdatePremiumItems()
    if not GUI then
        print("GUI không tồn tại, không thể cập nhật vật phẩm")
        return
    end
    local itemsContainer = GUI.ItemsFrame.ItemsContainer
    
    -- Kiểm tra từng vật phẩm trong danh sách
    for _, itemName in ipairs(PremiumItems) do
        local itemFrame = itemsContainer:FindFirstChild("Item_" .. itemName:gsub(" ", "_"))
        if itemFrame then
            local checkBox = itemFrame:FindFirstChild("CheckBox")
            if checkBox then
                local checkmark = checkBox:FindFirstChild("Checkmark")
                if checkmark then
                    -- Kiểm tra xem người chơi có vật phẩm không
                    local hasItem = self:HasPremiumItem(itemName)
                    checkmark.Visible = hasItem
                    
                    -- Cập nhật màu text tùy theo trạng thái
                    local itemLabel = itemFrame:FindFirstChild("ItemLabel")
                    if itemLabel then
                        itemLabel.TextColor3 = hasItem and Config.CheckmarkColor or Config.TextColor
                    end
                end
            end
        end
    end
end

-- Hàm để bật/tắt hiển thị giao diện
function LionHub:ToggleVisibility()
    IsVisible = not IsVisible
    print("Chuyển trạng thái UI: " .. (IsVisible and "Hiển thị" or "Ẩn"))
    
    if GUI then
        -- Ẩn/hiện các phần tử UI
        local playerInfoFrame = GUI:FindFirstChild("PlayerInfoFrame")
        local itemsFrame = GUI:FindFirstChild("ItemsFrame")
        local background = GUI:FindFirstChild("Background")
        
        if playerInfoFrame then
            playerInfoFrame.Visible = IsVisible
        end
        
        if itemsFrame then
            itemsFrame.Visible = IsVisible
        end
        
        if background then
            background.BackgroundTransparency = IsVisible and Config.BackgroundTransparency or 0.95
        end
        
        -- Bật/tắt hiệu ứng màu trắng đục
        if ColorEffect then
            ColorEffect.Enabled = IsVisible
            print("ColorEffect: " .. (IsVisible and "Bật" or "Tắt"))
        end
    else
        print("GUI không tồn tại khi toggle visibility")
    end
end

-- Các hàm lấy thông tin người chơi
function LionHub:GetPlayerLevel()
    local plrStats = LocalPlayer:FindFirstChild("Data")
    if plrStats and plrStats:FindFirstChild("Level") then
        return plrStats.Level.Value
    end
    return "N/A"
end

function LionHub:GetPlayerBeli()
    local plrStats = LocalPlayer:FindFirstChild("Data")
    if plrStats and plrStats:FindFirstChild("Beli") then
        return plrStats.Beli.Value
    end
    return 0
end

function LionHub:GetPlayerFragments()
    local plrStats = LocalPlayer:FindFirstChild("Data")
    if plrStats and plrStats:FindFirstChild("Fragments") then
        return plrStats.Fragments.Value
    end
    return 0
end

function LionHub:GetPlayerRace()
    local plrStats = LocalPlayer:FindFirstChild("Data")
    if plrStats and plrStats:FindFirstChild("Race") then
        return plrStats.Race.Value
    end
    return "Human"
end

function LionHub:HasPremiumItem(itemName)
    -- Kiểm tra trong inventory của người chơi
    local backpack = LocalPlayer:FindFirstChild("Backpack")
    if backpack then
        for _, item in ipairs(backpack:GetChildren()) do
            if item.Name == itemName then
                return true
            end
        end
    end
    
    -- Kiểm tra trong tay người chơi
    local character = LocalPlayer.Character
    if character then
        for _, item in ipairs(character:GetChildren()) do
            if item.Name == itemName then
                return true
            end
        end
    end
    
    -- Kiểm tra trong data (nếu có)
    local plrStats = LocalPlayer:FindFirstChild("Data")
    if plrStats and plrStats:FindFirstChild("Inventory") then
        local inventory = plrStats.Inventory
        for _, item in ipairs(inventory:GetChildren()) do
            if item.Name == itemName then
                return true
            end
        end
    end
    
    return false
end

-- Hàm để định dạng số lớn
function LionHub:FormatNumber(number)
    if type(number) == "string" then
        number = tonumber(number) or 0
    end
    
    if number >= 1000000000 then
        return string.format("%.2fB", number / 1000000000)
    elseif number >= 1000000 then
        return string.format("%.2fM", number / 1000000)
    elseif number >= 1000 then
        return string.format("%.2fK", number / 1000)
    else
        return tostring(number)
    end
end

-- Hàm khởi động Lion Hub
function LionHub:Start()
    print("Khởi động Lion Hub...")
    local success, result = pcall(function()
        self:CreateUI()
        
        -- Lặp cập nhật thông tin người chơi
        spawn(function()
            while wait(Config.RefreshRate) do
                self:UpdatePlayerInfo()
            end
        end)
    end)
    
    if not success then
        warn("Lỗi khi khởi động Lion Hub: " .. tostring(result))
    else
        print("Lion Hub đã được khởi động!")
    end
end

-- Khởi chạy Lion Hub
LionHub:Start()

return LionHub
