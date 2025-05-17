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
    local function cloneLabel(frameName, text, pos, size, color)
        local frame = Instance.new("Frame")
        frame.Name = frameName
        frame.Parent = Hiru_Hub
        frame.Size = UDim2.new(1, 0, 1, 0)
        frame.Position = UDim2.new(0, 0, 0, 0)
        frame.AnchorPoint = Vector2.new(0.5, 0.5)
        frame.BackgroundTransparency = 1
        local frag = game:GetService("Players").LocalPlayer.PlayerGui.Main.Fragments:Clone()
        frag.Parent = frame
        frag.TextColor3 = color or Color3.fromRGB(0, 0, 0)
        frag.Text = text
        frag.Size = size
        frag.TextXAlignment = 'Center'
        frame.Position = pos
        frag.TextStrokeTransparency = 1
        return frame
    end

    cloneLabel("Level", "Switch Hub", UDim2.new(0.5, 0, -0.2, 0), UDim2.new(1, 0, 0, 40))
    cloneLabel("Text2", "", UDim2.new(0.5, 0, -0.1, 0), UDim2.new(1, 0, 0, 25))
    cloneLabel("Text", '( '..game.Players.LocalPlayer.Name..' )', UDim2.new(0.5, 0, 0.14, 0), UDim2.new(1, 0, 0, 25))
    cloneLabel("Text3", 'Status: Farm Level.', UDim2.new(0.5, 0, 0.22, 0), UDim2.new(1, 0, 0, 28))
    cloneLabel("Text5", '...', UDim2.new(0.5, 0, 0.38, 0), UDim2.new(1, 0, 0, 25))
    cloneLabel("Text4", '...', UDim2.new(0.5, 0, 0.47, 0), UDim2.new(1, 0, 0, 35))
    cloneLabel("Text6", '🌕 75% ('..tostring(game:GetService("Lighting").TimeOfDay)..')', UDim2.new(0.5, 0, -0.03, 0), UDim2.new(1, 0, 0, 25), Color3.fromRGB(255,140,0))

    spawn(function()
        while wait(1) do
            pcall(function()
                if Three_World then
                    if game:GetService("Lighting").Sky.MoonTextureId == "http://www.roblox.com/asset/?id=9709149431" then
                        game:GetService("CoreGui")["Switch Hub"].Text6.Fragments.Text = '🌕 100% ('..tostring(game:GetService("Lighting").TimeOfDay)..')'
                    elseif game:GetService("Lighting").Sky.MoonTextureId == "http://www.roblox.com/asset/?id=9709149052" then
                        game:GetService("CoreGui")["Switch Hub"].Text6.Fragments.Text = '🌕 75% ('..tostring(game:GetService("Lighting").TimeOfDay)..')'
                    elseif game:GetService("Lighting").Sky.MoonTextureId == "http://www.roblox.com/asset/?id=9709143733" then
                        game:GetService("CoreGui")["Switch Hub"].Text6.Fragments.Text = '🌕 50% ('..tostring(game:GetService("Lighting").TimeOfDay)..')'
                    elseif game:GetService("Lighting").Sky.MoonTextureId == "http://www.roblox.com/asset/?id=9709150401" then
                        game:GetService("CoreGui")["Switch Hub"].Text6.Fragments.Text = '🌕 25% ('..tostring(game:GetService("Lighting").TimeOfDay)..')'
                    elseif game:GetService("Lighting").Sky.MoonTextureId == "http://www.roblox.com/asset/?id=9709149680" then
                        game:GetService("CoreGui")["Switch Hub"].Text6.Fragments.Text = '🌕 15% ('..tostring(game:GetService("Lighting").TimeOfDay)..')'
                    else 
                        game:GetService("CoreGui")["Switch Hub"].Text6.Fragments.Text = '🌕 0% ('..tostring(game:GetService("Lighting").TimeOfDay)..')'
                    end 
                    local scripttime=game.Workspace.DistributedGameTime
                    local seconds = scripttime%60
                    local minutes = math.floor(scripttime/60%60)
                    local hours = math.floor(scripttime/3600)
                    local tempo = string.format("%.0f Hours, %.0f Minutes, %.0f Seconds", hours ,minutes, seconds)
                    game:GetService("CoreGui")["Switch Hub"].Text2.Fragments.Text = tempo
                else
                    game:GetService("CoreGui")["Switch Hub"].Text6.Fragments.Text = '🌕 0% ('..tostring(game:GetService("Lighting").TimeOfDay)..')'
                    local scripttime=game.Workspace.DistributedGameTime
                    local seconds = scripttime%60
                    local minutes = math.floor(scripttime/60%60)
                    local hours = math.floor(scripttime/3600)
                    local tempo = string.format("%.0f Hours, %.0f Minutes, %.0f Seconds", hours ,minutes, seconds)
                    game:GetService("CoreGui")["Switch Hub"].Text2.Fragments.Text = tempo
                end
            end)
        end
    end)

    -- UI nhỏ bên phải (giữ ToggleImgUi, không có hình)
    local Luna = Instance.new("ScreenGui")
    local ToggleFrameUi = Instance.new("Frame")
    local UICorner = Instance.new("UICorner")
    local ToggleImgUi = Instance.new("ImageButton")
    local Uitoggle = Instance.new("TextLabel")
    local Yedhee = Instance.new("TextLabel")
    local SearchStroke = Instance.new("UIStroke")

    Luna.Name = "SWP"
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

    ToggleImgUi.Name = "ToggleImgUi"
    ToggleImgUi.Parent = ToggleFrameUi
    ToggleImgUi.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    ToggleImgUi.BackgroundTransparency = 1
    ToggleImgUi.Position = UDim2.new(0.045, 0, 0.125, 0)
    ToggleImgUi.Size = UDim2.new(0, 35, 0, 35)
    ToggleImgUi.Image = "" -- Không có hình

    local togle_up = true
    ToggleImgUi.MouseButton1Click:Connect(function()
        togle_up = not togle_up
        Hiru_Hub.Enabled = togle_up
    end)

    Uitoggle.Name = "Uitoggle"
    Uitoggle.Parent = ToggleFrameUi
    Uitoggle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Uitoggle.BackgroundTransparency = 1.000
    Uitoggle.Position = UDim2.new(0.14, 0, 0.1, 0)
    Uitoggle.Size = UDim2.new(0, 137, 0, 25)
    Uitoggle.Font = Enum.Font.GothamSemibold
    Uitoggle.Text = "Switch Hub Kaitun"
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

    -- Xoá hoàn toàn phần check item (không còn code check item/icon)

    -- Fix lại phần check status (status nhiệm vụ hoạt động bình thường, màu chữ đen)
    function Set_Status_X(vu)
        Hiru_Hub.Text3.Fragments.Text = vu
        Hiru_Hub.Text3.Fragments.TextColor3 = Color3.fromRGB(0, 0, 0)
    end

else
    _G.library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Nguyenchibinh7/Heheheheh/refs/heads/main/README.md"))()
    library = _G.library
end
