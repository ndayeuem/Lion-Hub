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
    if game:GetService("CoreGui"):FindFirstChild('Lion Hub') then
        game:GetService("CoreGui"):FindFirstChild('Lion Hub'):Destroy()
    end

    -- Tạo Lion Hub UI
    local LionHub = Instance.new("ScreenGui")
    LionHub.Name = "Lion Hub"
    LionHub.Parent = game:GetService("CoreGui")
    LionHub.Enabled = true

    -- Main Frame full màn hình
    local MainFrame = Instance.new("Frame")
    MainFrame.Name = "MainFrame"
    MainFrame.Parent = LionHub
    MainFrame.Size = UDim2.new(1, 0, 1, 0)
    MainFrame.Position = UDim2.new(0, 0, 0, 0)
    MainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
    MainFrame.BackgroundTransparency = 0
    MainFrame.BorderSizePixel = 0

    local border = Instance.new("UIStroke")
    border.Color = Color3.fromRGB(255, 215, 0)
    border.Thickness = 3
    border.Parent = MainFrame

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 0)
    corner.Parent = MainFrame

    -- Logo Discord ở góc trái trên
    local Logo = Instance.new("ImageLabel")
    Logo.Name = "Logo"
    Logo.Parent = MainFrame
    Logo.Size = UDim2.new(0, 64, 0, 64)
    Logo.Position = UDim2.new(0, 24, 0, 24)
    Logo.BackgroundTransparency = 1
    Logo.Image = "https://cdn.discordapp.com/icons/1304070654601199657/bd60d83d852dad91fc1c666d0defb0fe.webp"

    -- Header
    local Header = Instance.new("TextLabel")
    Header.Parent = MainFrame
    Header.Size = UDim2.new(0, 400, 0, 64)
    Header.Position = UDim2.new(0, 100, 0, 24)
    Header.BackgroundTransparency = 1
    Header.Text = "Lion Hub Kaitun"
    Header.Font = Enum.Font.GothamBold
    Header.TextSize = 48
    Header.TextColor3 = Color3.fromRGB(255, 255, 255)
    Header.TextXAlignment = Enum.TextXAlignment.Left

    -- Chỉ giữ lại check Full Moon, căn giữa màn hình
    local FullMoonLabel = Instance.new("TextLabel")
    FullMoonLabel.Parent = MainFrame
    FullMoonLabel.Size = UDim2.new(0, 600, 0, 80)
    FullMoonLabel.Position = UDim2.new(0.5, -300, 0.5, -40)
    FullMoonLabel.BackgroundTransparency = 1
    FullMoonLabel.Font = Enum.Font.GothamBold
    FullMoonLabel.TextSize = 48
    FullMoonLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    FullMoonLabel.TextStrokeTransparency = 0.7
    FullMoonLabel.Text = "🌕 Full Moon: Đang kiểm tra..."

    -- Hàm cập nhật trạng thái Full Moon
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
        FullMoonLabel.Text = "🌕 Full Moon: " .. percent .. " (" .. tostring(game:GetService("Lighting").TimeOfDay) .. ")"
    end

    updateFullMoon()
    game:GetService("RunService").RenderStepped:Connect(updateFullMoon)

    -- Đổi toàn bộ màu nền game thành đen
    local Lighting = game:GetService("Lighting")
    Lighting.Ambient = Color3.new(0,0,0)
    Lighting.OutdoorAmbient = Color3.new(0,0,0)
    Lighting.Brightness = 0
    Lighting.ColorShift_Bottom = Color3.new(0,0,0)
    Lighting.ColorShift_Top = Color3.new(0,0,0)
    Lighting.FogEnd = 100
    Lighting.FogStart = 0
    Lighting.FogColor = Color3.new(0,0,0)
    Lighting.ExposureCompensation = -10

    -- Toggle bật/tắt UI và nền đen bằng phím B
    local togle_up = true
    game:GetService("UserInputService").InputBegan:Connect(function(input, isTyping)
        if not isTyping then
            if input.KeyCode == Enum.KeyCode.B then
                if togle_up then
                    LionHub.Enabled = false
                    Lighting.ExposureCompensation = 0
                    togle_up = false
                else
                    LionHub.Enabled = true
                    Lighting.ExposureCompensation = -10
                    togle_up = true
                end
            end
        end
    end)
else
    _G.library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Nguyenchibinh7/Heheheheh/refs/heads/main/README.md"))()
    library = _G.library
end

-- ...Các phần code library, farming, label, v.v. giữ nguyên nếu cần...
