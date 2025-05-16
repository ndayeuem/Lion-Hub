local Players = game:GetService("Players")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "GameUI"
screenGui.ResetOnSpawn = false
screenGui.Parent = playerGui


local itemsFrame = Instance.new("Frame")
itemsFrame.Name = "ItemsFrame"
itemsFrame.Size = UDim2.new(0, 300, 0, 220)

itemsFrame.Position = UDim2.new(0.5, -150, 0.5, -125)
itemsFrame.BackgroundColor3 = Color3.fromRGB(0,0,0)
itemsFrame.BackgroundTransparency = 0.3
itemsFrame.BorderSizePixel = 0
itemsFrame.Parent = screenGui

local itemsStroke = Instance.new("UIStroke")
itemsStroke.Thickness = 2
itemsStroke.Color = Color3.fromRGB(255, 204, 0)
itemsStroke.Parent = itemsFrame

local itemsTitle = Instance.new("TextLabel")
itemsTitle.Size = UDim2.new(1, 0, 0, 30)
itemsTitle.Position = UDim2.new(0, 0, 0, 0)
itemsTitle.BackgroundTransparency = 1
itemsTitle.Text = "Vật phẩm cao cấp"
itemsTitle.Font = Enum.Font.SourceSansBold
itemsTitle.TextSize = 18
itemsTitle.TextColor3 = Color3.fromRGB(255, 204, 0)
itemsTitle.Parent = itemsFrame

local itemsContent = Instance.new("Frame")
itemsContent.Size = UDim2.new(1, 0, 1, -30)
itemsContent.Position = UDim2.new(0, 0, 0, 30)
itemsContent.BackgroundTransparency = 1
itemsContent.Parent = itemsFrame

local itemList = {
	"God Human",
	"Cursed Dual Katana",
	"Soul Guitar",
	"Mirror Fractal",
	"Valkyrie Helm"
}

for i, itemName in ipairs(itemList) do
	local itemFrame = Instance.new("Frame")
	itemFrame.Size = UDim2.new(1, 0, 0, 30)
	itemFrame.Position = UDim2.new(0, 0, 0, (i-1)*35)
	itemFrame.BackgroundTransparency = 1
	itemFrame.Parent = itemsContent

	local box = Instance.new("Frame")
	box.Size = UDim2.new(0, 20, 0, 20)
	box.Position = UDim2.new(0, 5, 0, 5)
	box.BackgroundColor3 = Color3.fromRGB(255, 0, 0) -- đỏ
	box.BorderSizePixel = 1
	box.BorderColor3 = Color3.fromRGB(0, 0, 0)
	box.Parent = itemFrame

	local label = Instance.new("TextLabel")
	label.Size = UDim2.new(1, -30, 1, 0)
	label.Position = UDim2.new(0, 30, 0, 0)
	label.BackgroundTransparency = 1
	label.Text = itemName
	label.Font = Enum.Font.SourceSans
	label.TextSize = 16
	label.TextColor3 = Color3.fromRGB(255, 255, 255)
	label.TextXAlignment = Enum.TextXAlignment.Left
	label.Parent = itemFrame
end


local infoFrame = Instance.new("Frame")
infoFrame.Name = "InfoFrame"
infoFrame.Size = UDim2.new(0, 250, 0, 180)

infoFrame.Position = UDim2.new(0.5, 70, 0.4, 0)
infoFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
infoFrame.BackgroundTransparency = 0.3
infoFrame.BorderSizePixel = 0
infoFrame.Parent = screenGui

local infoStroke = Instance.new("UIStroke")
infoStroke.Thickness = 2
infoStroke.Color = Color3.fromRGB(255, 204, 0)
infoStroke.Parent = infoFrame

local infoTitle = Instance.new("TextLabel")
infoTitle.Size = UDim2.new(1, 0, 0, 30)
infoTitle.Position = UDim2.new(0, 0, 0, 0)
infoTitle.BackgroundTransparency = 1
infoTitle.Text = "Thông tin người chơi"
infoTitle.Font = Enum.Font.SourceSansBold
infoTitle.TextSize = 20
infoTitle.TextColor3 = Color3.fromRGB(255, 255, 0)
infoTitle.Parent = infoFrame

local infoContent = Instance.new("Frame")
infoContent.Size = UDim2.new(1, 0, 1, -30)
infoContent.Position = UDim2.new(0, 0, 0, 30)
infoContent.BackgroundTransparency = 1
infoContent.Parent = infoFrame

local playerLabels = {
	{Name = "PlayerName", Text = "Tên: " .. player.Name},
	{Name = "Level", Text = "Lever:"},
	{Name = "Beli", Text = "Beli:"},
	{Name = "Fragments", Text = "Fragments: "},
	{Name = "Race", Text = "Race: "}
}

for i, label in ipairs(playerLabels) do
	local statFrame = Instance.new("Frame")
	statFrame.Size = UDim2.new(1, 0, 0, 25)
	statFrame.Position = UDim2.new(0, 0, 0, (i - 1) * 30)
	statFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 30)
	statFrame.BackgroundTransparency = 0.8
	statFrame.Parent = infoContent

	local statLabel = Instance.new("TextLabel")
	statLabel.BackgroundTransparency = 1
	statLabel.Size = UDim2.new(1, -10, 1, 0)
	statLabel.Position = UDim2.new(0, 10, 0, 0)
	statLabel.Font = Enum.Font.SourceSans
	statLabel.Text = label.Text
	statLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
	statLabel.TextSize = 14
	statLabel.TextXAlignment = Enum.TextXAlignment.Left
	statLabel.Parent = statFrame
end
