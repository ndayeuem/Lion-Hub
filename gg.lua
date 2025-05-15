local placeId = game.PlaceId
	if placeId == 2753915549 then
		Old_World = true
	elseif placeId == 4442272183 then
		New_World = true
	elseif placeId == 7449423635 then
		Three_World = true
	end

	-- Booster
	getgenv().Deleted_Ui = true
	if getgenv().Deleted_Ui then
		library = {}
		function library:CreateWindow(...)
			local bit_zes = {
			}
			function bit_zes:CreateTab(...)
				local cizan = {
	
				}
				function cizan:CreateSection(...)
					local Azin = {
	
					}
					function Azin:AddLabel(...)
						local xp = {}
						function xp:Set(...)
							local op = {}
							return op 
						end
						return xp
					end
					function Azin:AddDropdown(...)
						local xp = {}
						return xp
					end
					function Azin:AddTextbox(...)
						local xp = {}
						return xp
					end
					function Azin:AddKeybind(...)
						local xp = {}
						return xp
					end
					function Azin:AddToggle(...)
						local xp = {}
						return xp
					end
					function Azin:AddButton(...)
						local xp = {}
						return xp
					end
					function Azin:AddSlider(...)
						local xp = {}
						return xp
					end
					function Azin:AddSearchBox(...)
						local xp = {}
						return xp
					end
					function Azin:AddColorpicker(...)
						local xp = {}
						return xp
					end
					function Azin:AddPersistence(...)
						local xp = {}
						return xp
					end
					return Azin
				end
				return cizan
			end
			return bit_zes
		end

		if game:GetService("CoreGui"):FindFirstChild('Lion Hub') then
			game:GetService("CoreGui"):FindFirstChild('Lion Hub'):Destroy()
		end
		-- Lion Hub
		local Hiru_Hub = Instance.new("ScreenGui")
		Hiru_Hub.Name = "Lion Hub"
		Hiru_Hub.Parent = game:GetService("CoreGui")
		Hiru_Hub.Enabled = false
		
		
		game:GetService("Players").LocalPlayer.PlayerGui.Main.BottomHUDList.SafeZone.Visible = false
		game:GetService("Players").LocalPlayer.PlayerGui.Main.Code.Visible = false
		-- Lion Hub 7M
		local F_Level = Instance.new("Frame")
		F_Level.Name = "Level"
		F_Level.Parent = game:GetService("CoreGui")["Lion Hub"]
		F_Level.Size = UDim2.new(1, 0, 1, 0)
		F_Level.Position = UDim2.new(0, 0, 0, 0)
		F_Level.AnchorPoint = Vector2.new(0.5, 0.5)
		F_Level.Transparency = 1
		game:GetService("Players").LocalPlayer.PlayerGui.Main.Fragments:Clone().Parent = game:GetService("CoreGui")["Lion Hub"].Level
		game:GetService("CoreGui")["Lion Hub"].Level.Fragments.TextColor3 = Color3.fromRGB(222, 22, 39) 
		game:GetService("CoreGui")["Lion Hub"].Level.Fragments.Text = "Lion Hub"
		game:GetService("CoreGui")["Lion Hub"].Level.Fragments.Size = UDim2.new(1, 0, 0, 40)
		game:GetService("CoreGui")["Lion Hub"].Level.Fragments.TextXAlignment = 'Center'
		game:GetService("CoreGui")["Lion Hub"].Level.Position = UDim2.new(0.5, 0, -0.2, 0)
		game:GetService("CoreGui")["Lion Hub"].Level.Fragments.TextStrokeTransparency = 1
		
		-- Time
		local F_Text2 = Instance.new("Frame")
		F_Text2.Name = "Text2"
		F_Text2.Parent = game:GetService("CoreGui")["Lion Hub"]
		F_Text2.Size = UDim2.new(1, 0, 1, 0)
		F_Text2.Position = UDim2.new(0, 0, 0, 0)
		F_Text2.AnchorPoint = Vector2.new(0.5, 0.5)
		F_Text2.Transparency = 1
		game:GetService("Players").LocalPlayer.PlayerGui.Main.Fragments:Clone().Parent = game:GetService("CoreGui")["Lion Hub"].Text2
		game:GetService("CoreGui")["Lion Hub"].Text2.Fragments.TextColor3 = Color3.fromRGB(245, 245, 245)
		game:GetService("CoreGui")["Lion Hub"].Text2.Fragments.Text = ""
		game:GetService("CoreGui")["Lion Hub"].Text2.Fragments.Size = UDim2.new(1, 0, 0, 25)
		game:GetService("CoreGui")["Lion Hub"].Text2.Fragments.TextXAlignment = 'Center'
		game:GetService("CoreGui")["Lion Hub"].Text2.Position = UDim2.new(0.5, 0, -0.1, 0)
		game:GetService("CoreGui")["Lion Hub"].Text2.Fragments.TextStrokeTransparency = 1
		
		-- Name
		local F_Text = Instance.new("Frame")
		F_Text.Name = "Text"
		F_Text.Parent = game:GetService("CoreGui")["Lion Hub"]
		F_Text.Size = UDim2.new(1, 0, 1, 0)
		F_Text.Position = UDim2.new(0, 0, 0, 0)
		F_Text.AnchorPoint = Vector2.new(0.5, 0.5)
		F_Text.Transparency = 1
		game:GetService("Players").LocalPlayer.PlayerGui.Main.Fragments:Clone().Parent = game:GetService("CoreGui")["Lion Hub"].Text
		game:GetService("CoreGui")["Lion Hub"].Text.Fragments.TextColor3 = Color3.fromRGB(245, 245, 245)
		game:GetService("CoreGui")["Lion Hub"].Text.Fragments.Text = '( '..game.Players.LocalPlayer.Name..' )'
		game:GetService("CoreGui")["Lion Hub"].Text.Fragments.Size = UDim2.new(1, 0, 0, 25)
		game:GetService("CoreGui")["Lion Hub"].Text.Fragments.TextXAlignment = 'Center'
		game:GetService("CoreGui")["Lion Hub"].Text.Position = UDim2.new(0.5, 0, 0.14, 0)
		game:GetService("CoreGui")["Lion Hub"].Text.Fragments.TextStrokeTransparency = 1
		-- Status
		local F_Text3 = Instance.new("Frame")
		F_Text3.Name = "Text3"
		F_Text3.Parent = game:GetService("CoreGui")["Lion Hub"]
		F_Text3.Size = UDim2.new(1, 0, 1, 0)
		F_Text3.Position = UDim2.new(0, 0, 0, 0)
		F_Text3.AnchorPoint = Vector2.new(0.5, 0.5)
		F_Text3.Transparency = 1
		game:GetService("Players").LocalPlayer.PlayerGui.Main.Fragments:Clone().Parent = game:GetService("CoreGui")["Lion Hub"].Text3
		game:GetService("CoreGui")["Lion Hub"].Text3.Fragments.TextColor3 = Color3.fromRGB(222, 22, 39) 
		game:GetService("CoreGui")["Lion Hub"].Text3.Fragments.Text = 'Status: Farm Level.'
		game:GetService("CoreGui")["Lion Hub"].Text3.Fragments.Size = UDim2.new(1, 0, 0, 28)
		game:GetService("CoreGui")["Lion Hub"].Text3.Fragments.TextXAlignment = 'Center'
		game:GetService("CoreGui")["Lion Hub"].Text3.Position = UDim2.new(0.5, 0, 0.22, 0)
		game:GetService("CoreGui")["Lion Hub"].Text3.Fragments.TextStrokeTransparency = 1
		-- Item Sanguine Art
		local F_Text5 = Instance.new("Frame")
		F_Text5.Name = "Text5"
		F_Text5.Parent = game:GetService("CoreGui")["Lion Hub"]
		F_Text5.Size = UDim2.new(1, 0, 1, 0)
		F_Text5.Position = UDim2.new(0, 0, 0, 0)
		F_Text5.AnchorPoint = Vector2.new(0.5, 0.5)
		F_Text5.Transparency = 1
		game:GetService("Players").LocalPlayer.PlayerGui.Main.Fragments:Clone().Parent = game:GetService("CoreGui")["Lion Hub"].Text5
		game:GetService("CoreGui")["Lion Hub"].Text5.Fragments.TextColor3 = Color3.fromRGB(245, 245, 245)
		game:GetService("CoreGui")["Lion Hub"].Text5.Fragments.Text = '...'
		game:GetService("CoreGui")["Lion Hub"].Text5.Fragments.Size = UDim2.new(1, 0, 0, 25)
		game:GetService("CoreGui")["Lion Hub"].Text5.Fragments.TextXAlignment = 'Center'
		game:GetService("CoreGui")["Lion Hub"].Text5.Position = UDim2.new(0.5, 0, 0.38, 0)
		game:GetService("CoreGui")["Lion Hub"].Text5.Fragments.TextStrokeTransparency = 1
		-- Full Moon
		local F_Text6 = Instance.new("Frame")
		F_Text6.Name = "Text6"
		F_Text6.Parent = game:GetService("CoreGui")["Lion Hub"]
		F_Text6.Size = UDim2.new(1, 0, 1, 0)
		F_Text6.Position = UDim2.new(0, 0, 0, 0)
		F_Text6.AnchorPoint = Vector2.new(0.5, 0.5)
		F_Text6.Transparency = 1
		game:GetService("Players").LocalPlayer.PlayerGui.Main.Fragments:Clone().Parent = game:GetService("CoreGui")["Lion Hub"].Text6
		game:GetService("CoreGui")["Lion Hub"].Text6.Fragments.TextColor3 = Color3.fromRGB(255,140,0)
		game:GetService("CoreGui")["Lion Hub"].Text6.Fragments.Text = '🌕 75% ('..tostring(game:GetService("Lighting").TimeOfDay)..')'
		game:GetService("CoreGui")["Lion Hub"].Text6.Fragments.Size = UDim2.new(1, 0, 0, 25)
		game:GetService("CoreGui")["Lion Hub"].Text6.Fragments.TextXAlignment = 'Center'
		game:GetService("CoreGui")["Lion Hub"].Text6.Position = UDim2.new(0.5, 0, -0.03, 0)
		game:GetService("CoreGui")["Lion Hub"].Text6.Fragments.TextStrokeTransparency = 1
		spawn(function()
			while wait(1) do
				pcall(function()
					if Three_World then
						if game:GetService("Lighting").Sky.MoonTextureId == "http://www.roblox.com/asset/?id=9709149431" then
							game:GetService("CoreGui")["Lion Hub"].Text6.Fragments.Text = '🌕 100% ('..tostring(game:GetService("Lighting").TimeOfDay)..')'
						elseif game:GetService("Lighting").Sky.MoonTextureId == "http://www.roblox.com/asset/?id=9709149052" then
							game:GetService("CoreGui")["Lion Hub"].Text6.Fragments.Text = '🌕 75% ('..tostring(game:GetService("Lighting").TimeOfDay)..')'
						elseif game:GetService("Lighting").Sky.MoonTextureId == "http://www.roblox.com/asset/?id=9709143733" then
							game:GetService("CoreGui")["Lion Hub"].Text6.Fragments.Text = '🌕 50% ('..tostring(game:GetService("Lighting").TimeOfDay)..')'
						elseif game:GetService("Lighting").Sky.MoonTextureId == "http://www.roblox.com/asset/?id=9709150401" then
							game:GetService("CoreGui")["Lion Hub"].Text6.Fragments.Text = '🌕 25% ('..tostring(game:GetService("Lighting").TimeOfDay)..')'
						elseif game:GetService("Lighting").Sky.MoonTextureId == "http://www.roblox.com/asset/?id=9709149680" then
							game:GetService("CoreGui")["Lion Hub"].Text6.Fragments.Text = '🌕 15% ('..tostring(game:GetService("Lighting").TimeOfDay)..')'
						else 
							game:GetService("CoreGui")["Lion Hub"].Text6.Fragments.Text = '🌕 0% ('..tostring(game:GetService("Lighting").TimeOfDay)..')'
						end 
						local scripttime=game.Workspace.DistributedGameTime
						local seconds = scripttime%60
						minutes = math.floor(scripttime/60%60)
						hours = math.floor(scripttime/3600)
						local tempo = string.format("%.0f Hours, %.0f Minutes, %.0f Seconds", hours ,minutes, seconds)
						game:GetService("CoreGui")["Lion Hub"].Text2.Fragments.Text = tempo
					else
						game:GetService("CoreGui")["Lion Hub"].Text6.Fragments.Text = '🌕 0% ('..tostring(game:GetService("Lighting").TimeOfDay)..')'
						local scripttime=game.Workspace.DistributedGameTime
						local seconds = scripttime%60
						minutes = math.floor(scripttime/60%60)
						hours = math.floor(scripttime/3600)
						local tempo = string.format("%.0f Hours, %.0f Minutes, %.0f Seconds", hours ,minutes, seconds)
						game:GetService("CoreGui")["Lion Hub"].Text2.Fragments.Text = tempo
					end
				end)
			end
		end)
		-- Sanguine Art
		local F_Text4 = Instance.new("Frame")
		F_Text4.Name = "Text4"
		F_Text4.Parent = game:GetService("CoreGui")["Lion Hub"]
		F_Text4.Size = UDim2.new(1, 0, 1, 0)
		F_Text4.Position = UDim2.new(0, 0, 0, 0)
		F_Text4.AnchorPoint = Vector2.new(0.5, 0.5)
		F_Text4.Transparency = 1
		game:GetService("Players").LocalPlayer.PlayerGui.Main.Fragments:Clone().Parent = game:GetService("CoreGui")["Lion Hub"].Text4
		game:GetService("CoreGui")["Lion Hub"].Text4.Fragments.TextColor3 = Color3.fromRGB(222, 22, 39) 
		game:GetService("CoreGui")["Lion Hub"].Text4.Fragments.Text = '...'
		game:GetService("CoreGui")["Lion Hub"].Text4.Fragments.Size = UDim2.new(1, 0, 0, 35)
		game:GetService("CoreGui")["Lion Hub"].Text4.Fragments.TextXAlignment = 'Center'
		game:GetService("CoreGui")["Lion Hub"].Text4.Position = UDim2.new(0.5, 0, 0.47, 0)
		game:GetService("CoreGui")["Lion Hub"].Text4.Fragments.TextStrokeTransparency = 1

		local BlurHiru = Instance.new("BlurEffect")
		BlurHiru.Name = "HiruBlur"
		BlurHiru.Parent = game:GetService("Lighting")
		BlurHiru.Enabled = true
		BlurHiru.Size = 0
		
		game:GetService("UserInputService").InputBegan:Connect(function(input, isTyping)
			if not isTyping then
				if input.KeyCode == Enum.KeyCode.B then
					if togle_up then
						game:GetService("CoreGui")["Lion Hub"].Enabled = false
						game.Lighting.ExposureCompensation = 0
						--BlurHiru.Size = 0
						togle_up = false
					else
						game:GetService("CoreGui")["Lion Hub"].Enabled = true
						game.Lighting.ExposureCompensation = -10
						--BlurHiru.Size = 80
						togle_up = true
					end
				end
			end
		end)
		if game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild('ContextActionGui') then
			game:GetService("Players").LocalPlayer.PlayerGui.ContextActionGui.Enabled = false
		end
		if game.CoreGui:FindFirstChild('SWP') then
			game.CoreGui:FindFirstChild('SWP'):Destroy()
		end
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
		ToggleFrameUi.BackgroundColor3 = Color3.fromRGB(245, 245, 245) -- Changed from (15, 15, 15) to off-white color
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
		ToggleImgUi.BackgroundColor3 = Color3.fromRGB(245, 245, 245) -- Changed from (5, 5, 5) to off-white color
		ToggleImgUi.BackgroundTransparency = 1
		ToggleImgUi.Position = UDim2.new(0.0454545468, 0, 0.125000313, 0)
		ToggleImgUi.Size = UDim2.new(0, 35, 0, 35)
		ToggleImgUi.Image = "rbxassetid://17260696651"
		ToggleImgUi.MouseButton1Click:Connect(function()
			if togle_up then
				ToggleImgUi.ImageTransparency = 0.3
				uihide = true
				game:GetService("CoreGui")["Lion Hub"].Enabled = false
				game.Lighting.ExposureCompensation = 0
				--BlurSwitch.Size = 0
				togle_up = false
				wait()
				ToggleImgUi.ImageTransparency = 0
			else
				ToggleImgUi.ImageTransparency = 0.3
				uihide = true
				game:GetService("CoreGui")["Lion Hub"].Enabled = true
				game.Lighting.ExposureCompensation = -10
				--BlurSwitch.Size = 80
				togle_up = true
				wait()
				ToggleImgUi.ImageTransparency = 0
			end
		end)
		
		Uitoggle.Name = "Uitoggle"
		Uitoggle.Parent = ToggleFrameUi
		Uitoggle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Uitoggle.BackgroundTransparency = 1.000
		Uitoggle.Position = UDim2.new(0.14, 0, 0.1, 0)
		Uitoggle.Size = UDim2.new(0, 137, 0, 25)
		Uitoggle.Font = Enum.Font.GothamSemibold
		Uitoggle.Text = "Lion Hub Kaitun"
		Uitoggle.TextColor3 = Color3.fromRGB(20, 20, 20) -- Changed from (255, 255, 255) to dark gray for readability on white background
		Uitoggle.TextSize = 12.000
		
		Yedhee.Name = "Yedhee"
		Yedhee.Parent = ToggleFrameUi
		Yedhee.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Yedhee.BackgroundTransparency = 1.000
		Yedhee.Position = UDim2.new(0.14, 0, 0.429166657, 0)
		Yedhee.Size = UDim2.new(0, 137, 0, 25)
		Yedhee.Font = Enum.Font.GothamSemibold
		Yedhee.Text = "White Screen (B)"
		Yedhee.TextColor3 = Color3.fromRGB(0, 180, 130) -- Adjusted slightly for better contrast on white background
		Yedhee.TextSize = 12.000
		
		if game.CoreGui:FindFirstChild('Lion Hub C') then
			game.CoreGui:FindFirstChild('Lion Hub C'):Destroy()
		end
		local function click(a)
			game:GetService("VirtualInputManager"):SendMouseButtonEvent(a.AbsolutePosition.X+a.AbsoluteSize.X/2.5,a.AbsolutePosition.Y+50,0,true,a,1)
			game:GetService("VirtualInputManager"):SendMouseButtonEvent(a.AbsolutePosition.X+a.AbsoluteSize.X/2.5,a.AbsolutePosition.Y+50,0,false,a,1)
		end
		function CheckPhoto(vu)
			click(game:GetService("Players").LocalPlayer.PlayerGui.Main.InventoryContainer.Right.Content.Sort)
			wait(.2)
			click(game:GetService("Players").LocalPlayer.PlayerGui.Main.InventoryContainer.Right.Content.Sort.Dropdown[vu])
			wait(.2)
		end
		function Load_Info(Name_X,Folder)
			local keep_all_name = {}
			local kp = 0
			local old_check = 0
			local end_check = false
			game:GetService("Players").LocalPlayer.PlayerGui.Main.InventoryContainer.Right.Content.ScrollingFrame.CanvasPosition = Vector2.new(0,game:GetService("Players").LocalPlayer.PlayerGui.Main.InventoryContainer.Right.Content.ScrollingFrame.CanvasPosition.Y-1030)
			repeat 
				for i,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.Main.InventoryContainer.Right.Content.ScrollingFrame.Frame:GetDescendants()) do
					if v.Name == 'Background' and tostring(v.BackgroundColor) == 'Bright red' and not table.find(keep_all_name,v.Parent.ItemName.Text) then 
						v.Parent:Clone().Parent = game:GetService("CoreGui")["Lion Hub C"][Folder]
						game:GetService("CoreGui")["Lion Hub C"][Folder][v.Parent.Name].Name = v.Parent.ItemName.Text
						table.insert(keep_all_name,v.Parent.ItemName.Text)
					end
				end
				if #keep_all_name > 0 then
					game:GetService("Players").LocalPlayer.PlayerGui.Main.InventoryContainer.Right.Content.ScrollingFrame.CanvasPosition = Vector2.new(0,game:GetService("Players").LocalPlayer.PlayerGui.Main.InventoryContainer.Right.Content.ScrollingFrame.CanvasPosition.Y+130)
					wait(.3)
					if old_check == game:GetService("Players").LocalPlayer.PlayerGui.Main.InventoryContainer.Right.Content.ScrollingFrame.CanvasPosition.Y then
						end_check = true
					else
						old_check = game:GetService("Players").LocalPlayer.PlayerGui.Main.InventoryContainer.Right.Content.ScrollingFrame.CanvasPosition.Y
					end
				end
				kp = kp + 1
			until #keep_all_name > 0 and end_check or kp >= 3 and #keep_all_name == 0
		end
		-- Lion Hub C
		local Hiru_Hub = Instance.new("ScreenGui")
		Hiru_Hub.Name = "Lion Hub C"
		Hiru_Hub.Parent = game:GetService("CoreGui")
		-- Fruit Inventory Backpack
		local F_FruitB = Instance.new("Frame")
		F_FruitB.Name = "FruitB"
		F_FruitB.Parent = game:GetService("CoreGui")["Lion Hub C"]
		F_FruitB.Size = UDim2.new(0.17, 0, 0, 0)
		F_FruitB.Position = UDim2.new(0.02, 0, 0.03, 0)
		F_FruitB.Transparency = 1
		local uig = Instance.new("UIGridLayout")
		uig.Parent = game:GetService("CoreGui")["Lion Hub C"].FruitB
		uig.CellSize = UDim2.new(0, 55, 0, 55)
		--[[
		click(game:GetService("Players").LocalPlayer.PlayerGui.Main.MenuButton) -- open menu
		wait(.5)
		click(game:GetService("Players").LocalPlayer.PlayerGui.Main.InventoryButton) -- open Beg
		wait(.5)
		CheckPhoto('Treasure')
		game:GetService("Players").LocalPlayer.PlayerGui.Main.InventoryContainer.Visible = true
		Load_Info('Blox Fruit','FruitB')
		game:GetService("CoreGui")["Lion Hub C"].FruitB.Visible = true
		click(game:GetService("Players").LocalPlayer.PlayerGui.Main.MenuButton) -- open menu
		]]
		wait(.5)
		if _G.Setting['Black Screen'] then
			ToggleImgUi.ImageTransparency = 0.3
			uihide = true
			game:GetService("CoreGui")["Lion Hub"].Enabled = true
			game.Lighting.ExposureCompensation = -10
			--BlurHiru.Size = 80
			togle_up = true
			wait()
			ToggleImgUi.ImageTransparency = 0
		end
		function Set_Status_X(vu)
			game:GetService("CoreGui")["Lion Hub"].Text3.Fragments.Text = vu
		end
		--[[
		local AkaliNotif = loadstring(game:HttpGet("https://raw.githubusercontent.com/Nguyenchibinh7/Heheheheh/refs/heads/main/notifycation.lua"))()
		local Notify = AkaliNotif.Notify
		Notify({
			Description = '✅ Turn on and off (White Screen "Y")',
			Title = "Lion Hub Kaitun | "..tostring(game.Players.LocalPlayer.Name),
			Duration = 5
		})
		Notify({
			Description = '👾 Turn on and off (Farming "B")',
			Title = "Automatic Farming",
			Duration = 5
		})
		local Notification = loadstring(game:HttpGet("https://raw.githubusercontent.com/Nguyenchibinh7/Heheheheh/refs/heads/main/notification.status.lua", true))()
		status_pass = Notification.new("message", 'Lion Hub Kaitun | ', "Status: ...")
		status_pass:changeColor(Color3.fromRGB(15,15,15),Color3.fromRGB(42, 170, 138),Color3.fromRGB(255, 244, 0))
		spawn(function()
			while wait(1) do
				pcall(function()
					local scripttime=game.Workspace.DistributedGameTime
					local seconds = scripttime%60
					minutes = math.floor(scripttime/60%60)
					hours = math.floor(scripttime/3600)
					local tempo = string.format("%.0f Hr(s), %.0f Min(s), %.0f Sec(s)", hours ,minutes, seconds)
					status_pass:changeHeading(tempo)
				end) 
			end
		end)
		if getgenv().Setting['White Screen'] then
			game:GetService("RunService"):Set3dRenderingEnabled(false)
			togle_up = false
		end
		game:GetService("UserInputService").InputBegan:Connect(function(input, isTyping)
			if not isTyping then
				if input.KeyCode == Enum.KeyCode.Y then
					if togle_up then
						game:GetService("RunService"):Set3dRenderingEnabled(false)
						togle_up = false
					else
						game:GetService("RunService"):Set3dRenderingEnabled(true)
						togle_up = true
					end
				end
			end
		end)
		game:GetService("UserInputService").InputBegan:Connect(function(input, isTyping)
			if not isTyping then
