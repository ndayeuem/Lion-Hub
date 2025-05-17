local placeId = game.PlaceId
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
LionHub.Enabled = true

-- Main Frame
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Parent = LionHub
MainFrame.Size = UDim2.new(0.35, 0, 0.25, 0)
MainFrame.Position = UDim2.new(0.5, -MainFrame.Size.X.Offset/2, 0.5, -MainFrame.Size.Y.Offset/2)
MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
MainFrame.BackgroundColor3 = Color3.fromRGB(255,255,255)
MainFrame.BackgroundTransparency = 0.1
MainFrame.BorderSizePixel = 0

-- Viền vàng
local border = Instance.new("UIStroke")
border.Color = Color3.fromRGB(255, 215, 0)
border.Thickness = 3
border.Parent = MainFrame

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 12)
corner.Parent = MainFrame

-- Logo Discord ở góc trái trên
local Logo = Instance.new("ImageLabel")
Logo.Name = "Logo"
Logo.Parent = MainFrame
Logo.Size = UDim2.new(0, 48, 0, 48)
Logo.Position = UDim2.new(0, 12, 0, 12)
Logo.BackgroundTransparency = 1
Logo.Image = "https://cdn.discordapp.com/icons/1304070654601199657/bd60d83d852dad91fc1c666d0defb0fe.webp"

-- Header
local Header = Instance.new("TextLabel")
Header.Parent = MainFrame
Header.Size = UDim2.new(1, -80, 0, 48)
Header.Position = UDim2.new(0, 68, 0, 12)
Header.BackgroundTransparency = 1
Header.Text = "Lion Hub Kaitun"
Header.Font = Enum.Font.GothamBold
Header.TextSize = 28
Header.TextColor3 = Color3.fromRGB(0, 0, 0)
Header.TextXAlignment = Enum.TextXAlignment.Left

-- Chỉ giữ lại check Full Moon, đưa xuống giữa
local FullMoonFrame = Instance.new("Frame")
FullMoonFrame.Parent = MainFrame
FullMoonFrame.Size = UDim2.new(1, -40, 0, 60)
FullMoonFrame.Position = UDim2.new(0, 20, 0.5, -30)
FullMoonFrame.BackgroundTransparency = 1

local FullMoonLabel = Instance.new("TextLabel")
FullMoonLabel.Parent = FullMoonFrame
FullMoonLabel.Size = UDim2.new(1, 0, 1, 0)
FullMoonLabel.Position = UDim2.new(0, 0, 0, 0)
FullMoonLabel.BackgroundTransparency = 1
FullMoonLabel.Font = Enum.Font.GothamBold
FullMoonLabel.TextSize = 32
FullMoonLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
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
