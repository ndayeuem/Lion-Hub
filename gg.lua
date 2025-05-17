local placeId = game.PlaceId
if placeId == 2753915549 then
    Old_World = true
elseif placeId == 4442272183 then
    New_World = true
elseif placeId == 7449423635 then
    Three_World = true
end

getgenv().Deleted_Ui = true
if getgenv().Deleted_Ui then
    library = {}
    function library:CreateWindow(...)
        local bit_zes = {}
        function bit_zes:CreateTab(...)
            local cizan = {}
            function cizan:CreateSection(...)
                local Azin = {}
                function Azin:AddLabel(...)
                    local xp = {}
                    function xp:Set(...)
                        local op = {}
                        return op 
                    end
                    return xp
                end
                function Azin:AddDropdown(...) local xp = {} return xp end
                function Azin:AddTextbox(...) local xp = {} return xp end
                function Azin:AddKeybind(...) local xp = {} return xp end
                function Azin:AddToggle(...) local xp = {} return xp end
                function Azin:AddButton(...) local xp = {} return xp end
                function Azin:AddSlider(...) local xp = {} return xp end
                function Azin:AddSearchBox(...) local xp = {} return xp end
                function Azin:AddColorpicker(...) local xp = {} return xp end
                function Azin:AddPersistence(...) local xp = {} return xp end
                return Azin
            end
            return cizan
        end
        return bit_zes
    end

    if game:GetService("CoreGui"):FindFirstChild('Switch Hub') then
        game:GetService("CoreGui"):FindFirstChild('Switch Hub'):Destroy()
    end

    -- Switch Hub
    local Hiru_Hub = Instance.new("ScreenGui")
    Hiru_Hub.Name = "Switch Hub"
    Hiru_Hub.Parent = game:GetService("CoreGui")
    Hiru_Hub.Enabled = true

    -- Main Frame
    local F_Level = Instance.new("Frame")
    F_Level.Name = "Level"
    F_Level.Parent = Hiru_Hub
    F_Level.Size = UDim2.new(1, 0, 1, 0)
    F_Level.Position = UDim2.new(0, 0, 0, 0)
    F_Level.AnchorPoint = Vector2.new(0.5, 0.5)
    F_Level.BackgroundColor3 = Color3.fromRGB(255,255,255)
    F_Level.BackgroundTransparency = 0.3

    -- Viền xanh vàng chuyển sắc
    local border = Instance.new("UIStroke")
    border.Thickness = 3
    border.Parent = F_Level
    border.Color = Color3.fromRGB(0, 255, 186)
    local gradient = Instance.new("UIGradient")
    gradient.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(0,255,186)), -- xanh
        ColorSequenceKeypoint.new(1, Color3.fromRGB(255,215,0))  -- vàng
    }
    gradient.Parent = border

    -- Clone các label chính
    local function cloneLabel(frameName, text, pos, size)
        local frame = Instance.new("Frame")
        frame.Name = frameName
        frame.Parent = Hiru_Hub
        frame.Size = UDim2.new(1, 0, 1, 0)
        frame.Position = UDim2.new(0, 0, 0, 0)
        frame.AnchorPoint = Vector2.new(0.5, 0.5)
        frame.BackgroundTransparency = 1
        local frag = game:GetService("Players").LocalPlayer.PlayerGui.Main.Fragments:Clone()
        frag.Parent = frame
        frag.TextColor3 = Color3.fromRGB(0, 0, 0)
        frag.Text = text
        frag.Size = size
        frag.TextXAlignment = 'Center'
        frame.Position = pos
        frag.TextStrokeTransparency = 1
        return frame
    end

    cloneLabel("Level", "Lion Hub Kaitun", UDim2.new(0.5, 0, -0.2, 0), UDim2.new(1, 0, 0, 40))
    cloneLabel("Text2", "", UDim2.new(0.5, 0, -0.1, 0), UDim2.new(1, 0, 0, 25))
    cloneLabel("Text", '( '..game.Players.LocalPlayer.Name..' )', UDim2.new(0.5, 0, 0.14, 0), UDim2.new(1, 0, 0, 25))
    cloneLabel("Text3", 'Status: Farm Level.', UDim2.new(0.5, 0, 0.22, 0), UDim2.new(1, 0, 0, 28))
    cloneLabel("Text5", '...', UDim2.new(0.5, 0, 0.38, 0), UDim2.new(1, 0, 0, 25))
    cloneLabel("Text4", '...', UDim2.new(0.5, 0, 0.47, 0), UDim2.new(1, 0, 0, 35))
    cloneLabel("Text6", '🌕 75% ('..tostring(game:GetService("Lighting").TimeOfDay)..')', UDim2.new(0.5, 0, -0.03, 0), UDim2.new(1, 0, 0, 25))

    -- Check Item Section (icon)
    local ItemsFrame = Instance.new("Frame")
    ItemsFrame.Parent = Hiru_Hub
    ItemsFrame.Size = UDim2.new(0, 350, 0, 160)
    ItemsFrame.Position = UDim2.new(0.5, -175, 0.8, 0)
    ItemsFrame.BackgroundTransparency = 1

    local ItemsLayout = Instance.new("UIListLayout")
    ItemsLayout.Parent = ItemsFrame
    ItemsLayout.Padding = UDim.new(0, 8)

    local ItemIcons = {
        ["God Human"] = "rbxassetid://16061933936",
        ["Cursed Dual Katana"] = "rbxassetid://16061934013",
        ["Soul Guitar"] = "rbxassetid://16061934061",
        ["Mirror Fractal"] = "rbxassetid://16061934113",
        ["Valkyrie Helm"] = "rbxassetid://16061934167"
    }
    local function HasItem(itemName)
        local player = game.Players.LocalPlayer
        local backpack = player:FindFirstChild("Backpack")
        if backpack then
            for _, item in ipairs(backpack:GetChildren()) do
                if item.Name == itemName then return true end
            end
        end
        local character = player.Character
        if character then
            for _, item in ipairs(character:GetChildren()) do
                if item.Name == itemName then return true end
            end
        end
        local data = player:FindFirstChild("Data")
        if data then
            for _, v in ipairs(data:GetChildren()) do
                if v.Name == itemName and ((v.Value and v.Value ~= "" and v.Value ~= false and v.Value ~= 0) or (v:IsA("BoolValue") and v.Value)) then
                    return true
                end
            end
        end
        return false
    end
    for name, icon in pairs(ItemIcons) do
        local itemFrame = Instance.new("Frame")
        itemFrame.Size = UDim2.new(1, 0, 0, 28)
        itemFrame.BackgroundTransparency = 1
        itemFrame.Parent = ItemsFrame

        local img = Instance.new("ImageLabel")
        img.Size = UDim2.new(0, 24, 0, 24)
        img.Position = UDim2.new(0, 0, 0, 2)
        img.BackgroundTransparency = 1
        img.Image = icon
        img.Parent = itemFrame

        local label = Instance.new("TextLabel")
        label.Size = UDim2.new(1, -30, 1, 0)
        label.Position = UDim2.new(0, 30, 0, 0)
        label.BackgroundTransparency = 1
        label.Text = name .. (HasItem(name) and " ✓" or " ✗")
        label.Font = Enum.Font.Gotham
        label.TextSize = 16
        label.TextColor3 = Color3.fromRGB(0, 0, 0)
        label.TextXAlignment = Enum.TextXAlignment.Left
        label.Parent = itemFrame
    end

    -- UI nhỏ bên phải (Lion Hub, không logo, luôn bật)
    local Luna = Instance.new("ScreenGui")
    local ToggleFrameUi = Instance.new("Frame")
    local UICorner = Instance.new("UICorner")
    local Uitoggle = Instance.new("TextLabel")
    local Yedhee = Instance.new("TextLabel")
    local SearchStroke = Instance.new("UIStroke")

    Luna.Name = "Lion Hub"
    Luna.Parent = game.CoreGui
    Luna.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

    ToggleFrameUi.Name = "ToggleFrameUi"
    ToggleFrameUi.Parent = Luna
    ToggleFrameUi.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    ToggleFrameUi.BackgroundTransparency = 0.3
    ToggleFrameUi.Position = UDim2.new(0.775, 0,0.3, 0)
    ToggleFrameUi.Size = UDim2.new(0, 148, 0, 48)

    SearchStroke.Thickness = 1
    SearchStroke.Name = ""
    SearchStroke.Parent = ToggleFrameUi
    SearchStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    SearchStroke.LineJoinMode = Enum.LineJoinMode.Round
    SearchStroke.Color = Color3.fromRGB(0, 255, 186)
    SearchStroke.Transparency = 0

    UICorner.CornerRadius = UDim.new(0, 5)
    UICorner.Parent = ToggleFrameUi

    Uitoggle.Name = "Uitoggle"
    Uitoggle.Parent = ToggleFrameUi
    Uitoggle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Uitoggle.BackgroundTransparency = 1.000
    Uitoggle.Position = UDim2.new(0.14, 0, 0.1, 0)
    Uitoggle.Size = UDim2.new(0, 137, 0, 25)
    Uitoggle.Font = Enum.Font.GothamSemibold
    Uitoggle.Text = "Lion Hub"
    Uitoggle.TextColor3 = Color3.fromRGB(0, 0, 0)
    Uitoggle.TextSize = 12.000

    Yedhee.Name = "Yedhee"
    Yedhee.Parent = ToggleFrameUi
    Yedhee.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Yedhee.BackgroundTransparency = 1.000
    Yedhee.Position = UDim2.new(0.14, 0, 0.429166657, 0)
    Yedhee.Size = UDim2.new(0, 137, 0, 25)
    Yedhee.Font = Enum.Font.GothamSemibold
    Yedhee.Text = "White Screen (B)"
    Yedhee.TextColor3 = Color3.fromRGB(0, 255, 186)
    Yedhee.TextSize = 12.000

    -- Không còn ToggleImgUi, không còn sự kiện bật/tắt UI, UI luôn bật

else
    _G.library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Nguyenchibinh7/Heheheheh/refs/heads/main/README.md"))()
    library = _G.library
end
