if  not LPH_OBFUSCATED then
	function LPH_JIT_MAX(...)
		return ...;
	end
	function LPH_NO_VIRTUALIZE(...)
		return ...;
	end
	function LPH_NO_UPVALUES(...)
		return ...;
	end
end

if getgenv().Team == "Marines" then
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetTeam", "Marines")
elseif getgenv().Team == "Pirates" then
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetTeam", "Pirates")
end

repeat
    task.wait(1)
    local chooseTeam = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"):FindFirstChild("ChooseTeam", true)
    local uiController = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"):FindFirstChild("UIController", true)

    if chooseTeam and chooseTeam.Visible and uiController then
        for _, v in pairs(getgc(true)) do
            if type(v) == "function" and getfenv(v).script == uiController then
                local constant = getconstants(v)
                pcall(function()
                    if (constant[1] == "Pirates" or constant[1] == "Marines") and #constant == 1 then
                        if constant[1] == getgenv().Team then
                            v(getgenv().Team)
                        end
                    end
                end)
            end
        end
    end
until game:GetService("Players").LocalPlayer.Team
  
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")
local overlayGui = Instance.new("ScreenGui")
overlayGui.Name = "OverlayGui"
overlayGui.ResetOnSpawn = false
overlayGui.IgnoreGuiInset = true
overlayGui.Parent = playerGui
local overlayFrame = Instance.new("Frame")
overlayFrame.Name = "OverlayFrame"
overlayFrame.Size = UDim2.new(1, 0, 1, 0)
overlayFrame.Position = UDim2.new(0, 0, 0, 0)
overlayFrame.BackgroundColor3 = Color3.new(0, 0, 0)
overlayFrame.BackgroundTransparency = 0.3
overlayFrame.BorderSizePixel = 0
overlayFrame.Active = true
overlayFrame.Visible = false
overlayFrame.Parent = overlayGui
local imageLabel = Instance.new("ImageLabel")
imageLabel.Name = "CenterImage"
imageLabel.Size = UDim2.new(0, 150, 0, 150)
imageLabel.Position = UDim2.new(0.5, -75, 0.5, -100)
imageLabel.BackgroundTransparency = 1
imageLabel.Image = "rbxassetid://123709024751036"
imageLabel.Parent = overlayFrame
local topStatusLabel = Instance.new("TextLabel")
topStatusLabel.Name = "TopStatusText"
topStatusLabel.Size = UDim2.new(0, 400, 0, 30)
topStatusLabel.Position = UDim2.new(0.5, -200, 0.5, 70)
topStatusLabel.BackgroundTransparency = 1
topStatusLabel.Text = "Username: " .. player.Name .. " | Level: " .. game.Players.LocalPlayer.Data.Level.Value .. " | Beli: " .. player.Data.Beli.Value .. " | Fragments: " .. player.Data.Fragments.Value
topStatusLabel.TextColor3 = Color3.new(1, 1, 1)
topStatusLabel.TextScaled = true
topStatusLabel.Font = Enum.Font.SourceSansBold
topStatusLabel.Parent = overlayFrame
local bottomStatusLabel = Instance.new("TextLabel")
bottomStatusLabel.Name = "BottomStatusText"
bottomStatusLabel.Size = UDim2.new(0, 400, 0, 30)
bottomStatusLabel.Position = UDim2.new(0.5, -200, 0.5, 110)
bottomStatusLabel.BackgroundTransparency = 1
bottomStatusLabel.Text = "Status: Script Loading"
bottomStatusLabel.TextColor3 = Color3.new(1, 1, 1)
bottomStatusLabel.TextScaled = true
bottomStatusLabel.Font = Enum.Font.SourceSans
bottomStatusLabel.Parent = overlayFrame

function SetUi(color, action, text)
    if color == "off" then
        overlayFrame.Visible = false
        return
    end
    
    if action == "on" then
        overlayFrame.BackgroundColor3 = Color3.new(0, 0, 0)
        overlayFrame.BackgroundTransparency = 0.3
        topStatusLabel.TextColor3 = Color3.new(1, 1, 1)
        bottomStatusLabel.TextColor3 = Color3.new(1, 1, 1)
        
        if color == "white" then
            overlayFrame.BackgroundColor3 = Color3.new(1, 1, 1)
            overlayFrame.BackgroundTransparency = 0
            topStatusLabel.TextColor3 = Color3.new(0, 0, 0)
            bottomStatusLabel.TextColor3 = Color3.new(0, 0, 0)
        elseif color == "dark" then
            overlayFrame.BackgroundColor3 = Color3.new(0, 0, 0)
            overlayFrame.BackgroundTransparency = 0
        elseif color == "blur" then
            overlayFrame.BackgroundTransparency = 0.4
        end
        
        if text then
            bottomStatusLabel.Text = tostring(text)
        end
        overlayFrame.Visible = true
    end
end

SetUi("blur", "on", "Script Loading")
--// check Sea
if game.PlaceId == 2753915549 then
        World1 = true
    elseif game.PlaceId == 4442272183 then
        World2 = true
    elseif game.PlaceId == 7449423635 then
        World3 = true
    else
    game:GetService("Players").LocalPlayer:Kick("This Game Is Not Support [ Lion Hub ]")
  end 

loadstring(game:HttpGet("https://raw.githubusercontent.com/NHMdz/Chest-farm/refs/heads/main/CheckQuest.lua"))()

game:GetService("Players").LocalPlayer.Idled:connect(function()
game:GetService("VirtualUser"):Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
wait(1)
game:GetService("VirtualUser"):Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
end)

if not game:GetService("Workspace").Map:FindFirstChild("Temple of Time") and World3 then
game.ReplicatedStorage.MapStash["Temple of Time"].Parent = workspace.Map
end
            
--//Sea
local noclipLoop

function noclip()
    local char = game:GetService("Players").LocalPlayer.Character
    if not char then return end
    if not char.HumanoidRootPart:FindFirstChild("BodyClip") then
        local Noclip = Instance.new("BodyVelocity")
        Noclip.Name = "BodyClip"
        Noclip.Parent = char.HumanoidRootPart
        Noclip.MaxForce = Vector3.new(100000, 100000, 100000)
        Noclip.Velocity = Vector3.new(0, 0, 0)
    end
    if not noclipLoop then
        noclipLoop = game:GetService("RunService").Stepped:Connect(function()
            for _, v in pairs(char:GetDescendants()) do
                if v:IsA("BasePart") then
                    v.CanCollide = false
                end
            end
        end)
    end
end

function unnoclip()
    local char = game:GetService("Players").LocalPlayer.Character
    if not char then return end
    if char.HumanoidRootPart:FindFirstChild("BodyClip") then
        char.HumanoidRootPart.BodyClip:Destroy()
    end
    if noclipLoop then
        noclipLoop:Disconnect()
        noclipLoop = nil
    end
    for _, v in pairs(char:GetDescendants()) do
        if v:IsA("BasePart") then
            v.CanCollide = true
        end
    end
end

function checkInventory(name)
    local inventory = game.ReplicatedStorage.Remotes.CommF_:InvokeServer("getInventory")
    for _, item in pairs(inventory) do
        if item.Name == name then
            return true
        end
    end
    return false
end

function CheckBoss(name)
    local targets = typeof(name) == "table" and name or {name}
    for _, v in pairs(game.ReplicatedStorage:GetChildren()) do
        if v:IsA("Model") and table.find(targets, v.Name) and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
            return v
        end
    end
    for _, v in pairs(game.Workspace.Enemies:GetChildren()) do
        if v:IsA("Model") and table.find(targets, v.Name) and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
            return v
        end
    end
    return nil
end

function GetCountMaterials(materialName)
    local inventory = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("getInventory")
    for _, item in pairs(inventory) do
        if item.Name == materialName then
            return item["Count"]
        end
    end
    return 0
end

    function AutoHaki()
  local player = game:GetService("Players").LocalPlayer
  local character = player.Character
  if character and not character:FindFirstChild("HasBuso") then
    local remote = game:GetService("ReplicatedStorage").Remotes.CommF_
    if remote then
      remote:InvokeServer("Buso") 
    end
  end
end
  
function GetFruitUnder1()
	local fruitList = {
		["Rocket-Rocket"] = true,
		["Spin-Spin"] = true,
		["Blade-Blade"] = true,
		["Spring-Spring"] = true,
		["Bomb-Bomb"] = true,
		["Smoke-Smoke"] = true,
		["Spike-Spike"] = true,
		["Flame-Flame"] = true,
		["Eagle-Eagle"] = true,
		["Ice-Ice"] = true,
		["Sand-Sand"] = true,
		["Dark-Dark"] = true,
		["Ghost-Ghost"] = true,
		["Diamond-Diamond"] = true,
		["Light-Light"] = true,
		["Rubber-Rubber"] = true,
		["Magma-Magma"] = true
	}

	local fruit = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("getInventory")
	if not fruit then return false end

	for _, v in pairs(fruit) do
		if v.Type == "Blox Fruit" then 
			if fruitList[v.Name] then
				local success = pcall(function()
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("LoadFruit", v.Name)
				end)
				if success then
					print("[Debug] Đã load trái: " .. v.Name)
					return true
				end
			end
		end
	end

	return false
end

function checkEnemies()
    if not game.Players.LocalPlayer.Character or not game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then 
        return false 
    end

    local playerPosition = game.Players.LocalPlayer.Character.HumanoidRootPart.Position

    for _, folder in pairs({game.Workspace.Enemies, game.Workspace.SeaBeasts}) do
        for _, enemy in pairs(folder:GetChildren()) do
            if table.find({"Shark", "Terrorshark", "Piranha", "Fish Crew Member", "PirateBrigade", "PirateGrandBrigade", "FishBoat", "SeaBeast1"}, enemy.Name) then
                if enemy:FindFirstChild("HumanoidRootPart") and (enemy.HumanoidRootPart.Position - playerPosition).Magnitude <= 800 then
                    return true
                end
                
                if (enemy.Name == "PirateBrigade" or enemy.Name == "PirateGrandBrigade" or enemy.Name == "FishBoat") and enemy:FindFirstChild("VehicleSeat") then
                    if (enemy.VehicleSeat.Position - playerPosition).Magnitude <= 800 then
                        return true
                    end
                end
            end
        end
    end

    return false
end

function CheckNotificationText(searchText)
    local notifications = game.Players.LocalPlayer:FindFirstChild("PlayerGui")
    if not notifications then return false end
    local notifFrame = notifications:FindFirstChild("Notifications")
    if not notifFrame then return false end
    for _, notification in pairs(notifFrame:GetDescendants()) do
        if notification:IsA("TextLabel") or notification:IsA("TextBox") then
            local success, text = pcall(function() return notification.Text end)
            if success and text and string.find(text:lower(), searchText:lower()) then
                return true
            end
        end
    end
    return false
end

function checkNotify()
    return CheckNotificationText("safe") or CheckNotificationText("an toàn") or CheckNotificationText("died") or CheckNotificationText("chết")
end

function cd(a, b)
    b = b or lp.Character.PrimaryPart.CFrame
    return (Vector3.new(a.X, 0, a.Z) - Vector3.new(b.X, 0, b.Z)).Magnitude
end

function int(num) return num and tonumber(num) end
function str(s) return s and tostring(s) end
function wt(num) return task.wait(num and int(num)) end
function ffc(obj, child) return obj and child and obj:FindFirstChild(str(child)) end
function wfc(obj, child) return obj and child and obj:WaitForChild(str(child), 9) end
function wfh(mob) return mob and wfc(mob.Character, "Humanoid") end
function wfhrp(mob) return mob and wfc(mob.Character, "HumanoidRootPart") end

function checksafezone(pos)
    for _, v in workspace._WorldOrigin.SafeZones:GetChildren() do
        if cd(v.CFrame, pos) < (v.Mesh.Scale.Magnitude / 2) then return true end
    end
    return false
end

function checkraid(target)
    local island = ffc(workspace["_WorldOrigin"].Locations, "Island 1")
    return island and cd(wfhrp(target).CFrame, island.CFrame) < 3000
end

function TPB2(CFgo)
    local tween_s = game:GetService("TweenService")
    local player = game.Players.LocalPlayer
    local hrp = player.Character and player.Character:FindFirstChild("HumanoidRootPart")

    if not hrp then return end

    for _, boat in pairs(game:GetService("Workspace").Boats:GetChildren()) do
        if boat:FindFirstChild("VehicleSeat") and boat:FindFirstChild("Owner") then
            if tostring(boat.Owner.Value) == player.Name then
                local seat = boat.VehicleSeat
                if (seat.Position - hrp.Position).Magnitude <= 5 then
                    local tween = tween_s:Create(seat, TweenInfo.new((seat.Position - CFgo.Position).Magnitude / 300, Enum.EasingStyle.Linear), {CFrame = CFgo})
                    tween:Play()
                    spawn(function()
                        while tween and tween.PlaybackState == Enum.PlaybackState.Playing do
                            task.wait(0.1)
                            local new_hrp = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
                            if not _G.AutoSeaEvent or not _G.FindKit or not new_hrp or (seat.Position - new_hrp.Position).Magnitude > 100 then
                                tween:Cancel()
                                break
                            end
                        end
                    end)
                    return tween
                end
            end
        end
    end
end

function CheckSeaMonster(monsterName)
    for _, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
        if v.Name == monsterName and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
            if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.HumanoidRootPart.Position).Magnitude <= 800 then
                return v
            end
        end
    end
end

function CheckPirateBoat()
    local checkmmpb = {"PirateGrandBrigade", "PirateBrigade"}
    for _, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
        if table.find(checkmmpb, v.Name) and v:FindFirstChild("Health") and v.Health.Value > 0 then
            if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.HumanoidRootPart.Position).Magnitude <= 800 then
                return v
            end
        end
    end
end

function AddEsp(Name, Parent)
    local BillboardGui = Instance.new("BillboardGui")
    local TextLabel = Instance.new("TextLabel")
    
    BillboardGui.Parent = Parent
    BillboardGui.Name = Name
    BillboardGui.AlwaysOnTop = true
    BillboardGui.Size = UDim2.new(0, 200, 0, 50)
    BillboardGui.StudsOffset = Vector3.new(0, 2.5, 0)
    BillboardGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    BillboardGui.LightInfluence = 1.0
    
    TextLabel.Parent = BillboardGui
    TextLabel.Size = UDim2.new(1, 0, 1, 0)
    TextLabel.BackgroundTransparency = 1
    TextLabel.Font = Enum.Font.GothamBold
    TextLabel.Text = "YOUR BOAT"
    TextLabel.TextColor3 = Color3.fromRGB(255, 50, 50)
    TextLabel.TextSize = 18
    TextLabel.TextStrokeTransparency = 0
    TextLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
end

function CheckSwanBoat()
    for _, boat in next, game:GetService("Workspace").Boats:GetChildren() do
        if boat:IsA("Model") and boat.Name == SelectBoat then
            if boat:FindFirstChild("Owner") and tostring(boat.Owner.Value) == game:GetService("Players").LocalPlayer.Name and boat.Humanoid.Value > 0 then
                return boat
            end
        end
    end
    return false
end

    function UnEquipWeapon(Weapon)
        if game.Players.LocalPlayer.Character:FindFirstChild(Weapon) then
            _G.NotAutoEquip = true
            wait(.5)
            game.Players.LocalPlayer.Character:FindFirstChild(Weapon).Parent = game.Players.LocalPlayer.Backpack
            wait(.1)
            _G.NotAutoEquip = false
        end
    end

function Time()
    local GameTime = "Error"
    local c2 = game.Lighting.ClockTime
    if c2 >= 18 or c2 < 5 then
        GameTime = "Night"
    else
        GameTime = "Day"
    end
    return GameTime
end

function EquipWeapon(ToolSe)
	if game.Players.LocalPlayer.Backpack:FindFirstChild(ToolSe) then
		local tool = game.Players.LocalPlayer.Backpack:FindFirstChild(ToolSe)
		wait(.4)
		game.Players.LocalPlayer.Character.Humanoid:EquipTool(tool)
	end
end    
    
    function EquipWeapon(ToolSe)
        if not _G.NotAutoEquip then
            if game.Players.LocalPlayer.Backpack:FindFirstChild(ToolSe) then
                Tool = game.Players.LocalPlayer.Backpack:FindFirstChild(ToolSe)
                wait(.1)
                game.Players.LocalPlayer.Character.Humanoid:EquipTool(Tool)
            end
        end
    end
  
function GetDistance(target)
        return math.floor((target.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude)
    end
    
    function BTP(p)
    	pcall(function()
	    	if (p.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude >= 1500 and not Auto_Raid and game.Players.LocalPlayer.Character.Humanoid.Health > 0 then
				repeat wait()
					game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = p
					wait(0.5)
					game.Players.LocalPlayer.Character.Head:Destroy()
					game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = p
				until (p.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 1500 and game.Players.LocalPlayer.Character.Humanoid.Health > 0
			end
		end)
	end
    function TP(Pos)
        Distance = (Pos.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
        if Distance < 300 then
            Speed = 300
        elseif Distance >= 1000 then
            Speed = 300
        end
        game:GetService("TweenService"):Create(
            game:GetService("Players").LocalPlayer.Character.HumanoidRootPart,
            TweenInfo.new(Distance/Speed, Enum.EasingStyle.Linear),
            {CFrame = Pos}
        ):Play()
        _G.Clip = true
        wait(Distance/Speed)
        _G.Clip = false
    end

function TPP(Pos)
        Distance = (Pos.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
        if game.Players.LocalPlayer.Character.Humanoid.Sit == true then game.Players.LocalPlayer.Character.Humanoid.Sit = false end
        pcall(function() tween = game:GetService("TweenService"):Create(game.Players.LocalPlayer.Character.HumanoidRootPart,TweenInfo.new(Distance/325, Enum.EasingStyle.Linear),{CFrame = Pos}) end)
        tween:Play()
        noclip()
        if Distance <= 100 then
            tween:Cancel()
            unnoclip()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Pos
        end
        if _G.StopTween == true then
            tween:Cancel()
            unnoclip()
            _G.Clip = false
        end
    end

    function CheckNearestTeleporter(aI)
        local MyLevel = game.Players.LocalPlayer.Data.Level.Value
        vcspos = aI.Position
        min = math.huge
        min2 = math.huge
        local y = game.PlaceId
        if y == 2753915549 then
            OldWorld = true
        elseif y == 4442272183 then
            NewWorld = true
        elseif y == 7449423635 then
            ThreeWorld = true
        end  
        if World3 then
            TableLocations = {
                ["Caslte On The Sea"] = Vector3.new(-5058.77490234375, 314.5155029296875, -3155.88330078125),
                ["Hydra"] = Vector3.new(5661.5302734375, 1013.3587036132812, -334.9619140625),
                ["Mansion"] = Vector3.new(-12463.8740234375, 374.9144592285156, -7523.77392578125),
                ["Great Tree"] = Vector3.new(28286.000000000000000, 14896.823242187500000, 103.000000000000000),
                ["Ngu1"] = Vector3.new(-11989.2880859375, 332.1744384765625, -8886.025390625),
                ["ngu2"] = Vector3.new(5314.58203125, 25.419387817382812, -125.94227600097656),
                ["ngu3"] = Vector3.new(28282.5703125, 14896.8232421875, 105.1042709350586)
            }
        elseif World2 then
            TableLocations = {
                ["Mansion"] = Vector3.new(-288.46246337890625, 306.130615234375, 597.9988403320312),
                ["Flamingo"] = Vector3.new(2284.912109375, 15.152046203613281, 905.48291015625),
                ["122"] = Vector3.new(923.21252441406, 126.9760055542, 32852.83203125),
                ["3032"] = Vector3.new(-6508.5581054688, 89.034996032715, -132.83953857422)
            }
        elseif World1 then
            TableLocations = {
                ["1"] = Vector3.new(-7894.6201171875, 5545.49169921875, -380.2467346191406),
                ["2"] = Vector3.new(-4607.82275390625, 872.5422973632812, -1667.556884765625),
                ["3"] = Vector3.new(61163.8515625, 11.759522438049316, 1819.7841796875),
                ["4"] = Vector3.new(3876.280517578125, 35.10614013671875, -1939.3201904296875)
            }
        end
        TableLocations2 = {}
        for r, v in pairs(TableLocations) do
            TableLocations2[r] = (v - vcspos).Magnitude
        end
        for r, v in pairs(TableLocations2) do
            if v < min then
                min = v
                min2 = v
            end
        end
        for r, v in pairs(TableLocations2) do
            if v < min then
                min = v
                min2 = v
            end
        end
        for r, v in pairs(TableLocations2) do
            if v <= min then
                choose = TableLocations[r]
            end
        end
        min3 = (vcspos - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
        if min2 <= min3 then
            return choose
        end
    end
    
    function requestEntrance(aJ)
        args = {"requestEntrance", aJ}
        game.ReplicatedStorage.Remotes.CommF_:InvokeServer(unpack(args))
        oldcframe = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
        char = game.Players.LocalPlayer.Character.HumanoidRootPart
        char.CFrame = CFrame.new(oldcframe.X, oldcframe.Y + 50, oldcframe.Z)
        task.wait(0.5)
    end
    
    function AntiLowHealth(aK)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
            CFrame.new(
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.X,
            aK,
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Z
        )
        wait()
    end
    


    TweenSpeed = 333

function topos(aL)
    pcall(function()
        if game:GetService("Players").LocalPlayer and game:GetService("Players").LocalPlayer.Character and game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid") and game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and game:GetService("Players").LocalPlayer.Character.Humanoid.Health > 0 and game:GetService("Players").LocalPlayer.Character.HumanoidRootPart then
            if not TweenSpeed then
                TweenSpeed = 333
            end
            noclip()
            DefualtY = aL.Y
            TargetY = aL.Y
            targetCFrameWithDefualtY = CFrame.new(aL.X, DefualtY, aL.Z)
            targetPos = aL.Position
            oldcframe = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
            Distance = (targetPos - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).Magnitude
            local aM = CheckNearestTeleporter(aL)
            if aM then
                pcall(function()
                        tween:Cancel()
                    end)
                requestEntrance(aM)
            end
            b1 = CFrame.new(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.X,DefualtY,game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Z)
            if IngoreY and (b1.Position - targetCFrameWithDefualtY.Position).Magnitude > 5 then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.X,DefualtY,game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Z)
                local tweenfunc = {}
                local aN = game:service "TweenService"
                local aO =
                    TweenInfo.new((targetPos -game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).Magnitude /TweenSpeed,Enum.EasingStyle.Linear)
                tween = aN:Create(game:GetService("Players").LocalPlayer.Character["HumanoidRootPart"],aO,{CFrame = targetCFrameWithDefualtY})
                tween:Play()
                function tweenfunc:Stop()
                    tween:Cancel()
                end
                tween.Completed:Wait()
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.X,TargetY,game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Z)
            else
                local tweenfunc = {}
                local aN = game:service "TweenService"
                local aO =
                    TweenInfo.new((targetPos -game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).Magnitude /TweenSpeed,Enum.EasingStyle.Linear)
                tween = aN:Create(game:GetService("Players").LocalPlayer.Character["HumanoidRootPart"],aO,{CFrame = aL})
                tween:Play()
                function tweenfunc:Stop()
                    tween:Cancel()
                end
                tween.Completed:Wait()
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =CFrame.new(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.X,TargetY,game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Z)
            end
            if not tween then
                return tween
            end
            return tweenfunc
        end
        unnoclip()
    end)
end

IngoreY = true
Type = 1
spawn(function()
    while wait(.1) do
		if Type == 1 then
			Pos = CFrame.new(0,PosY,-30)
		elseif Type == 2 then
			Pos = CFrame.new(30,PosY,0)
		elseif Type == 3 then
			Pos = CFrame.new(0,PosY,30)	
		elseif Type == 4 then
			Pos = CFrame.new(-30,PosY,0)
        end
        end
    end)

spawn(function()
    while wait(0.5) do
        Type = 1
        wait(0.4)
        Type = 2
        wait(0.3)
        Type = 3
        wait(0.4)
        Type = 4
        wait(0.2)
        Type = 5
        wait(0.3)
    end
end)

spawn(function()
    while wait(.1) do
        Frame = 1
        wait(0.4)
        Frame = 2
        wait(0.4)
        Frame = 3
        wait(0.3)
        Frame = 4
        wait(0.4)
        Frame = 5
        wait(0.3)
    end
end)

Type = 1
spawn(function()
    while wait(.1) do
        if Frame == 1 then
            Check = CFrame.new(0,50,0)
		elseif F == 2 then
			Check = CFrame.new(0,0,-100)
		elseif F == 3 then
			Check = CFrame.new(100,0,0)
		elseif F == 4 then
			Check = CFrame.new(0,0,100)	
		elseif F == 5 then
			Check = CFrame.new(-100,0,0)
		elseif F == 6 then
			Check = CFrame.new(0,50,0)
        end
        end
    end)

spawn(function()
    while wait(.1) do
        F = 1
        wait(0.5)
        F = 2
        wait(0.5)
        F = 3
        wait(0.5)
        F = 4
        wait(0.5)
        F = 5
        wait(0.5)
    end
end)

getgenv().toposs = function(p)
    task.spawn(function()
        pcall(function()
            if game:GetService("Players").LocalPlayer:DistanceFromCharacter(p.Position) <= 250 then 
                game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = p
            elseif not game.Players.LocalPlayer.Character:FindFirstChild("Root")then 
                local K = Instance.new("Part",game.Players.LocalPlayer.Character)
                K.Size = Vector3.new(1,0.5,1)
                K.Name = "Root"
                K.Anchored = true
                K.Transparency = 1
                K.CanCollide = false
                K.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0,20,0)
            end
            local U = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-p.Position).Magnitude
            local z = game:service("TweenService")
            local B = TweenInfo.new((p.Position-game.Players.LocalPlayer.Character.Root.Position).Magnitude/300,Enum.EasingStyle.Linear)
            local S,g = pcall(function()
            local q = z:Create(game.Players.LocalPlayer.Character.Root,B,{CFrame = p})
            q:Play()
        end)
        if not S then 
            return g
        end
        game.Players.LocalPlayer.Character.Root.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
            if S and game.Players.LocalPlayer.Character:FindFirstChild("Root") then 
                pcall(function()
                    if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-p.Position).Magnitude >= 20 then 
                        spawn(function()
                            pcall(function()
                                if (game.Players.LocalPlayer.Character.Root.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 150 then 
                                    game.Players.LocalPlayer.Character.Root.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                                else 
                                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=game.Players.LocalPlayer.Character.Root.CFrame
                                end
                            end)
                        end)
                    elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-p.Position).Magnitude >= 10 and(game.Players.LocalPlayer.Character.HumanoidRootPart.Position-p.Position).Magnitude < 20 then 
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = p
                    elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-p.Position).Magnitude < 10 then 
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = p
                    end
                end)
            end
	    end)
    end)
    end

spawn(function()
        while wait(3) do
                pcall(function()
                    game:GetService("ReplicatedStorage").Remotes.CommE:FireServer("Ken",true)
                end)
        end
    end)    
    
    function InstancePos(pos)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = pos
    end    
    
    game:GetService("Players").LocalPlayer.Idled:connect(function()
        game:GetService("VirtualUser"):Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
        wait(1)
        game:GetService("VirtualUser"):Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
    end) 

function getBlueGear()
    local mysticIsland = game.workspace.Map:FindFirstChild("MysticIsland")
    if mysticIsland then
        for _, v in pairs(mysticIsland:GetChildren()) do
            if v:IsA("MeshPart") and v.MeshId == "rbxassetid://10153114969" then
                return v
            end
        end
    end
    return nil
end

function InMi()
    if not game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then return false end
    for _, v in pairs(game:GetService("Workspace")._WorldOrigin.Locations:GetChildren()) do
        if v.Name == "Mirage Island" then
            if (game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position - v.Position).Magnitude < 500 then
                return true
            end
        end
    end
    return false
end

function pull()
    local pul = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("RaceV4Progress", "Check")
    if pul == 1 then
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("RaceV4Progress", "Check")
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("RaceV4Progress", "Begin")
    elseif pul == 2 then
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("RaceV4Progress", "Check")
        repeat wait()
            topos(CFrame.new(3028, 2281, -7325))
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("RaceV4Progress", "Teleport")
        until (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(28286.35546875, 14896.5078125, 102.62469482421875)).Magnitude <= 15
    elseif pul == 3 then
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("RaceV4Progress", "Check")
        wait(1)
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("RaceV4Progress", "Continue")
    end
end

local PlayerName = game.Players.LocalPlayer.DisplayName
require(game.ReplicatedStorage.Notification).new("<Color=Red>" ..PlayerName.. "<Color=/>"):Display()

--//macdinh 
local Players = game:GetService("Players")
local playerCount = #game:GetService("Players"):GetPlayers()
local placeId = game.PlaceId
local jobId = game.JobId

PosY = 45
AutoHaki()

function StopTween(target)
        if not target then
        _G.StopTween = true
        wait()
        topos(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame)
        wait()
        unnoclip()
        _G.StopTween = false
        _G.Clip = false
        end
        end

function GetDistance(q)
    if type(q) == "instance" then
        if Instance:IsA("BasePart") or Instance:IsA("Part") then
            return (q.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
        elseif Instance:FindFirstChild("HumanoidRootPart") then
            return (q.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
        else
            for r, v in pairs(q:GetDescendants()) do
                if v:IsA("BasePart") or v:IsA("Part") then
                    return (v.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
                end
            end
        end
    else
        return (q - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
    end
end

function useSkill(skillKey)
    game:GetService("VirtualInputManager"):SendKeyEvent(true, skillKey, false, game)
    game:GetService("VirtualInputManager"):SendKeyEvent(false, skillKey, false, game)
end

function removeInteriorLava()
    local interiorLavaModel = game.Workspace.Map.PrehistoricIsland.Core:FindFirstChild("InteriorLava")
    if interiorLavaModel and interiorLavaModel:IsA("Model") then
        interiorLavaModel:Destroy()
    end
end

local TrollApi = loadstring(game:HttpGet("https://raw.githubusercontent.com/PorryDepTrai/exploit/main/SimpleTroll.lua"))()

local function decode(job)
    return TrollApi["Decode JobId API Porry | discord.gg/umaru | MB KHOI"](job, "discord.gg/umaru | MB_Bank 9929992999 Phan Dat Khoi")
end

local apiUrls = {
    dark = "https://hostserver.porry.store/bloxfruit/bot/JobId/darkbread",
    mochi = "https://hostserver.porry.store/bloxfruit/bot/JobId/doughking",
    rip = "https://hostserver.porry.store/bloxfruit/bot/JobId/indra",
    mirage = "https://hostserver.porry.store/bloxfruit/bot/JobId/mirage"
}

local dataFolder = "Lion Hub"
local jobIdFilePath = dataFolder.."/Jobid.txt"

if not isfolder(dataFolder) then
    makefolder(dataFolder)
end

local TELEPORT_RETRY_DELAY = 3
local MAX_STORED_JOBIDS = 10

local function writeJobId(jobId)
    local jobIds = {}
    
    if isfile(jobIdFilePath) then
        local success, content = pcall(function()
            return readfile(jobIdFilePath)
        end)
        
        if success and content ~= "" then
            local success2, decoded = pcall(function()
                return game:GetService("HttpService"):JSONDecode(content)
            end)
            
            if success2 and type(decoded) == "table" then
                jobIds = decoded
            end
        end
    end
    
    for i, id in ipairs(jobIds) do
        if id == jobId then
            table.remove(jobIds, i)
            break
        end
    end
    
    table.insert(jobIds, 1, jobId)
    
    if #jobIds > MAX_STORED_JOBIDS then
        table.remove(jobIds, MAX_STORED_JOBIDS + 1)
    end
    
    pcall(function()
        writefile(jobIdFilePath, game:GetService("HttpService"):JSONEncode(jobIds))
    end)
end

local function isJobIdUsed(jobId)
    if not isfile(jobIdFilePath) then
        return false
    end
    
    local success, content = pcall(function()
        return readfile(jobIdFilePath)
    end)
    
    if not success or content == "" then
        return false
    end
    
    local success2, jobIds = pcall(function()
        return game:GetService("HttpService"):JSONDecode(content)
    end)
    
    if not success2 or type(jobIds) ~= "table" then
        return false
    end
    
    for _, id in ipairs(jobIds) do
        if id == jobId then
            return true
        end
    end
    
    return false
end

local function scrapeAPI(apiUrl)
    local success, response
    
    for attempt = 1, 3 do
        success, response = pcall(function()
            return request({
                Url = apiUrl,
                Method = "GET",
                Headers = {
                    ["User-Agent"] = "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36",
                    ["X-Request-ID"] = tostring(math.random(1000000, 9999999)),
                    ["X-Session-ID"] = tostring(os.time()) .. "-" .. tostring(math.random(1000, 9999))
                }
            })
        end)
        
        if success and response and response.Success then
            break
        end
        
        wait(1)
    end
    
    if not success or not response or not response.Success then
        return nil
    end
    
    local success2, data = pcall(function()
        return game:GetService("HttpService"):JSONDecode(response.Body)
    end)
    
    if not success2 or type(data) ~= "table" then
        return nil
    end
    
    if data.Amount and data.Amount > 0 and data.JobId then
        local jobIds = {}
        
        for _, jobData in ipairs(data.JobId) do
            if type(jobData) == "table" then
                for jobId, _ in pairs(jobData) do
                    local keyName = nil
                    
                    for k, _ in pairs(jobData) do
                        if type(k) == "string" and k:find("Porry") then
                            keyName = k
                            break
                        end
                    end
                    
                    if keyName then
                        if not isJobIdUsed(keyName) then
                            table.insert(jobIds, keyName)
                        end
                    elseif not isJobIdUsed(jobId) then
                        table.insert(jobIds, jobId)
                    end
                end
            end
        end
        
        return jobIds
    end
    
    return nil
end

local function HopB(apiKey)
    if not apiUrls[apiKey] then
        return
    end
    
    local jobIds = scrapeAPI(apiUrls[apiKey])
    
    if not jobIds or #jobIds == 0 then
        return
    end
    
    local teleportSuccess = false
    
    for _, jobId in ipairs(jobIds) do
        if teleportSuccess then
            break
        end
        
        local decodedJob
        
        local success, result = pcall(function()
            return decode(jobId)
        end)
        
        if success and result then
            decodedJob = result
            writeJobId(jobId)
            
            local teleportSuccess, teleportError = pcall(function()
                game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, decodedJob, game.Players.LocalPlayer)
            end)
            
            if teleportSuccess then
                teleportSuccess = true
                break
            end
            
            wait(TELEPORT_RETRY_DELAY)
        end
    end
    
    if not teleportSuccess then
        wait(5)
    end
end

function Hophi()
    SetUi("on", "Hopping")

    local PlaceID = game.PlaceId
    local AllIDs = {}
    local foundAnything = ""
    local actualHour = os.date("!*t").hour
    local isTeleporting = false

    local function handleErrorPrompt(v)
        if v.Name == "ErrorPrompt" then
            if v.Visible and v.TitleFrame.ErrorTitle.Text == "Teleport Failed" then
                v.Visible = false
            end
            v:GetPropertyChangedSignal("Visible"):Connect(function()
                if v.Visible and v.TitleFrame.ErrorTitle.Text == "Teleport Failed" then
                    v.Visible = false
                end
            end)
        end
    end

    for _, v in pairs(game.CoreGui.RobloxPromptGui.promptOverlay:GetChildren()) do
        handleErrorPrompt(v)
    end
    game.CoreGui.RobloxPromptGui.promptOverlay.ChildAdded:Connect(handleErrorPrompt)

    local function TPReturner()
        if isTeleporting then return end

        local url = ("https://games.roblox.com/v1/games/%s/servers/Public?sortOrder=Desc&excludeFullGames=true&limit=100&cursor=%s"):format(PlaceID, foundAnything)
        local success, Site = pcall(function()
            return game.HttpService:JSONDecode(game:HttpGet(url))
        end)

        if not success then
            task.wait(8)
            return
        end

        if Site.nextPageCursor and Site.nextPageCursor ~= "null" then
            foundAnything = Site.nextPageCursor
        else
            foundAnything = ""
        end

        for _, v in pairs(Site.data) do
            local ID = tostring(v.id)
            local Possible = true

            if tonumber(v.maxPlayers) > tonumber(v.playing) then
                for _, Existing in pairs(AllIDs) do
                    if ID == tostring(Existing) then
                        Possible = false
                    end
                end

                if Possible then
                    table.insert(AllIDs, ID)
                    isTeleporting = true
                    pcall(function()
                        game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceID, ID, game:GetService("Players").LocalPlayer)
                    end)
                    task.wait(1)
                    isTeleporting = false
                    return
                end
            end
        end
    end

    local function Teleport()
        while task.wait(3) do
            pcall(TPReturner)
        end
    end

    Teleport()
end

function Hop()
    SetUi("on", "Hopping")

    local PlaceID = game.PlaceId
    local AllIDs = {}
    local isTeleporting = false
    local foundAnything = ""

    local function handleErrorPrompt(v)
        if v.Name == "ErrorPrompt" then
            if v.Visible and v.TitleFrame.ErrorTitle.Text == "Teleport Failed" then
                v.Visible = false
            end
            v:GetPropertyChangedSignal("Visible"):Connect(function()
                if v.Visible and v.TitleFrame.ErrorTitle.Text == "Teleport Failed" then
                    v.Visible = false
                end
            end)
        end
    end

    for _, v in pairs(game.CoreGui.RobloxPromptGui.promptOverlay:GetChildren()) do
        handleErrorPrompt(v)
    end
    game.CoreGui.RobloxPromptGui.promptOverlay.ChildAdded:Connect(handleErrorPrompt)

    local function TPReturner()
        if isTeleporting then return end
        local url = ("https://games.roblox.com/v1/games/%s/servers/Public?sortOrder=Asc&limit=100&cursor=%s"):format(PlaceID, foundAnything)
        local success, Site = pcall(function()
            return game.HttpService:JSONDecode(game:HttpGet(url))
        end)
        if not success then
            task.wait(5)
            return
        end
        if Site.nextPageCursor and Site.nextPageCursor ~= "null" then
            foundAnything = Site.nextPageCursor
        else
            foundAnything = ""
        end
        for _, v in pairs(Site.data) do
            local ID = tostring(v.id)
            local Possible = true
            if tonumber(v.playing) < tonumber(v.maxPlayers) and tonumber(v.playing) > 0 then
                for _, Existing in pairs(AllIDs) do
                    if ID == tostring(Existing) then
                        Possible = false
                        break
                    end
                end
                if Possible then
                    table.insert(AllIDs, ID)
                    isTeleporting = true
                    pcall(function()
                        game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceID, ID, game:GetService("Players").LocalPlayer)
                    end)
                    task.wait(1)
                    isTeleporting = false
                    return
                end
            end
        end
    end

    local function Teleport()
        while task.wait(2) do
            pcall(TPReturner)
        end
    end

    Teleport()
end

function KillBoss(boss)
    local B = CheckBoss(boss)
    if B then
        repeat wait(0.1)
            AutoHaki()
            EquipWeapon(_G.SelectWeapon)
            topos(B.HumanoidRootPart.CFrame * CFrame.new(0, 20, 0))
        until not B.Parent or B.Humanoid.Health <= 0
    end
end

--//Gui
game.StarterGui:SetCore("SendNotification", {
      Icon = "";
      Title = "Lion Hub", 
      Text = "Complete !";
})                           

require(game.ReplicatedStorage.Util.CameraShaker):Stop()

for i, v in pairs(game.CoreGui:GetChildren()) do
	if v:IsA("ScreenGui") and v.Name == "Lio" then
		v:Destroy()
	end
end

local ScreenGui = Instance.new("ScreenGui")
local ImageButton = Instance.new("ImageButton")

ScreenGui.Parent = game.CoreGui
ScreenGui.Name = "Lio"

ImageButton.Parent = ScreenGui
ImageButton.AnchorPoint = Vector2.new(0.5, 0.5)
ImageButton.BackgroundColor3 = Color3.new(1, 1, 1)
ImageButton.BackgroundTransparency = 1
ImageButton.BorderColor3 = Color3.new(0, 0, 0)
ImageButton.BorderSizePixel = 0
ImageButton.Position = UDim2.new(0.120833337, 0, 0.0952890813, 0)
ImageButton.Size = UDim2.new(0, 60, 0, 60)
ImageButton.Image = "rbxassetid://123709024751036"
ImageButton.Draggable = true

ImageButton.MouseButton1Down:Connect(function()
    game:GetService("VirtualInputManager"):SendKeyEvent(true, Enum.KeyCode.LeftControl, false, game)
end)

local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()

local Window = Fluent:CreateWindow({
	Title = "Lion Hub [ Free ]",
	SubTitle = "| https://discord.gg/pGn6xsmfSg",
	TabWidth = 180,
	Size = UDim2.fromOffset(550, 400),
	Acrylic = false,
	Theme = "Darker",
	MinimizeKey = Enum.KeyCode.LeftControl
})

local Tabs = { 
	General = Window:AddTab({
		Title = "General",
		Icon = "home"
	}),
	Status = Window:AddTab({
    	Title = "Status",
	    Icon = "bar-chart"
    }),
	Quest = Window:AddTab({
		Title = "Quest",
		Icon = "flag"
	}),
	Volcano = Window:AddTab({
		Title = "Volcano",
		Icon = "flame"
	}),
	PVP = Window:AddTab({
		Title = "PVP & Visual",
		Icon = "crosshair"
	}),
	DevilFruit = Window:AddTab({
		Title = "Devil Fruit",
		Icon = "apple"
	}),
	Dungeon = Window:AddTab({
		Title = "Dungeon",
		Icon = "layers"
	}),
	Travel = Window:AddTab({
		Title = "Travel",
		Icon = "map"
	}),
	RaceV4 = Window:AddTab({
		Title = "Race V4",
		Icon = "user-cog"
	}),
	SeaEvent = Window:AddTab({
		Title = "Sea Event",
		Icon = "cloud-drizzle"
	}),
	Shop = Window:AddTab({
		Title = "Shop",
		Icon = "shopping-bag"
	}),
	Webhook = Window:AddTab({
		Title = "Webhook",
		Icon = "share-2"
	}),
	Settings = Window:AddTab({
		Title = "Settings",
		Icon = "settings"
	}),
	Misc = Window:AddTab({
		Title = "Misc",
		Icon = "more-horizontal"
	})
}

local Options = Fluent.Options

local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()
SaveManager:SetLibrary(Fluent)
InterfaceManager:SetLibrary(Fluent) 
SaveManager:IgnoreThemeSettings() 
SaveManager:SetIgnoreIndexes({}) 
InterfaceManager:SetFolder("Lion Hub [ Pre ]")
SaveManager:SetFolder("Lion Hub")
InterfaceManager:BuildInterfaceSection(Tabs.Settings)
SaveManager:BuildConfigSection(Tabs.Settings)

FullMoon = Tabs.Status:AddParagraph({
    Title = "Moon",
    Content = ""
})

task.spawn(function()
    while task.wait(2) do
        pcall(function()
            local sky = game:GetService("Lighting").Sky
            if sky.MoonTextureId == "http://www.roblox.com/asSetDesc/?id=9709149431" then
                FullMoon:SetDesc("[ 🌕 ] Full Moon 100%")
            elseif sky.MoonTextureId == "http://www.roblox.com/asset/?id=9709149052" then
                FullMoon:SetDesc("[ 🌖 ] Moon 75%")
            elseif sky.MoonTextureId == "http://www.roblox.com/asset/?id=9709143733" then
                FullMoon:SetDesc("[ 🌗 ] Moon 50%")
            elseif sky.MoonTextureId == "http://www.roblox.com/asset/?id=9709150401" then
                FullMoon:SetDesc("[ 🌘 ] Moon 25%")
            elseif sky.MoonTextureId == "http://www.roblox.com/asset/?id=9709149680" then
                FullMoon:SetDesc("[ 🌘 ] Moon 15%")
            else
                FullMoon:SetDesc("Wait For Moon")
            end
        end)
    end
end)

Elite = Tabs.Status:AddParagraph({
    Title = "Elite",
    Content = ""
})

spawn(function()
    while wait(2) do
        spawn(function()
            if CheckBoss("Diablo") then
                Elite:SetDesc("[ 👷 ] Diablo Spawn")
            elseif CheckBoss("Deandre") then
                Elite:SetDesc("[ 👷 ] Deandre Spawn")
            elseif CheckBoss("Urban") then
                Elite:SetDesc("[ 👷 ] Urban Spawn")
            else
                Elite:SetDesc("Elite: Not Found")
            end
        end)
    end
end)

Mob_Kill_Cake_Prince = Tabs.Status:AddParagraph({
    Title = "Mob Kill Cake Prince",
    Content = ""
})

spawn(function()
    while wait(5) do
        pcall(function()
            local result = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner")
            local text = ""
            if string.len(result) == 88 then
                text = text .. "Defeat : " .. string.sub(result, 39, 41)
            elseif string.len(result) == 87 then
                text = text .. "Defeat : " .. string.sub(result, 39, 40)
            elseif string.len(result) == 86 then
                text = text .. "Defeat : " .. string.sub(result, 39, 39)
            else
                text = text .. "Boss Is Spawning"
            end
            Mob_Kill_Cake_Prince:SetDesc(text)
        end)
    end
end)

Eye = Tabs.Status:AddParagraph({
    Title = "Summon Tyrant Boss Status",
    Content = ""
})

task.spawn(function()
    while task.wait(3) do
        if World3 then
            local eyes = {
                workspace.Map.TikiOutpost.IslandModel.Eye1,
                workspace.Map.TikiOutpost.IslandModel.Eye2,
                workspace.Map.TikiOutpost.IslandModel.IslandChunks.E.Eye3,
                workspace.Map.TikiOutpost.IslandModel.IslandChunks.E.Eye4
            }
            local act = 0
            for _, eye in ipairs(eyes) do
                if eye.Transparency == 0 then
                    act = act + 1
                end
            end
            Eye:SetDesc("Eyes: " .. act)
        else
            Eye:SetDesc("Eyes: 0")
        end
        task.wait(2)
    end
end)

BerryLabel = Tabs.Status:AddParagraph({
    Title = "Berries",
    Content = ""
})

spawn(function()
    while wait(6) do
        pcall(function()
            local CollectionService = game:GetService("CollectionService")
            local BerryBushes = CollectionService:GetTagged("BerryBush")
            local BerryList = {}
            for _, Bush in pairs(BerryBushes) do
                for _, Berry in pairs(Bush:GetAttributes()) do
                    if Berry then
                        table.insert(BerryList, Berry)
                    end
                end
            end
            BerryLabel:SetDesc(next(BerryList) and table.concat(BerryList, ", ") or "None")
        end)
    end
end)

FindFruit = Tabs.Status:AddParagraph({
    Title = "🍏 Fruit",
    Content = ""
})

spawn(function()
    while wait(1) do
        pcall(function()
            local found = false
            for _, v in pairs(game.Workspace:GetChildren()) do
                if string.find(v.Name, "Fruit") then
                    text = "🍍 Fruit Found: " .. v.Name
                    found = true
                    break
                end
            end
            if not found then
                text = "🍎 No Fruit Found"
            end
            FindFruit:SetDesc(text)
        end)
    end
end)

Mirage = Tabs.Status:AddParagraph({
    Title = "Mirage Island",
    Content = ""
})

spawn(function()
    while wait(5) do
        pcall(function()
            if game.Workspace._WorldOrigin.Locations:FindFirstChild("Mirage Island") then
                Mirage:SetDesc("🏝 Mirage Island: ✅")
            else
                Mirage:SetDesc("🏝 Mirage Island: ❌")
            end
        end)
    end
end)

PreHis = Tabs.Status:AddParagraph({
    Title = "Prehistoric Island",
    Content = ""
})

spawn(function()
    while wait(5) do
        pcall(function()
            if game:GetService("Workspace").Map:FindFirstChild("PrehistoricIsland") then
                PreHis:SetDesc("🦕 Prehistoric Island: ✅")
            else
                PreHis:SetDesc("🦕 Prehistoric Island: ❌")
            end
        end)
    end
end)

Kitsune = Tabs.Status:AddParagraph({
    Title = "Kitsune Island",
    Content = ""
})

spawn(function()
    while wait(5) do
        pcall(function()
            if game:GetService("Workspace").Map:FindFirstChild("KitsuneIsland") then
                Kitsune:SetDesc("🦊 Kitsune Island: ✅")
            else
                Kitsune:SetDesc("🦊 Kitsune Island: ❌")
            end
        end)
    end
end)

Frozen = Tabs.Status:AddParagraph({
    Title = "Frozen Dimension",
    Content = ""
})

spawn(function()
    while wait(5) do
        pcall(function()
            if game.Workspace._WorldOrigin.Locations:FindFirstChild("Frozen Dimension") then
                Frozen:SetDesc("❄️ Frozen Dimension: ✅")
            else
                Frozen:SetDesc("❄️ Frozen Dimension: ❌")
            end
        end)
    end
end)

--//General
DropdownSelectWeapon = Tabs.General:AddDropdown("DropdownSelectWeapon", {
    Title = "Select Weapon",
    Values = {'Melee', 'Sword', 'Blox Fruit', 'Gun'},
    Multi = false,
    Default = 1
})
DropdownSelectWeapon:SetValue('Melee')

DropdownSelectWeapon:OnChanged(function(Value)
    _G.SelectWeapon = Value
end)
task.spawn(function()
    while wait(1) do
        pcall(function()
            for _, item in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                if item.ToolTip == _G.SelectWeapon then
                    if game.Players.LocalPlayer.Backpack:FindFirstChild(item.Name) then
                        _G.SelectWeapon = item.Name
                    end
                end
            end
        end)
    end
end)

Tabs.General:AddSection("Switch Sword")

function DetectSwordUnlock()
    local maxRarity = 0
    local swordName = nil
    for i, item in pairs(game.ReplicatedStorage.Remotes.CommF_:InvokeServer("getInventory")) do
        if item.Type == "Sword" and item.MasteryRequirements["X"] > item.Mastery then
            if maxRarity < item.Rarity then
                maxRarity = item.Rarity
                swordName = item.Name
            end
        end
    end
    return swordName
end

SwitchLevel = Tabs.General:AddDropdown("SwitchLevel", {
    Title = "Select Mastery Level For Switch",
    Values = {'350', '600'},
    Multi = false,
    Default = 1
})
SwitchLevel:SetValue('350')
SwitchLevel:OnChanged(function(Value)
    _G.SetSwitch = tonumber(Value)
end)

AutoSwitch = Tabs.General:AddToggle("AutoSwitch", {
    Title = "Auto Switch Sword",
    Default = false
})
AutoSwitch:OnChanged(function(Value)
    _G.AutoSwitchSword = Value
end)

spawn(function()
    while task.wait() do
        pcall(function()
            if not game.Players.LocalPlayer.Character or not game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then return end
            if _G.AutoSwitchSword then
                local switchThreshold = _G.SetSwitch or 350 
                local currentSword = nil
                if game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool") then
                    currentSword = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool").Name
                end
                if currentSword then
                    local swordInfo = nil
                    for i, item in pairs(game.ReplicatedStorage.Remotes.CommF_:InvokeServer("getInventory")) do
                        if item.Type == "Sword" and item.Name == currentSword then
                            swordInfo = item
                            break
                        end
                    end
                    if swordInfo then
                        local masteryLevel = swordInfo.Mastery
                        if masteryLevel >= switchThreshold then
                            local newSword = DetectSwordUnlock()
                            if newSword and newSword ~= currentSword and not game.Players.LocalPlayer.Backpack:FindFirstChild(newSword) and not game.Players.LocalPlayer.Character:FindFirstChild(newSword) then
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("LoadItem", newSword)
                            end
                        end
                    end
                else
                    local newSword = DetectSwordUnlock()
                    if newSword and not game.Players.LocalPlayer.Backpack:FindFirstChild(newSword) and not game.Players.LocalPlayer.Character:FindFirstChild(newSword) then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("LoadItem", newSword)
                    end
                end
            end
        end)
    end
end)

Tabs.General:AddSection("Normal Farm")

spawn(function()
    pcall(function()
        while task.wait(0.1) do
            if _G.AutoFarm and World2 and _G.SelectFarm == "Ectoplasm" then
                local char = game.Players.LocalPlayer.Character
                if not char or not char:FindFirstChild("HumanoidRootPart") then return end
                if game:GetService("Workspace").Enemies:FindFirstChild("Ship Deckhand") or game:GetService("Workspace").Enemies:FindFirstChild("Ship Engineer") or game:GetService("Workspace").Enemies:FindFirstChild("Ship Steward") or game:GetService("Workspace").Enemies:FindFirstChild("Ship Officer") then
                    for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if (v.Name == "Ship Deckhand" or v.Name == "Ship Engineer" or v.Name == "Ship Steward" or v.Name == "Ship Officer") and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                            if (char.HumanoidRootPart.Position - v.HumanoidRootPart.Position).Magnitude <= 900 then
                                repeat task.wait()
                                    AutoHaki()
                                    EquipWeapon(_G.SelectWeapon)
                                    topos(v.HumanoidRootPart.CFrame * CFrame.new(0, 20, 0))
                                    MonFarm = v.Name
                                    PosMon = v.HumanoidRootPart.CFrame
                                    StartBring = true
                                    sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
                                until not _G.AutoFarm or not v.Parent or v.Humanoid.Health <= 0
                                StartBring = false
                            end
                        end
                    end
                    for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if (v.Name == "Ship Deckhand" or v.Name == "Ship Engineer" or v.Name == "Ship Steward" or v.Name == "Ship Officer") and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                            repeat task.wait()
                                AutoHaki()
                                EquipWeapon(_G.SelectWeapon)
                                topos(v.HumanoidRootPart.CFrame * CFrame.new(0, 20, 0))
                                MonFarm = v.Name
                                PosMon = v.HumanoidRootPart.CFrame
                                StartBring = true
                                sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
                            until not _G.AutoFarm or not v.Parent or v.Humanoid.Health <= 0
                            StartBring = false
                        end
                    end
                else
                    local entrancePos = Vector3.new(923.213, 126.976, 32852.832)
                    if (char.HumanoidRootPart.Position - entrancePos).Magnitude > 1500 then
                        topos(CFrame.new(entrancePos))
                        task.wait(1)
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", entrancePos)
                    else
                        topos(CFrame.new(entrancePos))
                    end
                end
            end
        end
    end)
end)

task.spawn(function()
    while task.wait(0.1) do
        if _G.AutoFarm then
            pcall(function()
                local player = game:GetService("Players").LocalPlayer
                if not player.Character or not player.Character:FindFirstChild("HumanoidRootPart") then return end

                if _G.SelectFarm == "Level" then
                    local QuestTitle = player.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text
                    CheckQuest()
                    if not string.find(QuestTitle, NameMon) then
                        StartMagnet = false
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
                    end

                    if not player.PlayerGui.Main.Quest.Visible then
                        StartMagnet = false
                        if BypassTP and (player.Character.HumanoidRootPart.Position - CFrameQuest.Position).Magnitude > 1500 then
                            BTP(CFrameQuest)
                        else
                            topos(CFrameQuest)
                        end
                        if (player.Character.HumanoidRootPart.Position - CFrameQuest.Position).Magnitude <= 20 then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", NameQuest, LevelQuest)
                        end
                    elseif player.PlayerGui.Main.Quest.Visible then
                        local monName = string.find(QuestTitle, "kissed") and "kissed Warrior" or Mon
                        if game:GetService("Workspace").Enemies:FindFirstChild(monName) then
                            for _, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                if v.Name == monName and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                                    if string.find(QuestTitle, NameMon) then
                                        repeat task.wait()
                                            EquipWeapon(_G.SelectWeapon)
                                            AutoHaki()
                                            PosMon = v.HumanoidRootPart.CFrame
                                            topos(v.HumanoidRootPart.CFrame * CFrame.new(0, 20, 0))
                                            MonFarm = v.Name
                                            StartMagnet = true
                                            StartBring = true
                                        until not _G.AutoFarm or v.Humanoid.Health <= 0 or not v.Parent or not player.PlayerGui.Main.Quest.Visible
                                        StartMagnet = false
                                        StartBring = false
                                    else
                                        StartMagnet = false
                                        StartBring = false
                                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
                                    end
                                end
                            end
                        else
                            topos(CFrameMon)
                            StartMagnet = false
                            StartBring = false
                            if game:GetService("ReplicatedStorage"):FindFirstChild(Mon) then
                                topos(game:GetService("ReplicatedStorage"):FindFirstChild(Mon).HumanoidRootPart.CFrame * CFrame.new(0, 20, 0))
                            end
                        end
                    end

                elseif _G.SelectFarm == "Nearest" then
                    local closestEnemy = nil
                    local shortestDistance = 10000
                    for _, enemy in pairs(game.Workspace.Enemies:GetChildren()) do
                        if enemy:FindFirstChild("Humanoid") and enemy:FindFirstChild("HumanoidRootPart") and enemy.Humanoid.Health > 0 then
                            local distance = (player.Character.HumanoidRootPart.Position - enemy.HumanoidRootPart.Position).Magnitude
                            if distance <= 500 then
                                closestEnemy = enemy
                                shortestDistance = distance
                                break
                            elseif distance < shortestDistance then
                                closestEnemy = enemy
                                shortestDistance = distance
                            end
                        end
                    end
                    
                    if closestEnemy then
                        repeat 
                            if not _G.AutoFarm then 
                                StartBring = false
                                return 
                            end
                            
                            task.wait()
                            StartBring = true
                            AutoHaki()
                            EquipWeapon(_G.SelectWeapon)
                            topos(closestEnemy.HumanoidRootPart.CFrame * CFrame.new(0, 20, 0))
                            PosMon = closestEnemy.HumanoidRootPart.CFrame
                            MonFarm = closestEnemy.Name
                        until not closestEnemy.Parent or closestEnemy.Humanoid.Health <= 0 or not game.Workspace.Enemies:FindFirstChild(closestEnemy.Name)
                        StartBring = false
                    end

                elseif _G.SelectFarm == "Bones" and not _G.GetQuest and World3 then
                    local BonePos = CFrame.new(-9506.234375, 172.130615234375, 6117.0771484375)
                    local BoneQuest = CFrame.new(-9479.2168, 141.215088, 5566.09277, 0, 0, 1, 0, 1, -0, -1, 0, 0)
                    local boneMobsList = {"Reborn Skeleton", "Living Zombie", "Demonic Soul", "Posessed Mummy"}
                    local nearbyMob

                    if game:GetService("Workspace").Enemies:FindFirstChild("Soul Reaper") then
                        for _, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if v.Name == "Soul Reaper" and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                repeat task.wait()
                                    AutoHaki()
                                    EquipWeapon(_G.SelectWeapon)
                                    topos(v.HumanoidRootPart.CFrame * CFrame.new(0, 20, 0))
                                    sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
                                until not _G.AutoFarm or not v.Parent or v.Humanoid.Health <= 0
                            end
                        end
                    else
                        for _, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if table.find(boneMobsList, v.Name) and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                if (player.Character.HumanoidRootPart.Position - v.HumanoidRootPart.Position).Magnitude <= 300 then
                                    nearbyMob = v
                                    break
                                end
                            end
                        end

                        if nearbyMob then
                            repeat task.wait()
                                AutoHaki()
                                EquipWeapon(_G.SelectWeapon)
                                StartBring = true
                                MonFarm = nearbyMob.Name
                                PosMon = nearbyMob.HumanoidRootPart.CFrame
                                topos(nearbyMob.HumanoidRootPart.CFrame * CFrame.new(0, 20, 0))
                            until not _G.AutoFarm or not nearbyMob.Parent or nearbyMob.Humanoid.Health <= 0
                            StartBring = false
                        else
                            for _, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                if table.find(boneMobsList, v.Name) and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                    repeat task.wait()
                                        AutoHaki()
                                        EquipWeapon(_G.SelectWeapon)
                                        StartBring = true
                                        MonFarm = v.Name
                                        PosMon = v.HumanoidRootPart.CFrame
                                        topos(v.HumanoidRootPart.CFrame * CFrame.new(0, 20, 0))
                                    until not _G.AutoFarm or not v.Parent or v.Humanoid.Health <= 0
                                    StartBring = false
                                    break
                                end
                            end
                            if not game:GetService("Workspace").Enemies:FindFirstChild("Reborn Skeleton") and not game:GetService("Workspace").Enemies:FindFirstChild("Living Zombie") and not game:GetService("Workspace").Enemies:FindFirstChild("Demonic Soul") and not game:GetService("Workspace").Enemies:FindFirstChild("Posessed Mummy") then
                                if BypassTP and (player.Character.HumanoidRootPart.Position - BonePos.Position).Magnitude > 1500 then
                                    BTP(BonePos)
                                else
                                    topos(BonePos)
                                end
                            end
                        end
                    end

                elseif _G.SelectFarm == "Katakuri" and not _G.GetQuest and World3 then
                    local CakePos = CFrame.new(-2091.911865234375, 70.00884246826172, -12142.8359375)
                    local CakeQuest = CFrame.new(-1927.91602, 37.7981339, -12842.5391, -0.96804446, 4.22142143e-08, 0.250778586, 4.74911062e-08, 1, 1.49904711e-08, -0.250778586, 2.64211941e-08, -0.96804446)
                    local kataMobsList = {"Cookie Crafter", "Cake Guard", "Baking Staff", "Head Baker"}
                    local nearbyMob

                    if game:GetService("Workspace").Enemies:FindFirstChild("Cake Prince") or (game:GetService("Workspace").Map.CakeLoaf.BigMirror:FindFirstChild("Other") and game:GetService("Workspace").Map.CakeLoaf.BigMirror.Other.Transparency == 0 and (player.Character.HumanoidRootPart.Position - Vector3.new(-1990.673, 4533.000, -14973.675)).Magnitude >= 500) then
                        topos(CFrame.new(-2151.822, 149.316, -12404.905))
                        task.wait(4)
                        for _, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if (v.Name == "Cake Prince" or v.Name == "Dough King") and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                repeat task.wait()
                                    AutoHaki()
                                    EquipWeapon(_G.SelectWeapon)
                                    if game:GetService("Workspace")["_WorldOrigin"]:FindFirstChild("Ring") or game:GetService("Workspace")["_WorldOrigin"]:FindFirstChild("Fist") or game:GetService("Workspace")["_WorldOrigin"]:FindFirstChild("MochiSwirl") then
                                        topos(v.HumanoidRootPart.CFrame * CFrame.new(0, -40, 0))
                                    else
                                        topos(v.HumanoidRootPart.CFrame * CFrame.new(0, 15, 0))
                                    end
                                    sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
                                until not _G.AutoFarm or not v.Parent or v.Humanoid.Health <= 0
                            end
                        end
                    else
                        for _, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if table.find(kataMobsList, v.Name) and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                if (player.Character.HumanoidRootPart.Position - v.HumanoidRootPart.Position).Magnitude <= 300 then
                                    nearbyMob = v
                                    break
                                end
                            end
                        end

                        if nearbyMob then
                            repeat task.wait()
                                AutoHaki()
                                EquipWeapon(_G.SelectWeapon)
                                topos(nearbyMob.HumanoidRootPart.CFrame * CFrame.new(0, 20, 0))
                                PosMon = nearbyMob.HumanoidRootPart.CFrame
                                MonFarm = nearbyMob.Name
                                StartBring = true
                            until not _G.AutoFarm or not nearbyMob.Parent or nearbyMob.Humanoid.Health <= 0 or game:GetService("Workspace").Enemies:FindFirstChild("Cake Prince") or game:GetService("Workspace").Enemies:FindFirstChild("Dough King")
                            StartBring = false
                        else
                            for _, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                if table.find(kataMobsList, v.Name) and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                    repeat task.wait()
                                        AutoHaki()
                                        EquipWeapon(_G.SelectWeapon)
                                        topos(v.HumanoidRootPart.CFrame * CFrame.new(0, 20, 0))
                                        PosMon = v.HumanoidRootPart.CFrame
                                        MonFarm = v.Name
                                        StartBring = true
                                    until not _G.AutoFarm or not v.Parent or v.Humanoid.Health <= 0 or game:GetService("Workspace").Enemies:FindFirstChild("Cake Prince") or game:GetService("Workspace").Enemies:FindFirstChild("Dough King")
                                    StartBring = false
                                    break
                                end
                            end
                            if not game:GetService("Workspace").Enemies:FindFirstChild("Cookie Crafter") and not game:GetService("Workspace").Enemies:FindFirstChild("Cake Guard") and not game:GetService("Workspace").Enemies:FindFirstChild("Baking Staff") and not game:GetService("Workspace").Enemies:FindFirstChild("Head Baker") then
                                if BypassTP and (player.Character.HumanoidRootPart.Position - CakePos.Position).Magnitude > 1500 then
                                    BTP(CakePos)
                                else
                                    topos(CakePos)
                                end
                            end
                        end
                    end
                end
            end)
        end
    end
end)


local BoneQuestPos = CFrame.new(-9516.99316, 172.017181, 6078.46533, 0, 0, -1, 0, 1, 0, 1, 0, 0)
local CakeQuestPos = CFrame.new(-2021.32007, 37.7982254, -12028.7295, 0.957576931, -8.80302053e-08, 0.288177818, 6.9301187e-08, 1, 7.51931211e-08, -0.288177818, -5.2032135e-08, 0.957576931)

spawn(function()
    while task.wait() do
        if _G.SelectFarm == "Bones" and _G.AutoFarm and _G.GetQuest and World3 then
            pcall(function()
                if not game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible then
                    StartBring = false
                    if BypassTP and (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - BoneQuestPos.Position).Magnitude > 1500 then
                        BTP(BoneQuestPos)
                    else
                        topos(BoneQuestPos)
                    end
                    if (BoneQuestPos.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 3 then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", "HauntedQuest2", 1)
                    end
                elseif game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible then
                    if string.find(game.Players.LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Demonic Soul") then
                        if game:GetService("Workspace").Enemies:FindFirstChild("Soul Reaper") then
                            for _, enemy in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                if enemy.Name == "Soul Reaper" and enemy.Humanoid and enemy.HumanoidRootPart and enemy.Humanoid.Health > 0 then
                                    repeat task.wait()
                                        AutoHaki()
                                        EquipWeapon(_G.SelectWeapon)
                                        topos(enemy.HumanoidRootPart.CFrame * CFrame.new(0, 20, 0))
                                        sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
                                    until not _G.AutoFarm or not enemy.Parent or enemy.Humanoid.Health <= 0
                                end
                            end
                        else
                            local nearbyMob
                            for _, enemy in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                if enemy.Humanoid and enemy.HumanoidRootPart and enemy.Humanoid.Health > 0 then
                                    if table.find({"Reborn Skeleton", "Living Zombie", "Demonic Soul", "Posessed Mummy"}, enemy.Name) then
                                        if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - enemy.HumanoidRootPart.Position).Magnitude <= 300 then
                                            nearbyMob = enemy
                                            break
                                        end
                                    end
                                end
                            end
                            if nearbyMob then
                                repeat task.wait()
                                    EquipWeapon(_G.SelectWeapon)
                                    AutoHaki()
                                    PosMon = nearbyMob.HumanoidRootPart.CFrame
                                    MonFarm = nearbyMob.Name
                                    topos(nearbyMob.HumanoidRootPart.CFrame * CFrame.new(0, 20, 0))
                                    StartBring = true
                                until not _G.AutoFarm or nearbyMob.Humanoid.Health <= 0 or not nearbyMob.Parent or not game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible
                                StartBring = false
                            else
                                for _, enemy in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                    if enemy.HumanoidRootPart and enemy.Humanoid and enemy.Humanoid.Health > 0 then
                                        if table.find({"Reborn Skeleton", "Living Zombie", "Demonic Soul", "Posessed Mummy"}, enemy.Name) then
                                            repeat task.wait()
                                                EquipWeapon(_G.SelectWeapon)
                                                AutoHaki()
                                                PosMon = enemy.HumanoidRootPart.CFrame
                                                MonFarm = enemy.Name
                                                topos(enemy.HumanoidRootPart.CFrame * CFrame.new(0, 20, 0))
                                                StartBring = true
                                            until not _G.AutoFarm or enemy.Humanoid.Health <= 0 or not enemy.Parent or not game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible
                                            StartBring = false
                                            break
                                        end
                                    end
                                end
                                if not game:GetService("Workspace").Enemies:FindFirstChild("Reborn Skeleton") and not game:GetService("Workspace").Enemies:FindFirstChild("Living Zombie") and 
                                   not game:GetService("Workspace").Enemies:FindFirstChild("Demonic Soul") and not game:GetService("Workspace").Enemies:FindFirstChild("Posessed Mummy") then
                                    topos(BoneQuestPos)
                                end
                            end
                        end
                    else
                        StartBring = false
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
                    end
                end
            end)
        elseif _G.SelectFarm == "Katakuri" and _G.AutoFarm and _G.GetQuest and World3 then
            pcall(function()
                if not game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible then
                    StartBring = false
                    if BypassTP and (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - CakeQuestPos.Position).Magnitude > 1500 then
                        BTP(CakeQuestPos)
                    else
                        topos(CakeQuestPos)
                    end
                    if (CakeQuestPos.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 3 then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", "CakeQuest1", 1)
                    end
                elseif game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible then
                    if string.find(game.Players.LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Cookie Crafter") then
                        if game:GetService("Workspace").Enemies:FindFirstChild("Cake Prince") or (game:GetService("Workspace").Map.CakeLoaf.BigMirror:FindFirstChild("Other") and game:GetService("Workspace").Map.CakeLoaf.BigMirror.Other.Transparency == 0 and (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(-1990.673, 4533.000, -14973.675)).Magnitude >= 500) then
                            topos(CFrame.new(-2151.822, 149.316, -12404.905))
                            task.wait(4)
                            for _, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                if (v.Name == "Cake Prince" or v.Name == "Dough King") and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                    repeat task.wait()
                                        AutoHaki()
                                        EquipWeapon(_G.SelectWeapon)
                                        if game:GetService("Workspace")["_WorldOrigin"]:FindFirstChild("Ring") or game:GetService("Workspace")["_WorldOrigin"]:FindFirstChild("Fist") or game:GetService("Workspace")["_WorldOrigin"]:FindFirstChild("MochiSwirl") then
                                            topos(v.HumanoidRootPart.CFrame * CFrame.new(20, -40, 0))
                                        else
                                            topos(v.HumanoidRootPart.CFrame * CFrame.new(0, 15, 10))
                                        end
                                        sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
                                    until not _G.AutoFarm or not v.Parent or v.Humanoid.Health <= 0
                                end
                            end
                        else
                            local nearbyMob
                            for _, enemy in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                if enemy.Humanoid and enemy.HumanoidRootPart and enemy.Humanoid.Health > 0 then
                                    if table.find({"Cookie Crafter", "Cake Guard", "Baking Staff", "Head Baker"}, enemy.Name) then
                                        if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - enemy.HumanoidRootPart.Position).Magnitude <= 300 then
                                            nearbyMob = enemy
                                            break
                                        end
                                    end
                                end
                            end
                            if nearbyMob then
                                repeat task.wait()
                                    EquipWeapon(_G.SelectWeapon)
                                    AutoHaki()
                                    PosMon = nearbyMob.HumanoidRootPart.CFrame
                                    MonFarm = nearbyMob.Name
                                    topos(nearbyMob.HumanoidRootPart.CFrame * CFrame.new(0, 20, 0))
                                    StartBring = true
                                until not _G.AutoFarm or nearbyMob.Humanoid.Health <= 0 or not nearbyMob.Parent or 
                                      not game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible or game:GetService("Workspace").Enemies:FindFirstChild("Cake Prince") or game:GetService("Workspace").Enemies:FindFirstChild("Dough King")
                                StartBring = false
                            else
                                for _, enemy in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                    if enemy.HumanoidRootPart and enemy.Humanoid and enemy.Humanoid.Health > 0 then
                                        if table.find({"Cookie Crafter", "Cake Guard", "Baking Staff", "Head Baker"}, enemy.Name) then
                                            repeat task.wait()
                                                EquipWeapon(_G.SelectWeapon)
                                                AutoHaki()
                                                PosMon = enemy.HumanoidRootPart.CFrame
                                                MonFarm = enemy.Name
                                                topos(enemy.HumanoidRootPart.CFrame * CFrame.new(0, 20, 0))
                                                StartBring = true
                                            until not _G.AutoFarm or enemy.Humanoid.Health <= 0 or not enemy.Parent or 
                                                  not game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible or game:GetService("Workspace").Enemies:FindFirstChild("Cake Prince") or 
                                                  game:GetService("Workspace").Enemies:FindFirstChild("Dough King")
                                            StartBring = false
                                            break
                                        end
                                    end
                                end
                                if not game:GetService("Workspace").Enemies:FindFirstChild("Cookie Crafter") and not game:GetService("Workspace").Enemies:FindFirstChild("Cake Guard") and 
                                   not game:GetService("Workspace").Enemies:FindFirstChild("Baking Staff") and not game:GetService("Workspace").Enemies:FindFirstChild("Head Baker") then
                                    topos(CakeQuestPos)
                                end
                            end
                        end
                    else
                        StartBring = false
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
                    end
                end
            end)
        end
    end
end)

function Death(de)
    task.wait(de)
    if game.Players.LocalPlayer and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Head") then
        player.Character.Head:Destroy()
    end
end

spawn(function()
    local gg = getrawmetatable(game)
    local old = gg.__namecall
    setreadonly(gg, false)
    gg.__namecall = newcclosure(function(...)
        local method = getnamecallmethod()
        local args = { ... }
        if tostring(method) == "FireServer" and AimBotSkillPosition ~= nil and (Skillaimbot or _G.AutoFarmMastery) then
            if tostring(args[1]) == "RemoteEvent" then
                if tostring(args[2]) ~= "true" and tostring(args[2]) ~= "false" then
                    args[2] = AimBotSkillPosition
                    return old(unpack(args))
                end
            end
        end
        return old(...)
    end)
end)

spawn(function()
    while task.wait(1) do
        pcall(function()
            for _, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                if v:IsA("Tool") and v.ToolTip == "Gun" then
                    SelectWeaponGun = v.Name
                end
            end
        end)
    end
end)

spawn(function()
    while task.wait(0.1) do
        if _G.AutoFarmMastery and _G.UseSkill1 then
            pcall(function()
                local char = game.Players.LocalPlayer.Character
                if char then
                    local fruit = char:FindFirstChild(game.Players.LocalPlayer.Data.DevilFruit.Value)
                    local gun = char:FindFirstChildOfClass("Tool")
                    local fruitLevel = fruit and fruit.Level.Value or 0
                    local function pressKey(key)
                        game:GetService("VirtualInputManager"):SendKeyEvent(true, key, false, game)
                        task.wait(0.05)
                        game:GetService("VirtualInputManager"):SendKeyEvent(false, key, false, game)
                    end
                    if gun and gun.ToolTip == "Gun" then
                        if KillZ then pressKey("Z") end
                        task.wait(0.1)
                        if KillX then pressKey("X") end
                        task.wait(0.1)
                        if KillC then pressKey("C") end
                        task.wait(0.1)
                        if KillV then pressKey("V") end
                        task.wait(0.1)
                        if KillF then pressKey("F") end
                    elseif fruit then
                        if KillZ and fruitLevel >= 1 then pressKey("Z") end
                        task.wait(0.1)
                        if KillX and fruitLevel >= 2 then pressKey("X") end
                        task.wait(0.1)
                        if KillC and fruitLevel >= 3 then pressKey("C") end
                        task.wait(0.1)
                        if KillV and fruitLevel >= 4 then pressKey("V") end
                        task.wait(0.1)
                        if KillF and fruitLevel >= 5 then pressKey("F") end
                    end
                end
            end)
        end
    end
end)

spawn(function()
    while task.wait(0.1) do
        if _G.AutoFarmMastery then
            pcall(function()
                local player = game:GetService("Players").LocalPlayer
                if not player.Character or not player.Character:FindFirstChild("HumanoidRootPart") then return end

                if _G.SelectFarmMas == "Level Fruit Mastery" or _G.SelectFarmMas == "Level Gun Mastery" then
                    local QuestTitle = player.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text
                    CheckQuest()
                    if not string.find(QuestTitle, NameMon) then
                        StartMagnet = false
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
                    end

                    if not player.PlayerGui.Main.Quest.Visible then
                        StartMagnet = false
                        if BypassTP and (player.Character.HumanoidRootPart.Position - CFrameQuest.Position).Magnitude > 1500 then
                            BTP(CFrameQuest)
                        else
                            topos(CFrameQuest)
                        end
                        if (player.Character.HumanoidRootPart.Position - CFrameQuest.Position).Magnitude <= 20 then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", NameQuest, LevelQuest)
                        end
                    elseif player.PlayerGui.Main.Quest.Visible then
                        local monName = string.find(QuestTitle, "kissed") and "kissed Warrior" or Mon
                        if game:GetService("Workspace").Enemies:FindFirstChild(monName) then
                            for _, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                if v.Name == monName and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                                    if string.find(QuestTitle, NameMon) then
                                        repeat task.wait()
                                            if v.Humanoid.Health <= v.Humanoid.MaxHealth * _G.SetHealthMas then
                                                _G.UseSkill1 = true
                                                AimBotSkillPosition = v.HumanoidRootPart.Position
                                                if _G.SelectFarmMas == "Level Fruit Mastery" then
                                                    EquipWeapon(game.Players.LocalPlayer.Data.DevilFruit.Value)
                                                else
                                                    EquipWeapon(SelectWeaponGun)
                                                end
                                            else
                                                _G.UseSkill1 = false
                                                EquipWeapon(_G.SelectWeapon)
                                                AutoHaki()
                                            end
                                            PosMon = v.HumanoidRootPart.CFrame
                                            topos(v.HumanoidRootPart.CFrame * CFrame.new(0, 20, 0))
                                            MonFarm = v.Name
                                            StartMagnet = true
                                            StartBring = true
                                            sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
                                        until not _G.AutoFarmMastery or v.Humanoid.Health <= 0 or not v.Parent or not player.PlayerGui.Main.Quest.Visible
                                        _G.UseSkill1 = false
                                        StartMagnet = false
                                        StartBring = false
                                    else
                                        StartMagnet = false
                                        StartBring = false
                                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
                                    end
                                end
                            end
                        else
                            topos(CFrameMon)
                            StartMagnet = false
                            StartBring = false
                            if game:GetService("ReplicatedStorage"):FindFirstChild(Mon) then
                                topos(game:GetService("ReplicatedStorage"):FindFirstChild(Mon).HumanoidRootPart.CFrame * CFrame.new(0, 20, 0))
                            end
                        end
                    end

                elseif _G.SelectFarmMas == "Kata Fruit Mastery" or _G.SelectFarmMas == "Kata Gun Mastery" then
                    local CakePos = CFrame.new(-2091.911865234375, 70.00884246826172, -12142.8359375)
                    local kataMobsList = {"Cookie Crafter", "Cake Guard", "Baking Staff", "Head Baker"}
                    local nearbyMob = nil

                    if game:GetService("Workspace").Enemies:FindFirstChild("Cake Prince") or (game:GetService("Workspace").Map.CakeLoaf.BigMirror:FindFirstChild("Other") and game:GetService("Workspace").Map.CakeLoaf.BigMirror.Other.Transparency == 0) then
                        topos(CFrame.new(-2151.822, 149.316, -12404.905))
                        wait(4)
                        for _, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if (v.Name == "Cake Prince" or v.Name == "Dough King") and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                repeat task.wait()
                                    if v.Humanoid.Health <= v.Humanoid.MaxHealth * _G.SetHealthMas then
                                        _G.UseSkill1 = true
                                        AimBotSkillPosition = v.HumanoidRootPart.Position
                                        if _G.SelectFarmMas == "Kata Fruit Mastery" then
                                            EquipWeapon(_G.SelectWeapon)
                                        else
                                            EquipWeapon(_G.SelectWeapon)
                                        end
                                    else
                                        _G.UseSkill1 = false
                                        EquipWeapon(_G.SelectWeapon)
                                        AutoHaki()
                                    end
                                    if game:GetService("Workspace")["_WorldOrigin"]:FindFirstChild("Ring") or game:GetService("Workspace")["_WorldOrigin"]:FindFirstChild("Fist") or game:GetService("Workspace")["_WorldOrigin"]:FindFirstChild("MochiSwirl") then
                                        topos(v.HumanoidRootPart.CFrame * CFrame.new(0, -40, 0))
                                    else
                                        topos(v.HumanoidRootPart.CFrame * CFrame.new(0, 15, 0))
                                    end
                                    sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
                                until not _G.AutoFarmMastery or not v.Parent or v.Humanoid.Health <= 0
                                _G.UseSkill1 = false
                            end
                        end
                    else
                        for _, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if table.find(kataMobsList, v.Name) and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                if (player.Character.HumanoidRootPart.Position - v.HumanoidRootPart.Position).Magnitude <= 300 then
                                    nearbyMob = v
                                    break
                                end
                            end
                        end

                        if nearbyMob then
                            repeat task.wait()
                                if nearbyMob.Humanoid.Health <= nearbyMob.Humanoid.MaxHealth * _G.SetHealthMas then
                                    _G.UseSkill1 = true
                                    AimBotSkillPosition = nearbyMob.HumanoidRootPart.Position
                                    if _G.SelectFarmMas == "Kata Fruit Mastery" then
                                        EquipWeapon(game.Players.LocalPlayer.Data.DevilFruit.Value)
                                    else
                                        EquipWeapon(SelectWeaponGun)
                                    end
                                else
                                    _G.UseSkill1 = false
                                    EquipWeapon(_G.SelectWeapon)
                                    AutoHaki()
                                end
                                topos(nearbyMob.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
                                PosMon = nearbyMob.HumanoidRootPart.CFrame
                                MonFarm = nearbyMob.Name
                                StartBring = true
                                sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
                            until not _G.AutoFarmMastery or not nearbyMob.Parent or nearbyMob.Humanoid.Health <= 0 or game:GetService("Workspace").Enemies:FindFirstChild("Cake Prince") or game:GetService("Workspace").Enemies:FindFirstChild("Dough King")
                            _G.UseSkill1 = false
                            StartBring = false
                        else
                            for _, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                if table.find(kataMobsList, v.Name) and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                    repeat task.wait()
                                        if v.Humanoid.Health <= v.Humanoid.MaxHealth * _G.SetHealthMas then
                                            _G.UseSkill1 = true
                                            AimBotSkillPosition = v.HumanoidRootPart.Position
                                            if _G.SelectFarmMas == "Kata Fruit Mastery" then
                                                EquipWeapon(game.Players.LocalPlayer.Data.DevilFruit.Value)
                                            else
                                                EquipWeapon(SelectWeaponGun)
                                            end
                                        else
                                            _G.UseSkill1 = false
                                            EquipWeapon(_G.SelectWeapon)
                                            AutoHaki()
                                        end
                                        topos(v.HumanoidRootPart.CFrame * CFrame.new(0, 20, 0))
                                        PosMon = v.HumanoidRootPart.CFrame
                                        MonFarm = v.Name
                                        StartBring = true
                                        sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
                                    until not _G.AutoFarmMastery or not v.Parent or v.Humanoid.Health <= 0 or game:GetService("Workspace").Enemies:FindFirstChild("Cake Prince") or game:GetService("Workspace").Enemies:FindFirstChild("Dough King")
                                    _G.UseSkill1 = false
                                    StartBring = false
                                    break
                                end
                            end
                            if not game:GetService("Workspace").Enemies:FindFirstChild("Cookie Crafter") and not game:GetService("Workspace").Enemies:FindFirstChild("Cake Guard") and not game:GetService("Workspace").Enemies:FindFirstChild("Baking Staff") and not game:GetService("Workspace").Enemies:FindFirstChild("Head Baker") then
                                if BypassTP and (player.Character.HumanoidRootPart.Position - CakePos.Position).Magnitude > 1500 then
                                    BTP(CakePos)
                                else
                                    topos(CakePos)
                                end
                            end
                        end
                    end

                elseif _G.SelectFarmMas == "Bones Fruit Mastery" or _G.SelectFarmMas == "Bones Gun Mastery" then
                    local BonePos = CFrame.new(-9506.234375, 172.130615234375, 6117.0771484375)
                    local boneMobsList = {"Reborn Skeleton", "Living Zombie", "Demonic Soul", "Posessed Mummy"}
                    local nearbyMob = nil

                    if game:GetService("Workspace").Enemies:FindFirstChild("Soul Reaper") then
                        for _, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if v.Name == "Soul Reaper" and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                repeat task.wait()
                                    if v.Humanoid.Health <= v.Humanoid.MaxHealth * _G.SetHealthMas then
                                        _G.UseSkill1 = true
                                        AimBotSkillPosition = v.HumanoidRootPart.Position
                                        if _G.SelectFarmMas == "Bones Fruit Mastery" then
                                            EquipWeapon(_G.SelectWeapon)
                                        else
                                            EquipWeapon(_G.SelectWeapon)
                                        end
                                    else
                                        _G.UseSkill1 = false
                                        EquipWeapon(_G.SelectWeapon)
                                        AutoHaki()
                                    end
                                    topos(v.HumanoidRootPart.CFrame * CFrame.new(0, 20, 0))
                                    sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
                                until not _G.AutoFarmMastery or not v.Parent or v.Humanoid.Health <= 0
                                _G.UseSkill1 = false
                            end
                        end
                    else
                        for _, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if table.find(boneMobsList, v.Name) and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                if (player.Character.HumanoidRootPart.Position - v.HumanoidRootPart.Position).Magnitude <= 300 then
                                    nearbyMob = v
                                    break
                                end
                            end
                        end

                        if nearbyMob then
                            repeat task.wait()
                                if nearbyMob.Humanoid.Health <= nearbyMob.Humanoid.MaxHealth * _G.SetHealthMas then
                                    _G.UseSkill1 = true
                                    AimBotSkillPosition = nearbyMob.HumanoidRootPart.Position
                                    if _G.SelectFarmMas == "Bones Fruit Mastery" then
                                        EquipWeapon(game.Players.LocalPlayer.Data.DevilFruit.Value)
                                    else
                                        EquipWeapon(SelectWeaponGun)
                                    end
                                else
                                    _G.UseSkill1 = false
                                    EquipWeapon(_G.SelectWeapon)
                                    AutoHaki()
                                end
                                StartBring = true
                                MonFarm = nearbyMob.Name
                                PosMon = nearbyMob.HumanoidRootPart.CFrame
                                topos(nearbyMob.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
                                sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
                            until not _G.AutoFarmMastery or not nearbyMob.Parent or nearbyMob.Humanoid.Health <= 0
                            _G.UseSkill1 = false
                            StartBring = false
                        else
                            for _, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                if table.find(boneMobsList, v.Name) and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                    repeat task.wait()
                                        if v.Humanoid.Health <= v.Humanoid.MaxHealth * _G.SetHealthMas then
                                            _G.UseSkill1 = true
                                            AimBotSkillPosition = v.HumanoidRootPart.Position
                                            if _G.SelectFarmMas == "Bones Fruit Mastery" then
                                                EquipWeapon(game.Players.LocalPlayer.Data.DevilFruit.Value)
                                            else
                                                EquipWeapon(SelectWeaponGun)
                                            end
                                        else
                                            _G.UseSkill1 = false
                                            EquipWeapon(_G.SelectWeapon)
                                            AutoHaki()
                                        end
                                        StartBring = true
                                        MonFarm = v.Name
                                        PosMon = v.HumanoidRootPart.CFrame
                                        topos(v.HumanoidRootPart.CFrame * CFrame.new(0, 20, 0))
                                        sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
                                    until not _G.AutoFarmMastery or not v.Parent or v.Humanoid.Health <= 0
                                    _G.UseSkill1 = false
                                    StartBring = false
                                    break
                                end
                            end
                            if not game:GetService("Workspace").Enemies:FindFirstChild("Reborn Skeleton") and not game:GetService("Workspace").Enemies:FindFirstChild("Living Zombie") and not game:GetService("Workspace").Enemies:FindFirstChild("Demonic Soul") and not game:GetService("Workspace").Enemies:FindFirstChild("Posessed Mummy") then
                                if BypassTP and (player.Character.HumanoidRootPart.Position - BonePos.Position).Magnitude > 1500 then
                                    BTP(BonePos)
                                else
                                    topos(BonePos)
                                end
                            end
                        end
                    end
                end
            end)
        else
            _G.UseSkill1 = false
            StartMagnet = false
            StartBring = false
        end
    end
end)

function CheckEyes()
    local eyes = {
        workspace.Map.TikiOutpost.IslandModel.Eye1,
        workspace.Map.TikiOutpost.IslandModel.Eye2,
        workspace.Map.TikiOutpost.IslandModel.IslandChunks.E.Eye3,
        workspace.Map.TikiOutpost.IslandModel.IslandChunks.E.Eye4
    }
    for _, eye in ipairs(eyes) do
        if eye.Transparency ~= 0 then
            return false
        end
    end
    return true
end

spawn(function()
    local keys = {"Z", "X", "C", "F"}
    while task.wait() do
        if _G.TurnSkill then
            for _, item in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                if table.find({"Melee", "Sword", "Blox Fruit", "Gun"}, item.ToolTip) then
                    if game.Players.LocalPlayer.Backpack:FindFirstChild(item.Name) then
                        EquipWeapon(item.Name)
                    end
                end
            end
            for _, key in ipairs(keys) do
                game:GetService("VirtualInputManager"):SendKeyEvent(true, key, false, game)
                task.wait()
                game:GetService("VirtualInputManager"):SendKeyEvent(false, key, false, game)
                Skillaimbot = true
                AimBotSkillPosition = game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(0, 5, 0)
            end
        else
            Skillaimbot = false
        end
    end
end)

spawn(function()
    while task.wait() do
        if not _G.BossFully or _G.SelectBossFully ~= "Tyrant of the Skies" then
            _G.TurnSkill = false
            continue
        end

        local eyesActive = CheckEyes()
        local boss = CheckBoss("Tyrant of the Skies")

        if boss then
            _G.TurnSkill = false
            repeat task.wait()
                AutoHaki()
                EquipWeapon(_G.SelectWeapon)
                if game:GetService("Workspace")["_WorldOrigin"]:FindFirstChild("ExplodeFloor") or game:GetService("Workspace")["_WorldOrigin"]:FindFirstChild("Spiral") then
                    topos(boss.HumanoidRootPart.CFrame * CFrame.new(20, -30, 0))
                else
                    topos(boss.HumanoidRootPart.CFrame * CFrame.new(5, 20, 3))
                end
                sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
            until not _G.BossFully or not boss.Parent or boss.Humanoid.Health <= 0 
        elseif eyesActive and not boss then
            local positions = {
                Vector3.new(-16250, 155, 1466),
                Vector3.new(-16338, 155, 1457),
                Vector3.new(-16213, 155, 1465),
                Vector3.new(-16216, 155, 1321),
                Vector3.new(-16254, 155, 1321),
                Vector3.new(-16291, 155, 1312),
                Vector3.new(-16334, 155, 1325)
            }

            for _, pos in ipairs(positions) do
                if not _G.BossFully or boss or not eyesActive then break end
                TPP(CFrame.new(pos))
                task.wait(1)
                if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - pos).Magnitude <= 50 then
                    _G.TurnSkill = true
                end
            end
        else
            _G.TurnSkill = false
            local tikiPos = CFrame.new(-16207, 9, 443)
            local tikiMobs = {"Isle Outlaw", "Island Boy", "Isle Champion", "Serpent Hunter", "Skull Slayer"}
            local nearbyMob

            for _, enemy in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                if table.find(tikiMobs, enemy.Name) and enemy:FindFirstChild("Humanoid") and enemy:FindFirstChild("HumanoidRootPart") and enemy.Humanoid.Health > 0 then
                    if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - enemy.HumanoidRootPart.Position).Magnitude <= 300 then
                        nearbyMob = enemy
                        break
                    end
                end
            end

            if nearbyMob then
                repeat task.wait()
                    AutoHaki()
                    EquipWeapon(_G.SelectWeapon)
                    StartBring = true
                    MonFarm = nearbyMob.Name
                    PosMon = nearbyMob.HumanoidRootPart.CFrame
                    topos(nearbyMob.HumanoidRootPart.CFrame * CFrame.new(0, 20, 0))
                until not _G.BossFully or not nearbyMob.Parent or nearbyMob.Humanoid.Health <= 0
                StartBring = false
            else
                for _, enemy in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                    if table.find(tikiMobs, enemy.Name) and enemy:FindFirstChild("Humanoid") and enemy:FindFirstChild("HumanoidRootPart") and enemy.Humanoid.Health > 0 then
                        repeat task.wait()
                            AutoHaki()
                            EquipWeapon(_G.SelectWeapon)
                            StartBring = true
                            MonFarm = enemy.Name
                            PosMon = enemy.HumanoidRootPart.CFrame
                            topos(enemy.HumanoidRootPart.CFrame * CFrame.new(0, 20, 0))
                        until not _G.BossFully or not enemy.Parent or enemy.Humanoid.Health <= 0
                        StartBring = false
                        break
                    end
                end

                local hasMob = false
                for _, mobName in ipairs(tikiMobs) do
                    if game:GetService("Workspace").Enemies:FindFirstChild(mobName) then
                        hasMob = true
                        break
                    end
                end

                if not hasMob then
                    if BypassTP and (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - tikiPos.Position).Magnitude > 1500 then
                        BTP(tikiPos)
                    else
                        topos(tikiPos)
                        local randomTele = math.random(1, 2)
                        if randomTele == 1 then
                            topos(CFrame.new(-16584, 107, 1307))
                        else
                            topos(CFrame.new(-16568, 56, -214))
                        end
                    end
                end
            end
        end
    end
end)

spawn(function()
    while task.wait() do
        pcall(function()
            if _G.BossFully and _G.SelectBossFully == "Dark Beard" and World2 then
                local char = game.Players.LocalPlayer.Character
                if not char or not char:FindFirstChild("HumanoidRootPart") then return end

                if game.Workspace.Enemies:FindFirstChild("Darkbeard") then
                    for _, v in pairs(game.Workspace.Enemies:GetChildren()) do
                        if v.Name == "Darkbeard" and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                            repeat task.wait()
                                AutoHaki()
                                EquipWeapon(_G.SelectWeapon)
                                topos(v.HumanoidRootPart.CFrame * CFrame.new(0, 20, 0))
                                sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
                            until not _G.BossFully or not v.Parent or v.Humanoid.Health <= 0
                        end
                    end
                elseif not game.Players.LocalPlayer.Character:FindFirstChild("Fist of Darkness") and not game.Players.LocalPlayer.Backpack:FindFirstChild("Fist of Darkness") and 
                       not game.ReplicatedStorage:FindFirstChild("Darkbeard") then
                    local Player = game.Players.LocalPlayer
                    local Character = Player.Character
                    local Position = Character:GetPivot().Position
                    local Chests = game:GetService("CollectionService"):GetTagged("_ChestTagged")
                    local Nearest, Distance = nil, math.huge
                    
                    for _, Chest in ipairs(Chests) do
                        if not Chest:GetAttribute("IsDisabled") then
                            local Magnitude = (Chest:GetPivot().Position - Position).Magnitude
                            if Magnitude < Distance then
                                Distance, Nearest = Magnitude, Chest
                            end
                        end
                    end
                    
                    if Nearest then
                        topos(Nearest:GetPivot())
                        Player.Character.Humanoid.Sit = false
                        task.wait(0.5)
                    end
                elseif (char:FindFirstChild("Fist of Darkness") or game.Players.LocalPlayer.Backpack:FindFirstChild("Fist of Darkness")) and 
                       not game.ReplicatedStorage:FindFirstChild("Darkbeard") then
                    EquipWeapon("Fist of Darkness")
                    topos(CFrame.new(3777.63, 14.97, -3499.05))
                elseif game.ReplicatedStorage:FindFirstChild("Darkbeard") then
                    topos(game.ReplicatedStorage:FindFirstChild("Darkbeard").HumanoidRootPart.CFrame * CFrame.new(0, 20, 0))
                end
            end
        end)
    end
end)

spawn(function()
    while task.wait() do
        pcall(function()
            if _G.BossFully and _G.SelectBossFully == "Rip_Indra" and World3 then
                local char = game.Players.LocalPlayer.Character
                if not char or not char:FindFirstChild("HumanoidRootPart") then return end

                if game.Workspace.Enemies:FindFirstChild("rip_indra True Form") or game.Workspace.Enemies:FindFirstChild("rip_indra") then
                    for _, v in pairs(game.Workspace.Enemies:GetChildren()) do
                        if (v.Name == "rip_indra True Form" or v.Name == "rip_indra") and v:FindFirstChild("Humanoid") and 
                           v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                            repeat task.wait()
                                AutoHaki()
                                EquipWeapon(_G.SelectWeapon)
                                topos(v.HumanoidRootPart.CFrame * CFrame.new(0, 20, 0))
                            until not _G.BossFully or v.Humanoid.Health <= 0 or not v.Parent
                        end
                    end
                elseif not char:FindFirstChild("God's Chalice") and not game.Players.LocalPlayer.Backpack:FindFirstChild("God's Chalice") then
                    if game.Workspace.Enemies:FindFirstChild("Diablo") or game.Workspace.Enemies:FindFirstChild("Deandre") or 
                       game.Workspace.Enemies:FindFirstChild("Urban") then
                        for _, v in pairs(game.Workspace.Enemies:GetChildren()) do
                            if (v.Name == "Diablo" or v.Name == "Deandre" or v.Name == "Urban") and v:FindFirstChild("Humanoid") and 
                               v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                repeat task.wait()
                                    AutoHaki()
                                    EquipWeapon(_G.SelectWeapon)
                                    topos(v.HumanoidRootPart.CFrame * CFrame.new(0, 20, 0))
                                    sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
                                until not _G.BossFully or v.Humanoid.Health <= 0 or not v.Parent or 
                                      char:FindFirstChild("God's Chalice") or game.Players.LocalPlayer.Backpack:FindFirstChild("God's Chalice")
                            end
                        end
                    elseif game.ReplicatedStorage:FindFirstChild("Diablo") then
                    game.ReplicatedStorage.Remotes.CommF_:InvokeServer("EliteHunter")
                        topos(game.ReplicatedStorage:FindFirstChild("Diablo").HumanoidRootPart.CFrame * CFrame.new(0, 20, 0))
                    elseif game.ReplicatedStorage:FindFirstChild("Deandre") then
                    game.ReplicatedStorage.Remotes.CommF_:InvokeServer("EliteHunter")
                        topos(game.ReplicatedStorage:FindFirstChild("Deandre").HumanoidRootPart.CFrame * CFrame.new(0, 20, 0))
                    elseif game.ReplicatedStorage:FindFirstChild("Urban") then
                    game.ReplicatedStorage.Remotes.CommF_:InvokeServer("EliteHunter")
                        topos(game.ReplicatedStorage:FindFirstChild("Urban").HumanoidRootPart.CFrame * CFrame.new(0, 20, 0))
                    else
                        local Player = game.Players.LocalPlayer
                        local Character = Player.Character
                        local Position = Character:GetPivot().Position
                        local Chests = game:GetService("CollectionService"):GetTagged("_ChestTagged")
                        local Nearest, Distance = nil, math.huge
                        
                        for _, Chest in ipairs(Chests) do
                            if not Chest:GetAttribute("IsDisabled") then
                                local Magnitude = (Chest:GetPivot().Position - Position).Magnitude
                                if Magnitude < Distance then
                                    Distance, Nearest = Magnitude, Chest
                                end
                            end
                        end
                        
                        if Nearest then
                            topos(Nearest:GetPivot())
                            Player.Character.Humanoid.Sit = false
                            task.wait(0.5)
                        end
                    end
                elseif char:FindFirstChild("God's Chalice") or game.Players.LocalPlayer.Backpack:FindFirstChild("God's Chalice") then
                    EquipWeapon("God's Chalice")
                    topos(CFrame.new(-5562.37255859375, 314.0408630371094, -2659.544189453125))
                elseif game.ReplicatedStorage:FindFirstChild("rip_indra") or game.ReplicatedStorage:FindFirstChild("rip_indra True Form") then
                    topos(CFrame.new(-5344.822, 423.985, -2725.093))
                end
            end
        end)
    end
end)

spawn(function()
    while task.wait() do
        pcall(function()
            if _G.BossFully and _G.SelectBossFully == "Dough King" and World3 then
                local char = game.Players.LocalPlayer.Character
                if not char or not char:FindFirstChild("HumanoidRootPart") then return end

                local Cocoa = GetCountMaterials("Conjured Cocoa")
                if (char:FindFirstChild("God's Chalice") or game.Players.LocalPlayer.Backpack:FindFirstChild("God's Chalice")) and 
                   not (char:FindFirstChild("Sweet Chalice") or game.Players.LocalPlayer.Backpack:FindFirstChild("Sweet Chalice")) and 
                   not (game.ReplicatedStorage:FindFirstChild("Dough King") or game.Workspace.Enemies:FindFirstChild("Dough King")) and 
                   Cocoa < 10 then
                    if game.Workspace.Enemies:FindFirstChild("Chocolate Bar Battler") then
                        for _, v in pairs(game.Workspace.Enemies:GetChildren()) do
                            if v.Name == "Chocolate Bar Battler" and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                repeat task.wait()
                                    AutoHaki()
                                    EquipWeapon(_G.SelectWeapon)
                                    topos(v.HumanoidRootPart.CFrame * CFrame.new(0, 20, 0))
                                until not _G.BossFully or v.Humanoid.Health <= 0 or not v.Parent or 
                                       char:FindFirstChild("Sweet Chalice") or game.Players.LocalPlayer.Backpack:FindFirstChild("Sweet Chalice")
                                       else
                                       topos(CFrame.new(233.22836303710938, 29.876001358032227, -12201.2333984375))
                            end
                        end
                    elseif (char:FindFirstChild("God's Chalice") or game.Players.LocalPlayer.Backpack:FindFirstChild("God's Chalice")) and 
                           not (char:FindFirstChild("Sweet Chalice") or game.Players.LocalPlayer.Backpack:FindFirstChild("Sweet Chalice")) and 
                           not (game.ReplicatedStorage:FindFirstChild("Dough King") or game.Workspace.Enemies:FindFirstChild("Dough King")) then
                        if game.ReplicatedStorage:FindFirstChild("Chocolate Bar Battler") and game.ReplicatedStorage:FindFirstChild("Chocolate Bar Battler"):FindFirstChild("HumanoidRootPart") then
                            topos(game.ReplicatedStorage:FindFirstChild("Chocolate Bar Battler").HumanoidRootPart.CFrame * CFrame.new(0, 20, 0))
                        end
                    end
                elseif char:FindFirstChild("Sweet Chalice") or game.Players.LocalPlayer.Backpack:FindFirstChild("Sweet Chalice") then
                    if string.find(game.ReplicatedStorage.Remotes.CommF_:InvokeServer("CakePrinceSpawner"), "Do you want to open the portal now?") then
                        game.ReplicatedStorage.Remotes.CommF_:InvokeServer("CakePrinceSpawner")
                    else
                        if game.Workspace.Enemies:FindFirstChild("Baking Staff") or game.Workspace.Enemies:FindFirstChild("Head Baker") or 
                           game.Workspace.Enemies:FindFirstChild("Cake Guard") or game.Workspace.Enemies:FindFirstChild("Cookie Crafter") then
                            for _, v in pairs(game.Workspace.Enemies:GetChildren()) do
                                if (v.Name == "Baking Staff" or v.Name == "Head Baker" or v.Name == "Cake Guard" or v.Name == "Cookie Crafter") and 
                                   v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                    repeat task.wait()
                                        AutoHaki()
                                        EquipWeapon(_G.SelectWeapon)
                                        PosMon = v.HumanoidRootPart.CFrame
                                        topos(v.HumanoidRootPart.CFrame * CFrame.new(0, 20, 0))
                                        StartBring = true
                                        MonFarm = v.Name
                                    until not _G.BossFully or game.ReplicatedStorage:FindFirstChild("Cake Prince") or not v.Parent or v.Humanoid.Health <= 0
                                end
                            end
                        else
                            StartBring = false
                            topos(CFrame.new(-1820.0634765625, 210.74781799316406, -12297.49609375))
                        end
                    end
                elseif game.ReplicatedStorage:FindFirstChild("Dough King") or game.Workspace.Enemies:FindFirstChild("Dough King") then
                    if game.Workspace.Enemies:FindFirstChild("Dough King") and game.Workspace.Enemies:FindFirstChild("Dough King"):FindFirstChild("Humanoid") and 
                       game.Workspace.Enemies:FindFirstChild("Dough King"):FindFirstChild("HumanoidRootPart") and 
                       game.Workspace.Enemies:FindFirstChild("Dough King").Humanoid.Health > 0 then
                        for _, v in pairs(game.Workspace.Enemies:GetChildren()) do
                            if v.Name == "Dough King" then
                                repeat task.wait()
                                    AutoHaki()
                                    EquipWeapon(_G.SelectWeapon)
                                    topos(v.HumanoidRootPart.CFrame * CFrame.new(0, 20, 0))
                                until not _G.BossFully or not v.Parent or v.Humanoid.Health <= 0
                            end
                        end
                    else
                        topos(CFrame.new(-2009.2802734375, 4532.97216796875, -14937.3076171875))
                    end
                elseif not (char:FindFirstChild("Sweet Chalice") or game.Players.LocalPlayer.Backpack:FindFirstChild("Sweet Chalice")) and 
                       not (game.ReplicatedStorage:FindFirstChild("Dough King") or game.Workspace.Enemies:FindFirstChild("Dough King")) then
                    if game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible and 
                       (string.find(game.Players.LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Diablo") or 
                        string.find(game.Players.LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Deandre") or 
                        string.find(game.Players.LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Urban")) then
                        if game.Workspace.Enemies:FindFirstChild("Diablo") or game.Workspace.Enemies:FindFirstChild("Deandre") or 
                           game.Workspace.Enemies:FindFirstChild("Urban") then
                            for _, v in pairs(game.Workspace.Enemies:GetChildren()) do
                                if (v.Name == "Diablo" or v.Name == "Deandre" or v.Name == "Urban") and v:FindFirstChild("Humanoid") and 
                                   v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                    repeat task.wait()
                                        AutoHaki()
                                        EquipWeapon(_G.SelectWeapon)
                                        PosMon = v.HumanoidRootPart.CFrame
                                        topos(v.HumanoidRootPart.CFrame * CFrame.new(0, 20, 0))
                                        sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
                                    until not _G.BossFully or v.Humanoid.Health <= 0 or not v.Parent or 
                                          char:FindFirstChild("God's Chalice") or game.Players.LocalPlayer.Backpack:FindFirstChild("God's Chalice")
                                end
                            end
                        elseif game.ReplicatedStorage:FindFirstChild("Diablo") and game.ReplicatedStorage:FindFirstChild("Diablo"):FindFirstChild("HumanoidRootPart") then
                            topos(game.ReplicatedStorage:FindFirstChild("Diablo").HumanoidRootPart.CFrame * CFrame.new(0, 20, 0))
                        elseif game.ReplicatedStorage:FindFirstChild("Deandre") and game.ReplicatedStorage:FindFirstChild("Deandre"):FindFirstChild("HumanoidRootPart") then
                            topos(game.ReplicatedStorage:FindFirstChild("Deandre").HumanoidRootPart.CFrame * CFrame.new(0, 20, 0))
                        elseif game.ReplicatedStorage:FindFirstChild("Urban") and game.ReplicatedStorage:FindFirstChild("Urban"):FindFirstChild("HumanoidRootPart") then
                            topos(game.ReplicatedStorage:FindFirstChild("Urban").HumanoidRootPart.CFrame * CFrame.new(0, 20, 0))
                        end
                    else
                        local player = game.Players.LocalPlayer
                        local character = player.Character
                        if not character or not character:FindFirstChild("HumanoidRootPart") then return end
                        local position = character.HumanoidRootPart.Position
                        local chests = game:GetService("CollectionService"):GetTagged("_ChestTagged")
                        local nearest, distance = nil, math.huge
                        for _, chest in ipairs(chests) do
                            if not chest:GetAttribute("IsDisabled") then
                                local magnitude = (chest:GetPivot().Position - position).Magnitude
                                if magnitude < distance then
                                    distance, nearest = magnitude, chest
                                end
                            end
                        end
                        if nearest then
                            topos(nearest:GetPivot())
                            player.Character.Humanoid.Sit = false
                        end
                        task.wait(0.5)
                        game.ReplicatedStorage.Remotes.CommF_:InvokeServer("EliteHunter")
                    end
                elseif (char:FindFirstChild("Red Key") or game.Players.LocalPlayer.Backpack:FindFirstChild("Red Key")) then
                    local args = {
                        [1] = "CakeScientist",
                        [2] = "Check"
                    }
                    game.ReplicatedStorage.Remotes.CommF_:InvokeServer(unpack(args))
                    if char:FindFirstChild("God's Chalice") or game.Players.LocalPlayer.Backpack:FindFirstChild("God's Chalice") then
                        if string.find(game.ReplicatedStorage.Remotes.CommF_:InvokeServer("SweetChaliceNpc"), "Where") then
                        game.StarterGui:SetCore("SendNotification", {
								Title = "Notification", 
								Text = "Not Have Enough Material" ,
								Icon = "http://www.roblox.com/asset/?id=123709024751036",
								Duration = 2.5
							})
						else
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SweetChaliceNpc")
                        end
                    end
                end
            end
        end)
    end
end)

spawn(function()
        while wait() do
            if _G.AutoFarmBoss then
                pcall(function()
                if not _G.AutoFarmBoss then return end
                    if game:GetService("Workspace").Enemies:FindFirstChild(_G.SelectBoss) then
                        for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if v.Name == _G.SelectBoss then
                                if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                    repeat task.wait()
                                        AutoHaki()
                                        EquipWeapon(_G.SelectWeapon)                   
                                        topos(v.HumanoidRootPart.CFrame * CFrame.new(0, 20, 0))
                                    until not _G.AutoFarmBoss or not v.Parent or v.Humanoid.Health <= 0
                                end
                            end
                        end
                    else
                        if game:GetService("ReplicatedStorage"):FindFirstChild(_G.SelectBoss) then
                            topos(game:GetService("ReplicatedStorage"):FindFirstChild(_G.SelectBoss).HumanoidRootPart.CFrame * CFrame.new(5,10,2))
                        end
                    end
                end)
            end
        end
    end)  
   
spawn(function()
    while task.wait() do
        if _G.AutoMaterial and _G.SelectMaterial then
            pcall(function()
                MaterialMon()
                if BypassTP then
                    if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - MPos.Position).Magnitude > 3500 then
                        BTP(MPos)
                    elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - MPos.Position).Magnitude < 3500 then
                        topos(MPos)
                    end
                else
                    topos(MPos)
                end
                if game:GetService("Workspace").Enemies:FindFirstChild(MMon) then
                    for i, v in pairs(game.Workspace.Enemies:GetChildren()) do
                        if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                            if v.Name == MMon then
                                repeat task.wait()
                                    AutoHaki()
                                    StartBring = true
                                    EquipWeapon(_G.SelectWeapon)
                                    topos(v.HumanoidRootPart.CFrame * CFrame.new(0, 20, 0))
                                    PosMon = v.HumanoidRootPart.CFrame
                                    MonFarm = v.Name
                                until not _G.AutoMaterial or not v.Parent or v.Humanoid.Health <= 0
                                StartBring = false
                            end
                        end
                    end
                else
                    for i, v in pairs(game:GetService("Workspace")["_WorldOrigin"].EnemySpawns:GetChildren()) do
                        if string.find(v.Name, MMon) then
                            if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.Position).Magnitude >= 10 then
                                topos(v.CFrame * CFrame.new(0, 20, 0))
                            end
                        end
                    end
                end
            end)
        end
    end
end)

chestCount = 0

spawn(function()
    while task.wait() do
        if _G.ChestTween then
            Player = game.Players.LocalPlayer
            Character = Player.Character or Player.CharacterAdded:Wait()
            Position = Character:GetPivot().Position
            Chests = game:GetService("CollectionService"):GetTagged("_ChestTagged")
            Nearest, Distance = nil, math.huge

            for _, Chest in ipairs(Chests) do
                if not Chest:GetAttribute("IsDisabled") then
                    Magnitude = (Chest:GetPivot().Position - Position).Magnitude
                    if Magnitude < Distance then
                        Distance, Nearest = Magnitude, Chest
                    end
                end
            end

            if Nearest then
                topos(Nearest:GetPivot())
                chestCount = chestCount + 1
                ChestCounter:SetDesc(chestCount)
                if Player.Character.Humanoid.Sit == true then
                    Player.Character.Humanoid.Sit = false
                end
                task.wait(0.5)
                if _G.ChestHop then
                    Hop()
                end
            end
        end
    end
end)

spawn(function()
    while task.wait() do
        pcall(function()
            if _G.StopItemsChest then
                if game.Players.LocalPlayer.Backpack:FindFirstChild("God's Chalice") or
                   game.Players.LocalPlayer.Backpack:FindFirstChild("Fist of Darkness") then
                    _G.ChestTween = false
                    if World2 then
                        topos(CFrame.new(-380.47927856445, 77.220390319824, 255.82550048828))
                    elseif World3 then
                        topos(CFrame.new(-5074.45556640625, 314.5155334472656, -2991.054443359375))
                    end
                end
            end
        end)
    end
end)

----------------+_+ code ngoài
--//Bú be ry
spawn(function()
    while wait() do
        if _G.CollectBerry then
            local Player = game.Players.LocalPlayer
            local Character = Player.Character or Player.CharacterAdded:Wait()
            local Position = Character:GetPivot().Position
            local CollectionService = game:GetService("CollectionService")
            local BerryBushes = CollectionService:GetTagged("BerryBush")
            local Distance, Nearest, BerryCFrame, BerryName = math.huge, nil, nil, nil

            for i = 1, #BerryBushes do
                local Bush = BerryBushes[i]
                for AttributeName, Berry in pairs(Bush:GetAttributes()) do
                    if Berry then
                        local BerryPosition = Bush.Parent:GetPivot().Position + Vector3.new(0, 2, 0)
                        local Magnitude = (BerryPosition - Position).Magnitude
                        if Magnitude < Distance then
                            Distance, Nearest, BerryCFrame, BerryName = Magnitude, Bush, CFrame.new(BerryPosition), AttributeName
                        end
                    end
                end
            end

            if Nearest and BerryCFrame and BerryName then
                topos(BerryCFrame)
                if #Nearest:GetChildren() > 0 then
                    for i, v in pairs(Nearest:GetChildren()) do
                        if v:IsA("Model") then
                            if (v:GetPivot().Position - Player.Character.HumanoidRootPart.Position).Magnitude > 5 then
                                topos(CFrame.new(v:GetPivot().Position))
                                wait(.1)
                            end
                            if (v:GetPivot().Position - Player.Character.HumanoidRootPart.Position).Magnitude <= 5 then
                                if v:FindFirstChild("ProximityPrompt") then 
                                    fireproximityprompt(v.ProximityPrompt) 
                                end
                            end
                        end
                    end
                end
            elseif _G.CollectBerryHop then
                Hop()
            end
        end
    end
end)

----------------@_@ Quest Sea 1
function CompleteQuest2()
    if game:GetService("Players").LocalPlayer.Data.Level.Value < 700 then return end
    local sea2 = game.ReplicatedStorage.Remotes.CommF_:InvokeServer("DressrosaQuestProgress")
    if sea2["UsedKey"] == false then
        if not (game.Players.LocalPlayer.Backpack:FindFirstChild("Key") or game.Players.LocalPlayer.Character:FindFirstChild("Key")) then
            topos(CFrame.new(1347.32947, 37.349369, -1325.44922, 0.538348913, 8.57539106e-08, 0.842722058, 8.61935634e-10, 1, -1.0230886e-07, -0.842722058, 5.58042359e-08, 0.538348913))
            game.ReplicatedStorage.Remotes.CommF_:InvokeServer("DressrosaQuestProgress", "Detective")
        end
        EquipWeapon("Key")
        if game.Players.LocalPlayer.Backpack:FindFirstChild("Key") or game.Players.LocalPlayer.Character:FindFirstChild("Key") then
            local pos2 = CFrame.new(1347.712, 37.375, -1325.648)
            repeat
                wait()
                topos(pos2)
                EquipWeapon("Key")
            until (pos2.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 3
        end
    elseif sea2["UsedKey"] == true and sea2["KilledIceBoss"] == false then
        local iceAdmiral = game.Workspace.Enemies:FindFirstChild("Ice Admiral")
        if iceAdmiral then
            if iceAdmiral.Humanoid and iceAdmiral.Humanoid.Health > 0 then
                repeat
                    wait()
                    AutoHaki()
                    EquipWeapon(_G.SelectWeapon)
                    topos(iceAdmiral.HumanoidRootPart.CFrame * CFrame.new(0, 20, 0))
                until not iceAdmiral.Parent or iceAdmiral.Humanoid.Health <= 0
                game.ReplicatedStorage.Remotes.CommF_:InvokeServer("TravelDressrosa")
            end
        else
            topos(CFrame.new(1347.712, 37.375, -1325.648))
        end
    elseif sea2["KilledIceBoss"] == true then
        game.ReplicatedStorage.Remotes.CommF_:InvokeServer("TravelDressrosa")
    end
end

--//Pô văn le
spawn(function()
    while task.wait() do
        if _G.AutoPole and World1 then
            pcall(function()
                if game:GetService("Workspace").Enemies:FindFirstChild("Thunder God") then
                    for _, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if v.Name == "Thunder God" and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                            sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
                            repeat task.wait()
                                AutoHaki()
                                EquipWeapon(_G.SelectWeapon)
                                topos(v.HumanoidRootPart.CFrame * CFrame.new(0, 20, 0))
                            until not _G.AutoPole or not v.Parent or v.Humanoid.Health <= 0
                        end
                    end
                else
                    if game:GetService("ReplicatedStorage"):FindFirstChild("Thunder God") then
                        topos(game:GetService("ReplicatedStorage"):FindFirstChild("Thunder God").HumanoidRootPart.CFrame * CFrame.new(2, 20, 2))
                    elseif _G.PoleHop then
                            Hop()
                    end
                end
            end)
        end
    end
end)

--//Sây văn bơ
function Getsb()
    if not game.Players.LocalPlayer.Character or not game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then return end
    if game:GetService("Workspace").Map.Jungle.Final.Part.Transparency == 0 then
        if game:GetService("Workspace").Map.Jungle.QuestPlates.Door.Transparency == 0 then
            if (CFrame.new(-1612.55884, 36.9774132, 148.719543).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 100 then
                topos(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame)
                wait(1)
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Map.Jungle.QuestPlates.Plate1.Button.CFrame
                wait(1)
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Map.Jungle.QuestPlates.Plate2.Button.CFrame
                wait(1)
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Map.Jungle.QuestPlates.Plate3.Button.CFrame
                wait(1)
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Map.Jungle.QuestPlates.Plate4.Button.CFrame
                wait(1)
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Map.Jungle.QuestPlates.Plate5.Button.CFrame
                wait(1)
            else
                topos(CFrame.new(-1612.55884, 36.9774132, 148.719543))
            end
        else
            if game:GetService("Workspace").Map.Desert.Burn.Part.Transparency == 0 then
                if game.Players.LocalPlayer.Backpack:FindFirstChild("Torch") or game.Players.LocalPlayer.Character:FindFirstChild("Torch") then
                    EquipWeapon("Torch")
                    topos(CFrame.new(1110.631591796875, 5.235761642456055, 4353.2412109375))
                    game:GetService("VirtualInputManager"):SendKeyEvent(true, "Space", false, game)
                    task.wait(1)
                    game:GetService("VirtualInputManager"):SendKeyEvent(false, "Space", false, game)
                else
                    topos(CFrame.new(-1610.00757, 11.5049858, 164.001587))
                end
            else
                if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress", "SickMan") ~= 0 then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress", "GetCup")
                    wait(0.5)
                    EquipWeapon("Cup")
                    wait(0.5)
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress", "FillCup", game.Players.LocalPlayer.Character.Cup)
                    wait()
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress", "SickMan")
                else
                    if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress", "RichSon") == nil then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress", "RichSon")
                    elseif game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress", "RichSon") == 0 then
                        if game:GetService("Workspace").Enemies:FindFirstChild("Mob Leader") or game:GetService("ReplicatedStorage"):FindFirstChild("Mob Leader") then
                            topos(CFrame.new(-2892.87451171875, 22.10824966430664, 5445.8857421875))
                            for _, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                if v.Name == "Mob Leader" and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                    repeat task.wait()
                                        AutoHaki()
                                        EquipWeapon(_G.SelectWeapon)
                                        topos(v.HumanoidRootPart.CFrame * CFrame.new(0, 20, 0))
                                    until not v.Parent or v.Humanoid.Health <= 0
                                end
                            end
                        end
                    elseif game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress", "RichSon") == 1 then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress", "RichSon")
                        wait(0.5)
                        EquipWeapon("Relic")
                        wait(0.5)
                        topos(CFrame.new(-1406.6300048828125, 30.166263580322266, 3.0864763259887695))
                    end
                end
            end
        end
    else
        if game:GetService("Workspace").Enemies:FindFirstChild("Saber Expert") or game:GetService("ReplicatedStorage"):FindFirstChild("Saber Expert") then
            topos(CFrame.new(-1401.85046, 29.9773273, 8.81916237))
            for _, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                if v.Name == "Saber Expert" and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                    repeat task.wait()
                        AutoHaki()
                        EquipWeapon(_G.SelectWeapon)
                        topos(v.HumanoidRootPart.CFrame * CFrame.new(0, 20, 0))
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")
                    until not v.Parent or v.Humanoid.Health <= 0
                    if v.Humanoid.Health <= 0 then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress", "PlaceRelic")
                    else
                    Hop()
                    end
                end
            end
        end
    end
end

----------------^_° Quest Sea 2

--//Ba rờ ti lô
spawn(function()
    pcall(function()
        while wait(.1) do
            if _G.AutoBartilo then
                if game:GetService("Players").LocalPlayer.Data.Level.Value >= 800 and game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BartiloQuestProgress","Bartilo") == 0 then
                    if string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Swan Pirates") and string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "50") and game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then 
                        if game:GetService("Workspace").Enemies:FindFirstChild("Swan Pirate") then
                            for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                if v.Name == "Swan Pirate" then
                                    pcall(function()
                                        repeat task.wait()
                                            sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge)
                                            EquipWeapon(_G.SelectWeapon)
                                            AutoHaki()
                                            topos(v.HumanoidRootPart.CFrame * CFrame.new(0, 20, 0))												
                                            PosMon = v.HumanoidRootPart.CFrame
                                            MonFarm = v.Name
                                            StartBring = true
                                        until not v.Parent or v.Humanoid.Health <= 0 or _G.AutoBartilo == false or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false
                                        StartBring = false
                                    end)
                                end
                            end
                        else
                            repeat topos(CFrame.new(932.624451, 156.106079, 1180.27466, -0.973085582, 4.55137119e-08, -0.230443969, 2.67024713e-08, 1, 8.47491108e-08, 0.230443969, 7.63147128e-08, -0.973085582)) wait() until not _G.AutoBartilo or (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(932.624451, 156.106079, 1180.27466, -0.973085582, 4.55137119e-08, -0.230443969, 2.67024713e-08, 1, 8.47491108e-08, 0.230443969, 7.63147128e-08, -0.973085582)).Magnitude <= 10
                        end
                    else
                        repeat topos(CFrame.new(-456.28952, 73.0200958, 299.895966)) wait() until not _G.AutoBartilo or (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-456.28952, 73.0200958, 299.895966)).Magnitude <= 10
                        wait(1.1)
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest","BartiloQuest",1)
                    end 
                elseif game:GetService("Players").LocalPlayer.Data.Level.Value >= 800 and game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BartiloQuestProgress","Bartilo") == 1 then
                    if game:GetService("Workspace").Enemies:FindFirstChild("Jeremy") then
                        for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if v.Name == "Jeremy" then
                                repeat task.wait()
                                    EquipWeapon(_G.SelectWeapon)
                                    AutoHaki()
                                    topos(v.HumanoidRootPart.CFrame * CFrame.new(0, 20, 0))
                                    sethiddenproperty(game:GetService("Players").LocalPlayer,"SimulationRadius",math.huge)
                                until not v.Parent or v.Humanoid.Health <= 0 or _G.AutoBartilo == false
                            end
                        end
                    elseif game:GetService("ReplicatedStorage"):FindFirstChild("Jeremy") then
                        repeat topos(CFrame.new(-456.28952, 73.0200958, 299.895966)) wait() until not _G.AutoBartilo or (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-456.28952, 73.0200958, 299.895966)).Magnitude <= 10
                        wait(1.1)
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BartiloQuestProgress","Bartilo")
                        wait(1)
                        repeat topos(CFrame.new(2099.88159, 448.931, 648.997375)) wait() until not _G.AutoBartilo or (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(2099.88159, 448.931, 648.997375)).Magnitude <= 10
                        wait(2)
                    else
                        repeat topos(CFrame.new(2099.88159, 448.931, 648.997375)) wait() until not _G.AutoBartilo or (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(2099.88159, 448.931, 648.997375)).Magnitude <= 10
                    end
                elseif game:GetService("Players").LocalPlayer.Data.Level.Value >= 800 and game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BartiloQuestProgress","Bartilo") == 2 then
                    repeat topos(CFrame.new(-1850.49329, 13.1789551, 1750.89685)) wait() until not _G.AutoBartilo or (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-1850.49329, 13.1789551, 1750.89685)).Magnitude <= 10
                    wait(1)
                    repeat topos(CFrame.new(-1858.87305, 19.3777466, 1712.01807)) wait() until not _G.AutoBartilo or (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-1858.87305, 19.3777466, 1712.01807)).Magnitude <= 10
                    wait(1)
                    repeat topos(CFrame.new(-1803.94324, 16.5789185, 1750.89685)) wait() until not _G.AutoBartilo or (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-1803.94324, 16.5789185, 1750.89685)).Magnitude <= 10
                    wait(1)
                    repeat topos(CFrame.new(-1858.55835, 16.8604317, 1724.79541)) wait() until not _G.AutoBartilo or (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-1858.55835, 16.8604317, 1724.79541)).Magnitude <= 10
                    wait(1)
                    repeat topos(CFrame.new(-1869.54224, 15.987854, 1681.00659)) wait() until not _G.AutoBartilo or (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-1869.54224, 15.987854, 1681.00659)).Magnitude <= 10
                    wait(1)
                    repeat topos(CFrame.new(-1800.0979, 16.4978027, 1684.52368)) wait() until not _G.AutoBartilo or (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-1800.0979, 16.4978027, 1684.52368)).Magnitude <= 10
                    wait(1)
                    repeat topos(CFrame.new(-1819.26343, 14.795166, 1717.90625)) wait() until not _G.AutoBartilo or (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-1819.26343, 14.795166, 1717.90625)).Magnitude <= 10
                    wait(1)
                    repeat topos(CFrame.new(-1813.51843, 14.8604736, 1724.79541)) wait() until not _G.AutoBartilo or (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-1813.51843, 14.8604736, 1724.79541)).Magnitude <= 10
                end
            end 
        end
    end)
end)

--//Ê vồ rây vê hai
spawn(function()
    pcall(function()
        while task.wait(0.1) do
            if _G.Auto_EvoRace then
                if not game.Players.LocalPlayer.Character or not game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then return end
                if not game:GetService("Players").LocalPlayer.Data.Race:FindFirstChild("Evolved") then
                    if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Alchemist", "1") == 0 then
                        topos(CFrame.new(-2779.83521, 72.9661407, -3574.02002, -0.730484903, 6.39014104e-08, -0.68292886, 3.59963224e-08, 1, 5.50667032e-08, 0.68292886, 1.56424669e-08, -0.730484903))
                        if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(-2779.83521, 72.9661407, -3574.02002)).Magnitude <= 4 then
                            wait(1.3)
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Alchemist", "2")
                        end
                    elseif game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Alchemist", "1") == 1 then
                        if not game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Flower 1") and not game:GetService("Players").LocalPlayer.Character:FindFirstChild("Flower 1") then
                            topos(game:GetService("Workspace").Flower1.CFrame)
                        elseif not game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Flower 2") and not game:GetService("Players").LocalPlayer.Character:FindFirstChild("Flower 2") then
                            topos(game:GetService("Workspace").Flower2.CFrame)
                        elseif not game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Flower 3") and not game:GetService("Players").LocalPlayer.Character:FindFirstChild("Flower 3") then
                            if game:GetService("Workspace").Enemies:FindFirstChild("Ship Deckhand") or game:GetService("Workspace").Enemies:FindFirstChild("Ship Engineer") or game:GetService("Workspace").Enemies:FindFirstChild("Ship Steward") or game:GetService("Workspace").Enemies:FindFirstChild("Ship Officer") then
                                for _, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                    if (v.Name == "Ship Deckhand" or v.Name == "Ship Engineer" or v.Name == "Ship Steward" or v.Name == "Ship Officer") and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                        repeat task.wait()
                                            AutoHaki()
                                            EquipWeapon(_G.SelectWeapon)
                                            topos(v.HumanoidRootPart.CFrame * CFrame.new(0, 25, 0))
                                            MonFarm = v.Name
                                            PosMon = v.HumanoidRootPart.CFrame
                                            StartBring = true
                                        until not _G.Auto_EvoRace or not v.Parent or v.Humanoid.Health <= 0 or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Flower 3")
                                        StartBring = false
                                    end
                                end
                            else
                                StartBring = false
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(923.213, 126.976, 32852.832))
                            end
                        end
                    elseif game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Alchemist", "1") == 2 then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Alchemist", "3")
                    end
                end
            end
        end
    end)
end)

--//Ê vồ rây vê ba
evo = false

function EvoRaceV3()
    if not evo then
        local repStorage = game:GetService("ReplicatedStorage").Remotes.CommF_
        repStorage:InvokeServer("Wenlocktoad", "1")
        task.wait(1)
        repStorage:InvokeServer("Wenlocktoad", "2")
        evo = true
    end

    local completed = false
    if evo and not completed and not game:GetService("Players").LocalPlayer.PlayerGui.Main.Timer.Visible then
        pcall(function()
            local player = game.Players.LocalPlayer
            if not player.Character or not player.Character:FindFirstChild("HumanoidRootPart") then return end

            local race = player.Data.Race.Value
            local repStorage = game:GetService("ReplicatedStorage").Remotes.CommF_

            if race == "Human" then
                local boss
                if game:GetService("Workspace").Enemies:FindFirstChild("Diamond") then
                    boss = game:GetService("Workspace").Enemies:FindFirstChild("Diamond")
                    repeat task.wait()
                        AutoHaki()
                        EquipWeapon(_G.SelectWeapon)
                        topos(boss.HumanoidRootPart.CFrame * CFrame.new(0, 25, 0))
                    until not boss.Parent or boss.Humanoid.Health <= 0
                    KillDiamond = true
                elseif not KillDiamond then
                    topos(CFrame.new(-1770.862548828125, 198.996871948242188, 6.280265331268311))
                elseif KillDiamond then
                    if game:GetService("Workspace").Enemies:FindFirstChild("Jeremy") then
                        boss = game:GetService("Workspace").Enemies:FindFirstChild("Jeremy")
                        repeat task.wait()
                            AutoHaki()
                            EquipWeapon(_G.SelectWeapon)
                            topos(boss.HumanoidRootPart.CFrame * CFrame.new(0, 25, 0))
                        until not boss.Parent or boss.Humanoid.Health <= 0
                        KillJe = true
                    elseif not KillJe then
                        topos(CFrame.new(2276.175048828125, 450.83477783203125, 752.38623046875))
                    elseif KillJe then
                        if game:GetService("Workspace").Enemies:FindFirstChild("Orbitus") then
                            boss = game:GetService("Workspace").Enemies:FindFirstChild("Orbitus")
                            repeat task.wait()
                                AutoHaki()
                                EquipWeapon(_G.SelectWeapon)
                                topos(boss.HumanoidRootPart.CFrame * CFrame.new(0, 25, 0))
                            until not boss.Parent or boss.Humanoid.Health <= 0
                            Killorb = true
                        elseif not Killorb then
                            topos(CFrame.new(-2121, 88, -4379))
                        end
                    end
                end
                if KillDiamond and KillJe and Killorb then
                    completed = true
                end
            elseif race == "Mink" then
                local chestCount = 0
                repeat
                    local chests = game:GetService("CollectionService"):GetTagged("_ChestTagged")
                    local nearest, distance = nil, math.huge
                    for _, chest in ipairs(chests) do
                        if not chest:GetAttribute("IsDisabled") then
                            local mag = (chest:GetPivot().Position - player.Character:GetPivot().Position).Magnitude
                            if mag < distance then
                                distance, nearest = mag, chest
                            end
                        end
                    end
                    if nearest then
                        topos(nearest:GetPivot())
                        player.Character.Humanoid.Sit = false
                        chestCount = chestCount + 1
                    end
                    task.wait()
                until chestCount >= 30
                completed = true
            elseif race == "Cyborg" then
                local foundFruit = false
                repeat
                    local fruits = {
                        "Rocket-Rocket", "Spin-Spin", "Blade-Blade", "Spring-Spring",
                        "Bomb-Bomb", "Smoke-Smoke", "Spike-Spike", "Flame-Flame",
                        "Falcon-Falcon", "Ice-Ice", "Sand-Sand", "Dark-Dark",
                        "Ghost-Ghost", "Diamond-Diamond", "Light-Light",
                        "Rubber-Rubber", "Barrier-Barrier"
                    }
                    for _, fruit in pairs(fruits) do
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("LoadFruit", fruit)
                        for _, v in pairs(player.Backpack:GetChildren()) do
                            if string.find(v.Name, "Fruit") then
                                foundFruit = true
                                break
                            end
                        end
                        task.wait(1)
                    end
                until foundFruit
                completed = true
            elseif race == "Skypiea" then
                local targetPlayer = nil
                for _, v in pairs(game.Players:GetPlayers()) do
                    if v ~= player and v.Data.Race.Value == race then
                        local targetCharacter = v.Character
                        if targetCharacter and targetCharacter:FindFirstChild("HumanoidRootPart") and targetCharacter.Humanoid.Health > 0 then
                            if not checksafezone(targetCharacter.HumanoidRootPart.Position) and not checkraid(targetCharacter) and not checkNotify() then
                                targetPlayer = v
                                break
                            end
                        end
                    end
                end
                if targetPlayer then
                    repeat task.wait()
                        AutoHaki()
                        EquipWeapon(_G.SelectWeapon)
                        local targetCharacter = targetPlayer.Character
                        if targetCharacter and targetCharacter:FindFirstChild("HumanoidRootPart") then
                            if not checksafezone(targetCharacter.HumanoidRootPart.Position) and not checkraid(targetCharacter) and not checkNotify() then
                                if player.PlayerGui.Main.PvpDisabled.Visible then
                                    repStorage:InvokeServer("EnablePvp")
                                    task.wait(0.5)
                                end
                                local positions = {
                                    CFrame.new(0, 35, 1), CFrame.new(0, 1, 35), CFrame.new(1, 1, -35),
                                    CFrame.new(35, 1, 0), CFrame.new(-35, 1, 0)
                                }
                                topos(targetCharacter.HumanoidRootPart.CFrame * positions[math.random(1, 5)])
                            else
                                targetPlayer = nil
                                for _, v in pairs(game.Players:GetPlayers()) do
                                    if v ~= player and v.Data.Race.Value == race then
                                        local newTargetCharacter = v.Character
                                        if newTargetCharacter and newTargetCharacter:FindFirstChild("HumanoidRootPart") and newTargetCharacter.Humanoid.Health > 0 then
                                            if not checksafezone(newTargetCharacter.HumanoidRootPart.Position) and not checkraid(newTargetCharacter) and not checkNotify() then
                                                targetPlayer = v
                                                break
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    until not targetPlayer or not targetPlayer.Character or not targetPlayer.Character:FindFirstChild("HumanoidRootPart") or targetPlayer.Character.Humanoid.Health <= 0
                end
                completed = true
            elseif race == "Ghoul" then
                local targetPlayer = nil
                for _, v in pairs(game.Players:GetPlayers()) do
                    if v ~= player then
                        local targetCharacter = v.Character
                        if targetCharacter and targetCharacter:FindFirstChild("HumanoidRootPart") and targetCharacter.Humanoid.Health > 0 then
                            if not checksafezone(targetCharacter.HumanoidRootPart.Position) and not checkraid(targetCharacter) and not checkNotify() then
                                targetPlayer = v
                                break
                            end
                        end
                    end
                end
                if targetPlayer then
                    repeat task.wait()
                        AutoHaki()
                        EquipWeapon(_G.SelectWeapon)
                        local targetCharacter = targetPlayer.Character
                        if targetCharacter and targetCharacter:FindFirstChild("HumanoidRootPart") then
                            if not checksafezone(targetCharacter.HumanoidRootPart.Position) and not checkraid(targetCharacter) and not checkNotify() then
                                if player.PlayerGui.Main.PvpDisabled.Visible then
                                    repStorage:InvokeServer("EnablePvp")
                                    task.wait(0.5)
                                end
                                local positions = {
                                    CFrame.new(0, 35, 1), CFrame.new(0, 1, 35), CFrame.new(1, 1, -35),
                                    CFrame.new(35, 1, 0), CFrame.new(-35, 1, 0)
                                }
                                topos(targetCharacter.HumanoidRootPart.CFrame * positions[math.random(1, 5)])
                            else
                                targetPlayer = nil
                                for _, v in pairs(game.Players:GetPlayers()) do
                                    if v ~= player then
                                        local newTargetCharacter = v.Character
                                        if newTargetCharacter and newTargetCharacter:FindFirstChild("HumanoidRootPart") and newTargetCharacter.Humanoid.Health > 0 then
                                            if not checksafezone(newTargetCharacter.HumanoidRootPart.Position) and not checkraid(newTargetCharacter) and not checkNotify() then
                                                targetPlayer = v
                                                break
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    until not targetPlayer or not targetPlayer.Character or not targetPlayer.Character:FindFirstChild("HumanoidRootPart") or targetPlayer.Character.Humanoid.Health <= 0
                end
                completed = true
            elseif race == "Fishman" then
                local SelectBoat = "PirateBrigade"
                local buyCoordinates = CFrame.new(-5326.291015625, 5.030991554260254, -712.1959838867188)
                local destination = CFrame.new(-6788.043945, -4.713245, 2117.271484)
                local boat = nil
                for _, v in pairs(game:GetService("Workspace").Boats:GetChildren()) do
                    if v:FindFirstChild("Owner") and v.Owner.Value == player then
                        boat = v
                        break
                    end
                end
                if not boat then
                    TPP(buyCoordinates)
                    if (buyCoordinates.Position - player.Character.HumanoidRootPart.Position).Magnitude <= 10 then
                        repStorage:InvokeServer("BuyBoat", SelectBoat)
                    end
                else
                    if not player.Character.Humanoid.Sit then
                        TPP(boat.VehicleSeat.CFrame * CFrame.new(0, 1, 0))
                    else
                        local distance = (boat.VehicleSeat.Position - destination.Position).Magnitude
                        if distance > 350 then
                            for _, v in pairs(boat:GetDescendants()) do
                                if v:IsA("BasePart") then
                                    v.CanCollide = false
                                    v.Velocity = Vector3.new(0, 0, 0)
                                    v.RotVelocity = Vector3.new(0, 0, 0)
                                end
                            end
                            boat.VehicleSeat.CFrame = CFrame.new(boat.VehicleSeat.Position.X, boat.VehicleSeat.Position.Y, boat.VehicleSeat.Position.Z)
                            TPB2(destination)
                        else
                            for _, v in pairs(boat:GetDescendants()) do
                                if v:IsA("BasePart") then
                                    v.CanCollide = false
                                    v.Velocity = Vector3.new(0, 0, 0)
                                    v.RotVelocity = Vector3.new(0, 0, 0)
                                end
                            end
                            boat.VehicleSeat.CFrame = CFrame.new(boat.VehicleSeat.Position.X, boat.VehicleSeat.Position.Y, boat.VehicleSeat.Position.Z)
                            for _, v in pairs(game:GetService("Workspace").SeaBeasts:GetChildren()) do
                                local seaBeastRoot = v:FindFirstChild("HumanoidRootPart")
                                if seaBeastRoot then
                                    local seaBeastDistance = (player.Character.HumanoidRootPart.Position - seaBeastRoot.Position).Magnitude
                                    if seaBeastDistance <= 800 then
                                        local fixedHeight = seaBeastRoot.Position.Y + 300
                                        repeat task.wait(0.5)
                                            AutoHaki()
                                            topos(CFrame.new(seaBeastRoot.Position.X + 20, fixedHeight, seaBeastRoot.Position.Z + 10))
                                            AimBotSkillPosition = seaBeastRoot
                                            Skillaimbot = true
                                            AimBotSkillPosition = player.Character.HumanoidRootPart.Position - Vector3.new(0, 2, 0)
                                            _G.AutoSkillSea = true
                                            player.Character.Humanoid.Sit = false
                                        until not seaBeastRoot.Parent or v.Health.Value <= 0
                                        Skillaimbot = false
                                        _G.AutoSkillSea = false
                                        completed = true
                                    end
                                end
                            end
                        end
                    end
                end
            end

            if completed then
                local result = repStorage:InvokeServer("Wenlocktoad", "3")
                if result == -2 then
                    return
                end
            end
        end)
    end
end

--//Gét gu
function BuyGhoulFirst()
    local args = {
        [1] = "Ectoplasm",
        [2] = "BuyCheck",
        [3] = 4
    }
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end

local HttpService = game:GetService("HttpService")
local TeleportService = game:GetService("TeleportService")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local key = "lionsextoy"
local folder = "Lion Hub/" .. game.Players.LocalPlayer.Name 
local filename = folder.."/joined_jobs.txt"

local function base64decode(data)
	local b = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'
	data = string.gsub(data, '[^'..b..'=]', '')
	return (data:gsub('.', function(x)
		if x == '=' then return '' end
		local r,f='',(b:find(x)-1)
		for i=6,1,-1 do r=r..(f%2^i - f%2^(i-1) > 0 and '1' or '0') end
		return r
	end):gsub('%d%d%d?%d?%d?%d?%d?%d?', function(x)
		if #x ~= 8 then return '' end
		local c = 0
		for i = 1,8 do c = c + (x:sub(i,i)=='1' and 2^(8-i) or 0) end
		return string.char(c)
	end))
end

local function xor_deobfuscate(data, key)
	local result = {}
	for i = 1, #data do
		local keyByte = key:byte((i - 1) % #key + 1)
		local dataByte = data:byte(i)
		table.insert(result, string.char(bit32.bxor(dataByte, keyByte)))
	end
	return table.concat(result)
end

local function getDeobfuscatedJobIds()
	local request = (syn and syn.request) or (http and http.request) or request
	local res = request({
		Url = "http://103.65.235.97:5000/cursed",
		Method = "GET"
	})
	local data = HttpService:JSONDecode(res.Body)
	local jobTable = data.jobId
	local result = {}
	for obfKey, _ in pairs(jobTable) do
		local b64 = string.split(obfKey, "_")[2]
		local decoded = base64decode(b64)
		local deobf = xor_deobfuscate(decoded, key)
		table.insert(result, deobf)
	end
	return result
end

local function readJoinedJobs()
	if isfile(filename) then
		local content = readfile(filename)
		local lines = {}
		for line in string.gmatch(content, "[^\r\n]+") do
			lines[line] = true
		end
		return lines
	end
	return {}
end

local function countJoinedJobs()
	if isfile(filename) then
		local content = readfile(filename)
		local count = 0
		for _ in string.gmatch(content, "[^\r\n]+") do
			count = count + 1
		end
		return count
	end
	return 0
end

local function appendJobId(id)
	if countJoinedJobs() >= 5 then
		writefile(filename, "")
	end
	appendfile(filename, id.."\n")
end

local function JoinNextJob()
	local jobs = getDeobfuscatedJobIds()
	local joined = readJoinedJobs()
	for _, id in ipairs(jobs) do
		if not joined[tostring(id)] then
			appendJobId(tostring(id))
			task.wait(1)
			TeleportService:TeleportToPlaceInstance(game.PlaceId, id, Players.LocalPlayer)
			return
		end
	end
end

function FarmEctoplasm()
    local char = game.Players.LocalPlayer.Character
    if not char or not char:FindFirstChild("HumanoidRootPart") then return false end

    local shipEnemies = {"Ship Deckhand", "Ship Engineer", "Ship Steward", "Ship Officer"}
    local foundEnemy = false
    
    for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
        if table.find(shipEnemies, v.Name) and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
            if (char.HumanoidRootPart.Position - v.HumanoidRootPart.Position).Magnitude <= 900 then
                repeat task.wait()
                    AutoHaki()
                    EquipWeapon(_G.SelectWeapon)
                    topos(v.HumanoidRootPart.CFrame * CFrame.new(0, 25, 0))
                    MonFarm = v.Name
                    PosMon = v.HumanoidRootPart.CFrame
                    StartBring = true
                    sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
                until not _G.AutoGhoul or not v.Parent or v.Humanoid.Health <= 0
                StartBring = false
                foundEnemy = true
            end
        end
    end
    
    for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
        if table.find(shipEnemies, v.Name) and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
            repeat task.wait()
                AutoHaki()
                EquipWeapon(_G.SelectWeapon)
                topos(v.HumanoidRootPart.CFrame * CFrame.new(0, 25, 0))
                MonFarm = v.Name
                PosMon = v.HumanoidRootPart.CFrame
                StartBring = true
                sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
            until not _G.AutoGhoul or not v.Parent or v.Humanoid.Health <= 0
            StartBring = false
            foundEnemy = true
        end
    end

    if not foundEnemy then
        local entrancePos = CFrame.new(923.213, 126.976, 32852.832)
        if (char.HumanoidRootPart.Position - entrancePos.Position).Magnitude > 1500 then
            topos(entrancePos)
            task.wait(1)
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", entrancePos.Position)
        else
            topos(entrancePos)
        end
    end
    return foundEnemy
end

function GetGhoul()
    if not _G.AutoGhoul then return end

    local player = game.Players.LocalPlayer
    local char = player.Character
    if not char or not char:FindFirstChild("HumanoidRootPart") then return end

    BuyGhoulFirst()
    task.wait(1)

    if player.Data.Race.Value == "Ghoul" then
        game.StarterGui:SetCore("SendNotification", {
            Title = "Lion Hub",
            Text = "Ghoul Race Completed.",
            Duration = 3
        })
        _G.AutoGhoul = false
        return
    end

    local ectoplasmCount = GetCountMaterials("Ectoplasm")
    if ectoplasmCount >= 100 then
        local cursedCaptain = CheckBoss("Cursed Captain")
        if cursedCaptain then
            repeat task.wait()
                AutoHaki()
                EquipWeapon(_G.SelectWeapon)
                topos(cursedCaptain.HumanoidRootPart.CFrame * CFrame.new(7, 20, 0))
            until not _G.AutoGhoul or not cursedCaptain or not cursedCaptain.Parent or cursedCaptain.Humanoid.Health <= 0
            task.wait(2)
        else
            game.StarterGui:SetCore("SendNotification", {
                Title = "Lion Hub",
                Text = "Cursed Captain not found. Hopping server...",
                Duration = 3
            })
            if _G.UseApi then
            JoinNextJob()
            else
                Hop()
            end
            task.wait(3)
            return
        end

        if player.Backpack:FindFirstChild("Hellfire Torch") or char:FindFirstChild("Hellfire Torch") then
            local ghoulPos = CFrame.new(918.615234, 122.202454, 33454.3789, -0.999998808, 0, 0.00172644004, 0, 1, 0, -0.00172644004, 0, -0.999998808)
            if (ghoulPos.Position - char.HumanoidRootPart.Position).Magnitude <= 8 then
                local args = {
                    [1] = "Ectoplasm",
                    [2] = "Buy",
                    [3] = 4
                }
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                game.StarterGui:SetCore("SendNotification", {
                    Title = "Lion Hub",
                    Text = "Ghoul Race Completed.",
                    Duration = 3
                })
                _G.AutoGhoul = false
            else
                topos(ghoulPos)
            end
        end
    else
        game.StarterGui:SetCore("SendNotification", {
            Title = "Lion Hub",
            Text = "Ectoplasm: " .. ectoplasmCount .. "/100. Need " .. (100 - ectoplasmCount) .. " more.",
            Duration = 3
        })
        FarmEctoplasm()
    end
end

--// gét sai bon
spawn(function()
    while task.wait(0.1) do
        if not _G.AutoCyborg then break end
        
        if not game.Players.LocalPlayer.Character or not game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then continue end
        
        BuyCyborgFirst()
        task.wait(1)
        
        if game.Players.LocalPlayer.Data.Race.Value == "Cyborg" then
            game.StarterGui:SetCore("SendNotification", { Title = "Lion Hub", Text = "Cyborg Race Completed.", Duration = 3 })
            _G.AutoCyborg = false
            break
        end
        
        if game.Players.LocalPlayer.Backpack:FindFirstChild("Energy Core") or game.Players.LocalPlayer.Character:FindFirstChild("Energy Core") then
            fireclickdetector(game.Workspace.Map.CircleIsland.RaidSummon.Button.Main.ClickDetector)
            task.wait(1)
            BuyCyborgFirst()
            game.StarterGui:SetCore("SendNotification", { Title = "Lion Hub", Text = "Cyborg Race Completed.", Duration = 3 })
            _G.AutoCyborg = false
            break
        end

        if (CheckNotificationText("Không tìm thấy con Chip.") or CheckNotificationText("Microchip not found.")) and 
           not game.Players.LocalPlayer.Backpack:FindFirstChild("Fist of Darkness") and not game.Players.LocalPlayer.Character:FindFirstChild("Fist of Darkness") then
            game.StarterGui:SetCore("SendNotification", { Title = "Lion Hub", Text = "Not Find Fist Of Darkness, Go Farm Chest", Duration = 3 })

            repeat
                local Chests = game:GetService("CollectionService"):GetTagged("_ChestTagged")
                local Nearest, Distance = nil, math.huge
                
                for _, Chest in ipairs(Chests) do
                    if not Chest:GetAttribute("IsDisabled") then
                        local Magnitude = (Chest:GetPivot().Position - game.Players.LocalPlayer.Character:GetPivot().Position).Magnitude
                        if Magnitude < Distance then
                            Distance, Nearest = Magnitude, Chest
                        end
                    end
                end
                
                if Nearest then
                    topos(Nearest:GetPivot())
                    if game.Players.LocalPlayer.Character.Humanoid.Sit == true then
                        game.Players.LocalPlayer.Character.Humanoid.Sit = false
                    end
                    task.wait(0.5)
                    if not Nearest.Parent then 
                        Nearest = nil
                    end
                end
                task.wait(0.1) 
            until not _G.AutoCyborg or game.Players.LocalPlayer.Backpack:FindFirstChild("Fist of Darkness") or game.Players.LocalPlayer.Character:FindFirstChild("Fist of Darkness") or 
                  CheckNotificationText("Fist of Darkness của bạn đã được xử lý. Vui lòng cung cấp Core Brain để tiếp tục.") or 
                  CheckNotificationText("Your Fist of Darkness has been processed. Please supply a Core Brain to continue.")
        end

        if game.Players.LocalPlayer.Backpack:FindFirstChild("Fist of Darkness") or game.Players.LocalPlayer.Character:FindFirstChild("Fist of Darkness") then
            fireclickdetector(game.Workspace.Map.CircleIsland.RaidSummon.Button.Main.ClickDetector)
        end

        if CheckNotificationText("Fist of Darkness của bạn đã được xử lý. Vui lòng cung cấp Core Brain để tiếp tục.") or 
           CheckNotificationText("Your Fist of Darkness has been processed. Please supply a Core Brain to continue.") then
            game.StarterGui:SetCore("SendNotification", { Title = "Lion Hub", Text = "Fist of Darkness has been processed, Go Farm Law For Core Brain", Duration = 3 })

            if not game.Players.LocalPlayer.Character:FindFirstChild("Microchip") and not game.Players.LocalPlayer.Backpack:FindFirstChild("Microchip") then
                task.wait(1)
                game.ReplicatedStorage.Remotes.CommF_:InvokeServer("BlackbeardReward", "Microchip", "1")
                game.ReplicatedStorage.Remotes.CommF_:InvokeServer("BlackbeardReward", "Microchip", "2")
            end

            if game.Players.LocalPlayer.Character:FindFirstChild("Microchip") or game.Players.LocalPlayer.Backpack:FindFirstChild("Microchip") then
                fireclickdetector(game.Workspace.Map.CircleIsland.RaidSummon.Button.Main.ClickDetector)
            end

            local order = game.Workspace.Enemies:FindFirstChild("Order") or game.ReplicatedStorage:FindFirstChild("Order")
            if order then
                if order.Parent == game.Workspace.Enemies and order:FindFirstChild("Humanoid") and order:FindFirstChild("HumanoidRootPart") and order.Humanoid.Health > 0 then
                    repeat
                        task.wait()
                        AutoHaki()
                        EquipWeapon(_G.SelectWeapon)
                        topos(order.HumanoidRootPart.CFrame * CFrame.new(10, 20, 10))
                    until not _G.AutoCyborg or not order.Parent or order.Humanoid.Health <= 0 or game.Players.LocalPlayer.Backpack:FindFirstChild("Core Brain") or game.Players.LocalPlayer.Character:FindFirstChild("Core Brain")
                elseif order.Parent == game.ReplicatedStorage then
                    topos(CFrame.new(-6217.202, 28.0476, -5053.135))
                end
            end

            if game.Players.LocalPlayer.Backpack:FindFirstChild("Core Brain") or game.Players.LocalPlayer.Character:FindFirstChild("Core Brain") then
                fireclickdetector(game.Workspace.Map.CircleIsland.RaidSummon.Button.Main.ClickDetector)
            end
        end
    end
end)

--//nhà văn máy
function Factory()
if not game.Players.LocalPlayer.Character or not game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then return end
if CheckBoss("Core") then
topos(CFrame.new(448.46756, 199.356781, -441.389252))
AutoHaki()
EquipWeapon(_G.SelectWeapon)
end
end

function RainBow()
    if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
        topos(CFrame.new(-11892.0703125, 930.57672119141, -8760.1591796875))
        if (Vector3.new(-11892.0703125, 930.57672119141, -8760.1591796875) - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 30 then
            wait(1.5)
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("HornedMan","Bet")
        end
    elseif game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true and string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Stone") then
        if game:GetService("Workspace").Enemies:FindFirstChild("Stone") then
            for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                if v.Name == "Stone" then
                    repeat task.wait()
                        EquipWeapon(_G.SelectWeapon)
                        topos(v.HumanoidRootPart.CFrame * CFrame.new(10, 20, 10)) 
                        sethiddenproperty(game:GetService("Players").LocalPlayer,"SimulationRadius",math.huge)
                    until v.Humanoid.Health <= 0 or not v.Parent or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false
                end
            end
        else
            topos(CFrame.new(-1086.11621, 38.8425903, 6768.71436, 0.0231462717, -0.592676699, 0.805107772, 2.03251839e-05, 0.805323839, 0.592835128, -0.999732077, -0.0137055516, 0.0186523199))
        end
    elseif game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true and string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Island Empress") then
        if game:GetService("Workspace").Enemies:FindFirstChild("Island Empress") then
            for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                if v.Name == "Island Empress" then
                    repeat task.wait()
                        EquipWeapon(_G.SelectWeapon)
                        topos(v.HumanoidRootPart.CFrame * CFrame.new(10, 20, 10)) 
                        sethiddenproperty(game:GetService("Players").LocalPlayer,"SimulationRadius",math.huge)
                    until v.Humanoid.Health <= 0 or not v.Parent or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false
                end
            end
        else
            topos(CFrame.new(5558.84716796875, 1106.465087890625, 104.48194885253906))
        end
    elseif string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Kilo Admiral") then
        if game:GetService("Workspace").Enemies:FindFirstChild("Kilo Admiral") then
            for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                if v.Name == "Kilo Admiral" then
                    repeat task.wait()
                        EquipWeapon(_G.SelectWeapon)
                        topos(v.HumanoidRootPart.CFrame * CFrame.new(10, 20, 10)) 
                        sethiddenproperty(game:GetService("Players").LocalPlayer,"SimulationRadius",math.huge)
                    until v.Humanoid.Health <= 0 or not v.Parent or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false
                end
            end
        else
            topos(CFrame.new(2681.2736816406, 1682.8092041016, -7190.9853515625))
        end
    elseif string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Captain Elephant") then
        if game:GetService("Workspace").Enemies:FindFirstChild("Captain Elephant") then
            for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                if v.Name == "Captain Elephant" then
                    repeat task.wait()
                        EquipWeapon(_G.SelectWeapon)
                        topos(v.HumanoidRootPart.CFrame * CFrame.new(10, 20, 10)) 
                        sethiddenproperty(game:GetService("Players").LocalPlayer,"SimulationRadius",math.huge)
                    until v.Humanoid.Health <= 0 or not v.Parent or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false
                end
            end
        else
            topos(CFrame.new(-13485.0283, 331.709259, -8012.4873, 0.714521289, 7.98849911e-08, 0.69961375, -1.02065748e-07, 1, -9.94383065e-09, -0.69961375, -6.43015241e-08, 0.714521289))
        end
    elseif string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Beautiful Pirate") then
        if game:GetService("Workspace").Enemies:FindFirstChild("Beautiful Pirate") then
            for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                if v.Name == "Beautiful Pirate" then
                    repeat task.wait()
                        EquipWeapon(_G.SelectWeapon)
                        topos(v.HumanoidRootPart.CFrame * CFrame.new(10, 20, 10)) 
                        sethiddenproperty(game:GetService("Players").LocalPlayer,"SimulationRadius",math.huge)
                    until v.Humanoid.Health <= 0 or not v.Parent or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false
                end
            end
        else
            topos(CFrame.new(5312.3598632813, 20.141201019287, -10.158538818359))
        end
    else
        topos(CFrame.new(-11892.0703125, 930.57672119141, -8760.1591796875))
        if (Vector3.new(-11892.0703125, 930.57672119141, -8760.1591796875) - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 30 then
            wait(1.5)
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("HornedMan","Bet")
        end
    end
end

function PirateRaid()
    local monsters = {
        "Galley Pirate", "Galley Captain", "Raider", "Mercenary", "Vampire", "Zombie", "Snow Trooper",
        "Winter Warrior", "Lab Subordinate", "Horned Warrior", "Magma Ninja", "Lava Pirate",
        "Ship Deckhand", "Ship Engineer", "Ship Steward", "Ship Officer", "Arctic Warrior",
        "Snow Lurker", "Sea Soldier", "Water Fighter"
    }
    
    for _, name in pairs(monsters) do
        local enemy = game:GetService("Workspace").Enemies:FindFirstChild(name)
        if enemy then
            for _, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                if table.find(monsters, v.Name) and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                    repeat 
                        task.wait()
                        AutoHaki()
                        EquipWeapon(_G.SelectWeapon)
                        topos(v.HumanoidRootPart.CFrame * CFrame.new(0, 25, 0))
                        sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge)
                    until v.Humanoid.Health <= 0 or not v.Parent
                end
            end
        end
    end
    
    if CheckNotificationText("The pirates are raiding Castle on the Sea!") or CheckBoss(monsters[1]) then
        topos(CFrame.new(-5344.822, 423.985, -2725.093))
        repeat
            task.wait()
            local foundMonster = false
            for _, monsterName in pairs(monsters) do
                if game:GetService("Workspace").Enemies:FindFirstChild(monsterName) then
                    foundMonster = true
                    break
                end
            end
        until foundMonster or 
              CheckNotificationText("You got a random Blox Fruit for dealing the final blow") or 
              CheckNotificationText("pirate has been awarded a few fragments") or 
              CheckNotificationText("The pirates have stopped raiding")
    end
end

function Citizen()
    if game:GetService("Players").LocalPlayer.Data.Level.Value >= 1800 and game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CitizenQuestProgress").KilledBandits == false then
        if string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Forest Pirate") and string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "50") and game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then
            if game:GetService("Workspace").Enemies:FindFirstChild("Forest Pirate") then
                for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                    if v.Name == "Forest Pirate" then
                        repeat task.wait()
                            pcall(function()
                                EquipWeapon(_G.SelectWeapon)
                                AutoHaki()
                                topos(v.HumanoidRootPart.CFrame * CFrame.new(0, 20, 0))
                                StartBring = true
                                MonFarm = v.Name
                                PosMon = v.HumanoidRootPart.CFrame
                            end)
                        until not v.Parent or v.Humanoid.Health <= 0 or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false
                        StartBring = false
                    end
                end
            else
                StartBring = false
                topos(CFrame.new(-13206.452148438, 425.89199829102, -7964.5537109375))
            end
        else
            topos(CFrame.new(-12443.8671875, 332.40396118164, -7675.4892578125))
            if (Vector3.new(-12443.8671875, 332.40396118164, -7675.4892578125) - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 30 then
                wait(1.5)
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest","CitizenQuest",1)
            end
        end
    elseif game:GetService("Players").LocalPlayer.Data.Level.Value >= 1800 and game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CitizenQuestProgress").KilledBoss == false then
        if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible and string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Captain Elephant") and game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then
            if game:GetService("Workspace").Enemies:FindFirstChild("Captain Elephant") then
                for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                    if v.Name == "Captain Elephant" then
                        repeat task.wait()
                            pcall(function()
                                EquipWeapon(_G.SelectWeapon)
                                AutoHaki()
                                topos(v.HumanoidRootPart.CFrame * CFrame.new(0, 20, 0))
                                sethiddenproperty(game:GetService("Players").LocalPlayer,"SimulationRadius",math.huge)
                            end)
                        until v.Humanoid.Health <= 0 or not v.Parent or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false
                    end
                end
            else
                topos(CFrame.new(-13374.889648438, 421.27752685547, -8225.208984375))
            end
        else
            topos(CFrame.new(-12443.8671875, 332.40396118164, -7675.4892578125))
            if (CFrame.new(-12443.8671875, 332.40396118164, -7675.4892578125).Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 4 then
                wait(1.5)
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CitizenQuestProgress","Citizen")
            end
        end
    elseif game:GetService("Players").LocalPlayer.Data.Level.Value >= 1800 and game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CitizenQuestProgress","Citizen") == 2 then
        topos(CFrame.new(-12512.138671875, 340.39279174805, -9872.8203125))
    end
end

function HakiV2()
if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CitizenQuestProgress","Citizen") == 3 then 
if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Banana") or game.Players.LocalPlayer.Character:FindFirstChild("Banana") and game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Apple") or game.Players.LocalPlayer.Character:FindFirstChild("Apple") and game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Pineapple") or game.Players.LocalPlayer.Character:FindFirstChild("Pineapple") then
repeat 
topos(CFrame.new(-12444.78515625, 332.40396118164, -7673.1806640625)) 
wait() 
until (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-12444.78515625, 332.40396118164, -7673.1806640625)).Magnitude <= 10
wait(.5)
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CitizenQuestProgress","Citizen")
elseif game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Fruit Bowl") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Fruit Bowl") then
repeat 
topos(CFrame.new(-10920.125, 624.20275878906, -10266.995117188)) 
wait() 
until (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-10920.125, 624.20275878906, -10266.995117188)).Magnitude <= 10
wait(.5)
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("KenTalk2","Start")
wait(1)
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("KenTalk2","Buy")
else
if workspace.PineappleSpawner:FindFirstChild("Pineapple") and workspace.PineappleSpawner.Pineapple:FindFirstChild("Handle") and not game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Pineapple") and not game.Players.LocalPlayer.Character:FindFirstChild("Pineapple") then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.PineappleSpawner.Pineapple.Handle.CFrame
elseif workspace.AppleSpawner:FindFirstChild("Apple") and workspace.AppleSpawner.Apple:FindFirstChild("Handle") and not game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Apple") and not game.Players.LocalPlayer.Character:FindFirstChild("Apple") then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.AppleSpawner.Apple.Handle.CFrame
elseif workspace.BananaSpawner:FindFirstChild("Banana") and workspace.BananaSpawner.Banana:FindFirstChild("Handle") and not game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Banana") and not game.Players.LocalPlayer.Character:FindFirstChild("Banana") then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.BananaSpawner.Banana.Handle.CFrame
end
end
end
end

spawn(function()
    while wait() do
        if _G.AutoElitehunter then
            pcall(function()
                if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then
                    if string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Diablo") or string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Deandre") or string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Urban") then
                        if game:GetService("Workspace").Enemies:FindFirstChild("Diablo") or game:GetService("Workspace").Enemies:FindFirstChild("Deandre") or game:GetService("Workspace").Enemies:FindFirstChild("Urban") then
                            for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                if v.Name == "Diablo" or v.Name == "Deandre" or v.Name == "Urban" then
                                    if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                        repeat wait()
                                            AutoHaki()
                                            EquipWeapon(_G.SelectWeapon)
                                            topos(v.HumanoidRootPart.CFrame * CFrame.new(PosX, PosY, PosZ))
                                            sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge)
                                        until not _G.AutoElitehunter or v.Humanoid.Health <= 0 or not v.Parent
                                    end
                                end
                            end
                        else
                            if game:GetService("ReplicatedStorage"):FindFirstChild("Diablo") then
                                topos(game:GetService("ReplicatedStorage"):FindFirstChild("Diablo").HumanoidRootPart.CFrame * CFrame.new(2, 20, 2))
                            elseif game:GetService("ReplicatedStorage"):FindFirstChild("Deandre") then
                                topos(game:GetService("ReplicatedStorage"):FindFirstChild("Deandre").HumanoidRootPart.CFrame * CFrame.new(2, 20, 2))
                            elseif game:GetService("ReplicatedStorage"):FindFirstChild("Urban") then
                                topos(game:GetService("ReplicatedStorage"):FindFirstChild("Urban").HumanoidRootPart.CFrame * CFrame.new(2, 20, 2))
                            end
                        end
                    end
                else
                    if _G.AutoEliteHunterHop and game:GetService("ReplicatedStorage").Remotes["CommF_"]:InvokeServer("EliteHunter") == "I don't have anything for you right now. Come back later." then
                        Hop()
                    else
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EliteHunter")
                    end
                    if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EliteHunter", "Progress") >= 30 and _G.GetYama then
                        repeat
                            task.wait()
                            fireclickdetector(game:GetService("Workspace").Map.Waterfall.SealedKatana.Handle.ClickDetector)
                        until checkInventory("Yama")
                        
                        local monsters = {
    "Galley Pirate", "Galley Captain", "Raider", "Mercenary", "Vampire", "Zombie", "Snow Trooper",
    "Winter Warrior", "Lab Subordinate", "Horned Warrior", "Magma Ninja", "Lava Pirate",
    "Ship Deckhand", "Ship Engineer", "Ship Steward", "Ship Officer", "Arctic Warrior",
    "Snow Lurker", "Sea Soldier", "Water Fighter"
}

for _, v in pairs(game.Workspace:GetChildren()) do
    if string.find(v.Name, "Fruit") and v:FindFirstChild("Handle") and _G.Tweenfruit then
        topos(v.Handle.CFrame)
    elseif string.find(v.Name, "Fruit") and v:FindFirstChild("Handle") and _G.bringfruit then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Handle.CFrame
    end
end

if _G.PirateRaid then
    for _, name in pairs(monsters) do
        if game:GetService("Workspace").Enemies:FindFirstChild(name) then
            for _, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                if table.find(monsters, v.Name) and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                    repeat 
                        task.wait()
                        AutoHaki()
                        EquipWeapon(_G.SelectWeapon)
                        topos(v.HumanoidRootPart.CFrame * CFrame.new(0, 25, 0))
                        sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge)
                    until v.Humanoid.Health <= 0 or not v.Parent
                end
            end
        end
    end
    
    if CheckNotificationText("The pirates are raiding Castle on the Sea!") or CheckBoss(monsters[1]) then
        topos(CFrame.new(-5344.822, 423.985, -2725.093))
        repeat
            task.wait()
            local foundMonster = false
            for _, monsterName in pairs(monsters) do
                if game:GetService("Workspace").Enemies:FindFirstChild(monsterName) then
                    foundMonster = true
                    break
                end
            end
        until foundMonster or 
              CheckNotificationText("You got a random Blox Fruit for dealing the final blow") or 
              CheckNotificationText("pirate has been awarded a few fragments") or 
              CheckNotificationText("The pirates have stopped raiding")
    end
end
                    end
                end
            end)
        end
    end
end)

spawn(function()
    while wait() do
        if _G.GetTushita then
            pcall(function()
                local tu = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TushitaProgress")
                if CheckBoss("rip_indra") and CheckBoss("rip_indra True Form") and game.Players.LocalPlayer.Data.Level.Value >= 2000 then
                    if not tu.OpenedDoor then
                        if game.Players.LocalPlayer.Backpack:FindFirstChild("Holy Torch") or game.Players.LocalPlayer.Character:FindFirstChild("Holy Torch") then
                            EquipWeapon("Holy Torch")
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TushitaProgress", "Torch", 1)
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TushitaProgress", "Torch", 2)
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TushitaProgress", "Torch", 3)
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TushitaProgress", "Torch", 4)
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TushitaProgress", "Torch", 5)
                        elseif game:GetService("ReplicatedStorage"):FindFirstChild("rip_indra True Form") or game.Workspace.Enemies:FindFirstChild("rip_indra True Form") then
                            spawn(function()
                                repeat
                                    game:GetService("VirtualInputManager"):SendKeyEvent(true, "Space", false, game)
                                    task.wait(0.3)
                                    game:GetService("VirtualInputManager"):SendKeyEvent(false, "Space", false, game)
                                until game.Players.LocalPlayer.Backpack:FindFirstChild("Holy Torch") or game.Players.LocalPlayer.Character:FindFirstChild("Holy Torch") or
                                    not (game:GetService("ReplicatedStorage"):FindFirstChild("rip_indra True Form") or game.Workspace.Enemies:FindFirstChild("rip_indra True Form"))
                            end)
                            repeat
                                task.wait(0.1)
                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(5712.865234375, 19.095367431640625, 253.15280151367188)
                            until game.Players.LocalPlayer.Backpack:FindFirstChild("Holy Torch") or game.Players.LocalPlayer.Character:FindFirstChild("Holy Torch") or
                                not (game:GetService("ReplicatedStorage"):FindFirstChild("rip_indra True Form") or game.Workspace.Enemies:FindFirstChild("rip_indra True Form"))
                            if game.Players.LocalPlayer.Backpack:FindFirstChild("Holy Torch") or game.Players.LocalPlayer.Character:FindFirstChild("Holy Torch") then
                                EquipWeapon("Holy Torch")
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TushitaProgress", "Torch", 1)
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TushitaProgress", "Torch", 2)
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TushitaProgress", "Torch", 3)
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TushitaProgress", "Torch", 4)
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TushitaProgress", "Torch", 5)
                            end
                        end
                    elseif tu.OpenedDoor and not checkInventory("Tushita") and CheckBoss("Longma") then
                        KillBoss("Longma")
                    else
                        Hop()
                    end
                elseif not (CheckBoss("rip_indra") and CheckBoss("rip_indra True Form")) and not tu.OpenedDoor and not (game.Players.LocalPlayer.Backpack:FindFirstChild("Holy Torch") or game.Players.LocalPlayer.Character:FindFirstChild("Holy Torch")) and _G.HopBossIndra then
                    HopB("rip")
                    
                local monsters = {
    "Galley Pirate", "Galley Captain", "Raider", "Mercenary", "Vampire", "Zombie", "Snow Trooper",
    "Winter Warrior", "Lab Subordinate", "Horned Warrior", "Magma Ninja", "Lava Pirate",
    "Ship Deckhand", "Ship Engineer", "Ship Steward", "Ship Officer", "Arctic Warrior",
    "Snow Lurker", "Sea Soldier", "Water Fighter"
}

for _, v in pairs(game.Workspace:GetChildren()) do
    if string.find(v.Name, "Fruit") and v:FindFirstChild("Handle") and _G.Tweenfruit then
        topos(v.Handle.CFrame)
    elseif string.find(v.Name, "Fruit") and v:FindFirstChild("Handle") and _G.bringfruit then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Handle.CFrame
    end
end

if _G.PirateRaid then
    for _, name in pairs(monsters) do
        if game:GetService("Workspace").Enemies:FindFirstChild(name) then
            for _, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                if table.find(monsters, v.Name) and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                    repeat 
                        task.wait()
                        AutoHaki()
                        EquipWeapon(_G.SelectWeapon)
                        topos(v.HumanoidRootPart.CFrame * CFrame.new(0, 25, 0))
                        sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge)
                    until v.Humanoid.Health <= 0 or not v.Parent
                end
            end
        end
    end
    
    if CheckNotificationText("The pirates are raiding Castle on the Sea!") or CheckBoss(monsters[1]) then
        topos(CFrame.new(-5344.822, 423.985, -2725.093))
        repeat
            task.wait()
            local foundMonster = false
            for _, monsterName in pairs(monsters) do
                if game:GetService("Workspace").Enemies:FindFirstChild(monsterName) then
                    foundMonster = true
                    break
                end
            end
        until foundMonster or 
              CheckNotificationText("You got a random Blox Fruit for dealing the final blow") or 
              CheckNotificationText("pirate has been awarded a few fragments") or 
              CheckNotificationText("The pirates have stopped raiding")
    end
end
                end
            end)
        end
    end
end)

--// gét CDK
spawn(function()
	while task.wait(0.1) do
		pcall(function()
			if _G.CDKQuest then
				if tostring(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest", "OpenDoor")) ~= "opened" then
					wait(.7)
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest", "OpenDoor")
					wait(.3)
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest", "OpenDoor", true)
				else
					if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest","Progress")["Finished"] == nil then
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest","StartTrial","Good")
					elseif game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest","Progress")["Finished"] == false then
						if tonumber(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest","Progress")["Good"]) == -3 then
							repeat wait() topos(CFrame.new(-4602.5107421875, 16.446542739868164, -2880.998046875)) until (CFrame.new(-4602.5107421875, 16.446542739868164, -2880.998046875).Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 3 or not _G.CDKQuest or tonumber(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest","Progress")["Good"]) == 1
							if (CFrame.new(-4602.5107421875, 16.446542739868164, -2880.998046875).Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 10 then
								wait(.7)
								game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest","BoatQuest",workspace.NPCs:FindFirstChild("apsara Boat Dealer"),"Check")
								wait(.5)
								game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest","BoatQuest",workspace.NPCs:FindFirstChild("apsara Boat Dealer"))
							end
							wait(1)
							repeat wait() topos(CFrame.new(3915.976806640625, 8.234333038330078, -2580.53125)) until (CFrame.new(3915.976806640625, 8.234333038330078, -2580.53125).Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 3 or not _G.CDKQuest or tonumber(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest","Progress")["Good"]) == 1
							if (CFrame.new(3915.976806640625, 8.234333038330078, -2580.53125).Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 10 then
								wait(.7)
								game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest","BoatQuest",workspace.NPCs:FindFirstChild("apsara Boat Dealer"),"Check")
								wait(.5)
								game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest","BoatQuest",workspace.NPCs:FindFirstChild("apsara Boat Dealer"))
							end
							wait(1)
							repeat wait() topos(CFrame.new(-9530.763671875, 7.245208740234375, -8375.5087890625)) until (CFrame.new(-9530.763671875, 7.245208740234375, -8375.5087890625).Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 3 or not _G.CDKQuest or tonumber(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest","Progress")["Good"]) == 1
							if (CFrame.new(-9530.763671875, 7.245208740234375, -8375.5087890625).Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 10 then
								wait(.7)
								game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest","BoatQuest",workspace.NPCs:FindFirstChild("apsara Boat Dealer"),"Check")
								wait(.5)
								game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest","BoatQuest",workspace.NPCs:FindFirstChild("apsara Boat Dealer"))
							end
							task.wait(1)
						elseif tonumber(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest","Progress")["Good"]) == -4 then
							if game:GetService("Workspace").Enemies:FindFirstChildOfClass("Model") then
								for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
									if (v:FindFirstChild("HumanoidRootPart").Position - CFrame.new(-5463.74560546875, 313.7947082519531, -2844.50390625).Position).Magnitude <= 1000 then
										if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v:FindFirstChild("Humanoid").Health > 0 then
											repeat task.wait()
											AutoHaki()
													EquipWeapon(_G.SelectWeapon)
												topos(v.HumanoidRootPart.CFrame * CFrame.new(0, 20, 0))
											until not _G.CDKQuest or v.Humanoid.Health <= 0 or not v.Parent or tonumber(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest","Progress")["Good"]) == 2
											 
										end
									else
										topos(CFrame.new(-5084.20849609375, 314.5412902832031, -2975.078125))
									end
								end
							else
								topos(CFrame.new(-5084.20849609375, 314.5412902832031, -2975.078125))
							end
						elseif tonumber(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest","Progress")["Good"]) == -5 then
							if game:GetService("Workspace").Enemies:FindFirstChild("Cake Queen") then
								for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
									if v.Name == "Cake Queen" then
										if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
											repeat task.wait()
												AutoHaki()
												EquipWeapon(_G.SelectWeapon)
												topos(v.HumanoidRootPart.CFrame * CFrame.new(0, 20, 0))
											until not _G.CDKQuest or not v.Parent or v.Humanoid.Health <= 0 or tonumber(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest","Progress")["Good"]) == 3
											 
										end
									end
								end
							elseif not CheckBoss("Cake Queen") then
							topos(CFrame.new(-731.2034301757812, 381.5658874511719, -11198.4951171875))
							else
								if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - game:GetService("Workspace").Map.HeavenlyDimension.Spawn.Position).Magnitude <= 1000 then
									for i,v in pairs(game:GetService("Workspace").Map.HeavenlyDimension.Exit:GetChildren()) do
										Ex = i
									end
									if Ex == 2 then
										repeat task.wait()
											game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Map.HeavenlyDimension.Exit.CFrame
										until not _G.CDKQuest or tonumber(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest","Progress")["Good"]) == 3
									end
									 
									repeat task.wait()
										repeat task.wait() 
											topos(CFrame.new(-22529.6171875, 5275.77392578125, 3873.5712890625)) 
											for i, v in pairs(game:GetService("Workspace").Map.HeavenlyDimension:GetDescendants()) do
												if v:IsA("ProximityPrompt") then
													game:GetService("VirtualInputManager"):SendKeyEvent(true, Enum.KeyCode.E, false, game)
													task.wait(0.1)
													game:GetService("VirtualInputManager"):SendKeyEvent(false, Enum.KeyCode.E, false, game)
												end
											end

										until (CFrame.new(-22529.6171875, 5275.77392578125, 3873.5712890625).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 5
										wait(2)
										_G.DoneT1 = true
									until not _G.CDKQuest or _G.DoneT1
									repeat task.wait()
										repeat task.wait()
											topos(CFrame.new(-22637.291015625, 5281.365234375, 3749.28857421875)) 
											for i, v in pairs(game:GetService("Workspace").Map.HeavenlyDimension:GetDescendants()) do
												if v:IsA("ProximityPrompt") then
													game:GetService("VirtualInputManager"):SendKeyEvent(true, Enum.KeyCode.E, false, game)
													task.wait(0.1)
													game:GetService("VirtualInputManager"):SendKeyEvent(false, Enum.KeyCode.E, false, game)
												end
											end
										until (CFrame.new(-22637.291015625, 5281.365234375, 3749.28857421875).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 5
										wait(2)
										_G.DoneT2 = true
									until _G.DoneT2 or _G.CDKQuest == false
									repeat wait()
										repeat task.wait() 
											topos(CFrame.new(-22791.14453125, 5277.16552734375, 3764.570068359375)) 
											for i, v in pairs(game:GetService("Workspace").Map.HeavenlyDimension:GetDescendants()) do
												if v:IsA("ProximityPrompt") then
													game:GetService("VirtualInputManager"):SendKeyEvent(true, Enum.KeyCode.E, false, game)
													task.wait(0.1)
													game:GetService("VirtualInputManager"):SendKeyEvent(false, Enum.KeyCode.E, false, game)
												end
											end
										until (CFrame.new(-22791.14453125, 5277.16552734375, 3764.570068359375).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 5
										wait(2)
										_G.DoneT3 = true
									until _G.DoneT3 or _G.CDKQuest == false
									for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
										if (v:FindFirstChild("HumanoidRootPart").Position - CFrame.new(-22695.7012, 5270.93652, 3814.42847, 0.11794927, 3.32185834e-08, 0.99301964, -8.73070718e-08, 1, -2.30819008e-08, -0.99301964, -8.3975138e-08, 0.11794927).Position).Magnitude <= 300 then
											if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v:FindFirstChild("Humanoid").Health > 0 then
												repeat task.wait()
													AutoHaki()
													EquipWeapon(_G.SelectWeapon)
													topos(v.HumanoidRootPart.CFrame * CFrame.new(0, 20, 0))
												until not _G.CDKQuest or v.Humanoid.Health <= 0 or not v.Parent
												
												local monsters = {
    "Galley Pirate", "Galley Captain", "Raider", "Mercenary", "Vampire", "Zombie", "Snow Trooper",
    "Winter Warrior", "Lab Subordinate", "Horned Warrior", "Magma Ninja", "Lava Pirate",
    "Ship Deckhand", "Ship Engineer", "Ship Steward", "Ship Officer", "Arctic Warrior",
    "Snow Lurker", "Sea Soldier", "Water Fighter"
}

for _, v in pairs(game.Workspace:GetChildren()) do
    if string.find(v.Name, "Fruit") and v:FindFirstChild("Handle") and _G.Tweenfruit then
        topos(v.Handle.CFrame)
    elseif string.find(v.Name, "Fruit") and v:FindFirstChild("Handle") and _G.bringfruit then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Handle.CFrame
    end
end

if _G.PirateRaid then
    for _, name in pairs(monsters) do
        if game:GetService("Workspace").Enemies:FindFirstChild(name) then
            for _, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                if table.find(monsters, v.Name) and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                    repeat 
                        task.wait()
                        AutoHaki()
                        EquipWeapon(_G.SelectWeapon)
                        topos(v.HumanoidRootPart.CFrame * CFrame.new(0, 25, 0))
                        sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge)
                    until v.Humanoid.Health <= 0 or not v.Parent
                end
            end
        end
    end
    
    if CheckNotificationText("The pirates are raiding Castle on the Sea!") or CheckBoss(monsters[1]) then
        topos(CFrame.new(-5344.822, 423.985, -2725.093))
        repeat
            task.wait()
            local foundMonster = false
            for _, monsterName in pairs(monsters) do
                if game:GetService("Workspace").Enemies:FindFirstChild(monsterName) then
                    foundMonster = true
                    break
                end
            end
        until foundMonster or 
              CheckNotificationText("You got a random Blox Fruit for dealing the final blow") or 
              CheckNotificationText("pirate has been awarded a few fragments") or 
              CheckNotificationText("The pirates have stopped raiding")
    end
end
											end
										end
									end
								end
							end
						end
					end
				end
			end
		end)
	end
end)

PosMsList = {
	["Pirate Millionaire"] = CFrame.new(-426, 176, 5558),
	["Pistol Billionaire"] = CFrame.new(-83, 127, 6097),
	["Dragon Crew Warrior"] = CFrame.new(6320, 52, -1282),
	["Dragon Crew Archer"] = CFrame.new(6625, 378, 244),
	["Female Islander"] = CFrame.new(4692.7939453125, 797.9766845703125, 858.8480224609375),
	["Giant Islander"] = CFrame.new(4902, 670, 39), 
	["Marine Commodore"] = CFrame.new(2401, 123, -7589),
	["Marine Rear Admiral"] = CFrame.new(3588, 229, -7085),
	["Fishman Raider"] = CFrame.new(-10941, 332, -8760),
	["Fishman Captain"] = CFrame.new(-11035, 332, -9087),
	["Forest Pirate"] = CFrame.new(-13446, 413, -7760),
	["Mythological Pirate"] = CFrame.new(-13510, 584, -6987),
	["Jungle Pirate"] = CFrame.new(-11778, 426, -10592),
	["Musketeer Pirate"] = CFrame.new(-13282, 496, -9565),
	["Reborn Skeleton"] = CFrame.new(-8764, 142, 5963),
	["Living Zombie"] = CFrame.new(-10227, 421, 6161),
	["Demonic Soul"] = CFrame.new(-9579, 6, 6194),
	["Posessed Mummy"] = CFrame.new(-9579, 6, 6194),
	["Peanut Scout"] = CFrame.new(-1993, 187, -10103),
	["Peanut President"] = CFrame.new(-2215, 159, -10474),
	["Ice Cream Chef"] = CFrame.new(-877, 118, -11032),
	["Ice Cream Commander"] = CFrame.new(-877, 118, -11032),
	["Cookie Crafter"] = CFrame.new(-2021, 38, -12028),
	["Cake Guard"] = CFrame.new(-2024, 38, -12026),
	["Baking Staff"] = CFrame.new(-1932, 38, -12848),
	["Head Baker"] = CFrame.new(-1932, 38, -12848),
	["Cocoa Warrior"] = CFrame.new(95, 73, -12309),
	["Chocolate Bar Battler"] = CFrame.new(647, 42, -12401),
	["Sweet Thief"] = CFrame.new(116, 36, -12478),
	["Candy Rebel"] = CFrame.new(47, 61, -12889),
	["Ghost"] = CFrame.new(5251, 5, 1111)
}

task.spawn(function()
	while task.wait() do
		pcall(function()
			if _G.CDKQuest then
				if tostring(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest", "OpenDoor")) ~= "opened" then                  
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest", "OpenDoor")
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest", "OpenDoor", true)
				else
					if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest","Progress")["Finished"] == nil then
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest","StartTrial","Evil")
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest","StartTrial","Evil")
					elseif game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest","Progress")["Finished"] == false then                        
						if tonumber(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest","Progress")["Evil"]) == -3 and tonumber(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest","Progress")["Good"]) == 4 then
							repeat task.wait()
								if not game:GetService("Workspace").Enemies:FindFirstChild("Forest Pirate") then
									topos(CFrame.new(-13223.521484375, 428.1938171386719, -7766.06787109375))
								else
									for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
										if v.Name == "Forest Pirate" then
											PosMon = v.HumanoidRootPart.CFrame
											MonFarm = v.Name
											StartBring = true
											topos(game:GetService("Workspace").Enemies:FindFirstChild("Forest Pirate").HumanoidRootPart.CFrame)
										end
									end
								end
							until tonumber(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest","Progress")["Evil"]) == 1 or not _G.CDKQuest
							StartBring = false
						elseif tonumber(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest","Progress")["Evil"]) == -4 and tonumber(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest","Progress")["Good"]) == 4 then
							for ix,HitMon in pairs(game:GetService("Players").LocalPlayer.QuestHaze:GetChildren()) do
								for NameMonHaze, CFramePos in pairs(PosMsList) do
									if string.find(NameMonHaze,HitMon.Name) and HitMon.Value > 0 then
										if game:GetService("Workspace").Enemies:FindFirstChild(NameMonHaze) then
											for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
												if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v:FindFirstChild("Humanoid").Health > 0 and v:FindFirstChild("HazeESP") then
													repeat task.wait()
														AutoHaki()
														EquipWeapon(_G.SelectWeapon)
														topos(v.HumanoidRootPart.CFrame * CFrame.new(0, 20, 0))
													until not _G.CDKQuest or tonumber(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest","Progress")["Evil"]) == 2
												end
											end
										else
											repeat wait()
												if game:GetService("Workspace").Enemies:FindFirstChild(NameMonHaze) then
													for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
														if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v:FindFirstChild("Humanoid").Health > 0 and v:FindFirstChild("HazeESP") then
															repeat task.wait()
																AutoHaki()
																EquipWeapon(_G.SelectWeapon)
																topos(v.HumanoidRootPart.CFrame * CFrame.new(0, 20, 0))
															until not v:FindFirstChild("HazeESP") or not _G.CDKQuest or tonumber(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest","Progress")["Evil"]) == 2
														end
													end
												else
													if (CFramePos.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 2500 then
														topos(CFramePos)
													end
												end
											until not _G.CDKQuest
										end
									end
								end
							end
						elseif tonumber(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest","Progress")["Evil"]) == -5 and tonumber(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest","Progress")["Good"]) == 4 then
							if game:GetService("Workspace").Map:FindFirstChild("HellDimension") then
								if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - game:GetService("Workspace").Map.HellDimension.Spawn.Position).Magnitude <= 1000 then
									for gg,ez in pairs(game:GetService("Workspace").Map.HellDimension.Exit:GetChildren()) do
										if tonumber(gg) == 2 then
											repeat task.wait()
												game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Map.HellDimension.Exit.CFrame
											until not _G.CDKQuest or tonumber(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest","Progress")["Evil"]) == 3
										end
									end
									 
									AutoHaki()
									EquipWeapon(_G.SelectWeapon)
									if tonumber(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest","Progress")["Evil"]) ~= 3 then
										repeat task.wait()
											repeat task.wait() 
												topos(game:GetService("Workspace").Map.HellDimension.Torch1.Particles.CFrame) 
												for i, v in pairs(game:GetService("Workspace").Map.HellDimension:GetDescendants()) do
													if v:IsA("ProximityPrompt") then
														game:GetService("VirtualInputManager"):SendKeyEvent(true, Enum.KeyCode.E, false, game)
														task.wait(0.1)
														game:GetService("VirtualInputManager"):SendKeyEvent(false, Enum.KeyCode.E, false, game)
													end
												end
											until (game:GetService("Workspace").Map.HellDimension.Torch1.Particles.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 5
											wait(2)
											_G.T1Yama = true
										until not _G.CDKQuest or _G.T1Yama or tonumber(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest","Progress")["Evil"]) == 3
										repeat task.wait()
											repeat task.wait()
												topos(game:GetService("Workspace").Map.HellDimension.Torch2.Particles.CFrame) 
												for i, v in pairs(game:GetService("Workspace").Map.HellDimension:GetDescendants()) do
													if v:IsA("ProximityPrompt") then
														game:GetService("VirtualInputManager"):SendKeyEvent(true, Enum.KeyCode.E, false, game)
														task.wait(0.1)
														game:GetService("VirtualInputManager"):SendKeyEvent(false, Enum.KeyCode.E, false, game)
													end
												end
											until (game:GetService("Workspace").Map.HellDimension.Torch2.Particles.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 5
											wait(2)
											_G.T2Yama = true
										until _G.T2Yama or _G.CDKQuest == false or tonumber(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest","Progress")["Evil"]) == 3
										repeat wait()
											repeat task.wait() 
												topos(game:GetService("Workspace").Map.HellDimension.Torch3.Particles.CFrame) 
												for i, v in pairs(game:GetService("Workspace").Map.HellDimension:GetDescendants()) do
													if v:IsA("ProximityPrompt") then
														game:GetService("VirtualInputManager"):SendKeyEvent(true, Enum.KeyCode.E, false, game)
														task.wait(0.1)
														game:GetService("VirtualInputManager"):SendKeyEvent(false, Enum.KeyCode.E, false, game)
													end
												end
											until (game:GetService("Workspace").Map.HellDimension.Torch3.Particles.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 5 
											wait(2)
											_G.T3Yama = true
										until _G.T3Yama or _G.CDKQuest == false or tonumber(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest","Progress")["Evil"]) == 3
									end
									for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
										if (v:FindFirstChild("HumanoidRootPart").Position - game:GetService("Workspace").Map.HellDimension.Spawn.Position).Magnitude <= 300 then
											if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v:FindFirstChild("Humanoid").Health > 0 then
												repeat task.wait()
													AutoHaki()
													EquipWeapon(_G.SelectWeapon)
													topos(v.HumanoidRootPart.CFrame * CFrame.new(0, 20, 0))
												until not _G.CDKQuest or v.Humanoid.Health <= 0 or not v.Parent or tonumber(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest","Progress")["Evil"]) == 3
												 
											end
										end
									end
								end
							end
						end
					end
				end
			end
		end)
	end
end)

spawn(function()
	while task.wait() do
		pcall(function()
			if _G.CDKQuest then
				if tonumber(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest","Progress")["Evil"]) == -5 then
					if not game:GetService("Workspace").Map:FindFirstChild("HellDimension") or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - game:GetService("Workspace").Map.HellDimension.Spawn.Position).Magnitude > 1000 then
						if game:GetService("Workspace").Enemies:FindFirstChild("Soul Reaper") then
							for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
								if string.find(v.Name , "Soul Reaper") then
									repeat task.wait()
										topos(v.HumanoidRootPart.CFrame)
									until v.Humanoid.Health <= 0 or not _G.CDKQuest or not v.Parent or tonumber(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest","Progress")["Evil"]) == 3 or (game:GetService("Workspace").Map:FindFirstChild("HellDimension") and (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - game:GetService("Workspace").Map.HellDimension.Spawn.Position).Magnitude <= 1000)
								end
							end
						elseif game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Hallow Essence") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Hallow Essence") then
							repeat topos(v.HumanoidRootPart.CFrame * CFrame.new(0, 20, 0)) (CFrame.new(-8932.322265625, 146.83154296875, 6062.55078125)) task.wait() until (CFrame.new(-8932.322265625, 146.83154296875, 6062.55078125).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 8
							EquipWeapon("Hallow Essence")
						elseif game:GetService("ReplicatedStorage"):FindFirstChild("Soul Reaper") and game:GetService("ReplicatedStorage"):FindFirstChild("Soul Reaper").Humanoid.Health > 0 then
							topos(game:GetService("ReplicatedStorage"):FindFirstChild("Soul Reaper").HumanoidRootPart.CFrame)
						else
							if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Bones","Check") < 50 and not game:GetService("Workspace").Enemies:FindFirstChild("Soul Reaper") and not game:GetService("ReplicatedStorage"):FindFirstChild("Soul Reaper") and not game:GetService("Workspace").Map:FindFirstChild("HellDimension") then
								if game:GetService("Workspace").Enemies:FindFirstChild("Reborn Skeleton") or game:GetService("Workspace").Enemies:FindFirstChild("Living Zombie") or game:GetService("Workspace").Enemies:FindFirstChild("Domenic Soul") or game:GetService("Workspace").Enemies:FindFirstChild("Posessed Mummy") then
									for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
										if v.Name == "Reborn Skeleton" or v.Name == "Living Zombie" or v.Name == "Demonic Soul" or v.Name == "Posessed Mummy" then
											if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v:FindFirstChild("Humanoid").Health > 0 then
												repeat task.wait()
													AutoHaki()
													EquipWeapon(_G.SelectWeapon)
													StartBring = true
													MonFarm = v.Name
													PosMon = v.HumanoidRootPart.CFrame
													topos(v.HumanoidRootPart.CFrame * CFrame.new(0, 20, 0))
												until not _G.CDKQuest or v.Humanoid.Health <= 0 or not v.Parent
												StartBring = false
											end
										end
									end
								else
									MagnetWaitY = false
									topos(CFrame.new(-9515.2255859375, 164.0062255859375, 5785.38330078125))
								end
							else
								game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Bones", "Buy", 1, 1)
							end
						end
					end
				end
			end
		end)
	end
end)
task.spawn(function()
	while task.wait() do
		pcall(function()
			if _G.CDKQuest then
			if tonumber(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest","Progress")["Evil"]) == 4 and tonumber(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest","Progress")["Good"]) == 4 then
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest","Progress","Good")
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest","Progress","Evil")
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest","StartTrial","Boss")
				if game:GetService("Workspace").Enemies:FindFirstChild("Cursed Skeleton") then
					for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
						if v.Name == "Cursed Skeleton" then
							if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
								repeat task.wait()
									if game.Players.LocalPlayer.Character:FindFirstChild("Yama") or game.Players.LocalPlayer.Backpack:FindFirstChild("Yama") then
										EquipWeapon("Yama")
									elseif game.Players.LocalPlayer.Character:FindFirstChild("Tushita") or game.Players.LocalPlayer.Backpack:FindFirstChild("Tushita") then
										EquipWeapon("Tushita")
									else
										warn("Yama or Tushita Only!!!")
										wait(5)
									end
									AutoHaki()
									topos(v.HumanoidRootPart.CFrame * CFrame.new(0, 20, 0))
									sethiddenproperty(game.Players.LocalPlayer,"SimulationRadius",math.huge)
								until not _G.CDKQuest or not v.Parent or v.Humanoid.Health <= 0
						       end
							end
						end
					end
				else
					topos(CFrame.new(-12318.193359375, 601.9518432617188, -6538.662109375))
					task.wait(.5)
					topos(game:GetService("Workspace").Map.Turtle.Cursed.BossDoor.CFrame)
				end
			end
		end)
	end
end)

spawn(function()
    while wait() do
        pcall(function()
            if _G.GetSkullGuitar then
                if checkInventory("Skull Guitar") == false then
                    if (CFrame.new(-9681.458984375, 6.139880657196045, 6341.3720703125).Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 5000 then
                        if game:GetService("Workspace").NPCs:FindFirstChild("Skeleton Machine") then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("soulGuitarBuy",true)
                        else
                            if game:GetService("Workspace").Map["Haunted Castle"].Candle1.Transparency == 0 then
                                if game:GetService("Workspace").Map["Haunted Castle"].Placard1.Left.Part.Transparency == 0 then
                                    Quest2 = true
                                    repeat wait() 
                                        topos(CFrame.new(-8762.69140625, 176.84783935546875, 6171.3076171875)) 
                                    until (CFrame.new(-8762.69140625, 176.84783935546875, 6171.3076171875).Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 3 or not _G.GetSkullGuitar
                                    wait(1)
                                    fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"].Placard7.Left.ClickDetector)
                                    wait(1)
                                    fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"].Placard6.Left.ClickDetector)
                                    wait(1)
                                    fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"].Placard5.Left.ClickDetector)
                                    wait(1)
                                    fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"].Placard4.Right.ClickDetector)
                                    wait(1)
                                    fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"].Placard3.Left.ClickDetector)
                                    wait(1)
                                    fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"].Placard2.Right.ClickDetector)
                                    wait(1)
                                    fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"].Placard1.Right.ClickDetector)
                                    wait(1)
                                elseif game:GetService("Workspace").Map["Haunted Castle"].Tablet.Segment1:FindFirstChild("ClickDetector") then
                                    if game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part1:FindFirstChild("ClickDetector") then
                                        Quest4 = true
                                        repeat wait() 
                                            topos(CFrame.new(-9553.5986328125, 65.62338256835938, 6041.58837890625)) 
                                        until (CFrame.new(-9553.5986328125, 65.62338256835938, 6041.58837890625).Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 3 or not _G.GetSkullGuitar
                                        wait(1)
                                        topos(game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part3.CFrame)
                                        wait(1)
                                        fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part3.ClickDetector)
                                        wait(1)
                                        topos(game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part4.CFrame)
                                        wait(1)
                                        fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part4.ClickDetector)
                                        wait(1)
                                        fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part4.ClickDetector)
                                        wait(1)
                                        fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part4.ClickDetector)
                                        wait(1)
                                        topos(game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part6.CFrame)
                                        wait(1)
                                        fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part6.ClickDetector)
                                        wait(1)
                                        fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part6.ClickDetector)
                                        wait(1)
                                        topos(game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part8.CFrame)
                                        wait(1)
                                        fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part8.ClickDetector)
                                        wait(1)
                                        topos(game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part10.CFrame)
                                        wait(1)
                                        fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part10.ClickDetector)
                                        wait(1)
                                        fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part10.ClickDetector)
                                        wait(1)
                                        fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part10.ClickDetector)
                                    else
                                        Quest3 = true
                                        repeat wait() 
                                            topos(CFrame.new(-9553.7392578125, 6.471858024597168, 6072.93505859375)) 
                                        until (CFrame.new(-9553.7392578125, 6.471858024597168, 6072.93505859375).Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 3 or not _G.GetSkullGuitar
                                        wait(1)
                                        fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"].Tablet.Segment1.ClickDetector)
                                        wait(1)
                                        fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"].Tablet.Segment2.ClickDetector)
                                        wait(1)
                                        fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"].Tablet.Segment2.ClickDetector)
                                        wait(1)
                                        fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"].Tablet.Segment4.ClickDetector)
                                        wait(1)
                                        fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"].Tablet.Segment5.ClickDetector)
                                        wait(1)
                                        fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"].Tablet.Segment5.ClickDetector)
                                        wait(1)
                                        fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"].Tablet.Segment6.ClickDetector)
                                        wait(1)
                                        fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"].Tablet.Segment6.ClickDetector)
                                        wait(1)
                                        fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"].Tablet.Segment7.ClickDetector)
                                        wait(1)
                                        fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"].Tablet.Segment8.ClickDetector)
                                        wait(1)
                                        fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"].Tablet.Segment8.ClickDetector)
                                        wait(1)
                                        fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"].Tablet.Segment9.ClickDetector)
                                        wait(1)
                                        fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"].Tablet.Segment9.ClickDetector)
                                        wait(1)
                                        fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"].Tablet.Segment10.ClickDetector)
                                        wait(1)
                                    end
                                else
                                    if game:GetService("Workspace").NPCs:FindFirstChild("Ghost") then
                                        local args = {
                                            [1] = "GuitarPuzzleProgress",
                                            [2] = "Ghost"
                                        }
                                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                                    end
                                    if game.Workspace.Enemies:FindFirstChild("Living Zombie") then
                                        for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
                                            if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                                                if v.Name == "Living Zombie" then
                                                    AutoHaki()
                                                    EquipWeapon(_G.SelectWeapon)
                                                    topos(v.HumanoidRootPart.CFrame * CFrame.new(0, 20, 0))
                                                    MonFarm = v.Name
                                                    PosMon = v.HumanoidRootPart.Position
                                                    StartBring = true
                                                end
                                            end
                                        end
                                    else
                                        topos(CFrame.new(-10160.787109375, 138.6616973876953, 5955.03076171875))
                                    end
                                end
                            else    
                                if string.find(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("gravestoneEvent",2), "Error") then
                                    topos(CFrame.new(-8653.2060546875, 140.98487854003906, 6160.033203125))
                                elseif string.find(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("gravestoneEvent",2), "Nothing") then
                                    wait(10)
                                else
                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("gravestoneEvent",2,true)
                                end
                            end
                        end
                    else
                        topos(CFrame.new(-9681.458984375, 6.139880657196045, 6341.3720703125))
                    end
                else
                    if _G.soulGuitarhop then
                        Hop()
                    end
                end
            end
        end)
    end
end)

task.spawn(function()
    while task.wait() do
        pcall(function()
            if _G.GetRen and not checkInventory("Rengoku") then
                if not game.Players.LocalPlayer.Character or not game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then return end
                if game.Players.LocalPlayer.Backpack:FindFirstChild("Hidden Key") or game.Players.LocalPlayer.Character:FindFirstChild("Hidden Key") then
                    EquipWeapon("Hidden Key")
                    topos(CFrame.new(6571.1201171875, 299.23028564453, -6967.841796875))
                elseif game:GetService("Workspace").Enemies:FindFirstChild("Snow Lurker") or game:GetService("Workspace").Enemies:FindFirstChild("Arctic Warrior") or game:GetService("Workspace").Enemies:FindFirstChild("Awakened Ice Admiral") then
                    for _, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if (v.Name == "Snow Lurker" or v.Name == "Arctic Warrior" or v.Name == "Awakened Ice Admiral") and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                            repeat task.wait()
                                AutoHaki()
                                EquipWeapon(_G.SelectWeapon)
                                MonFarm = v.Name
                                PosMon = v.HumanoidRootPart.CFrame
                                StartBring = true
                                topos(v.HumanoidRootPart.CFrame * CFrame.new(0, 20, 0))
                            until not _G.GetRen or not v.Parent or v.Humanoid.Health <= 0 or game.Players.LocalPlayer.Backpack:FindFirstChild("Hidden Key")
                            StartBring = false
                        end
                    end
                elseif game:GetService("ReplicatedStorage"):FindFirstChild("Awakened Ice Admiral") then
                    topos(game:GetService("ReplicatedStorage"):FindFirstChild("Awakened Ice Admiral").HumanoidRootPart.CFrame * CFrame.new(5, 10, 2))
                else
                    StartBring = false
                    topos(CFrame.new(5525.7045898438, 262.90060424805, -6755.1186523438))
                end
            end
        end)
    end
end)

spawn(function()
    while wait() do
        pcall(function()
            if _G.AutoObservation then
                repeat task.wait()
                    if not game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel") then
                        game:GetService("VirtualUser"):CaptureController()
                        game:GetService("VirtualUser"):SetKeyDown('0x65')
                        wait(2)
                        game:GetService("VirtualUser"):SetKeyUp('0x65')
                    end
                until game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel") or not _G.AutoObservation
            end
        end)
    end
end)

spawn(function()
    pcall(function()
        while wait() do
            if _G.AutoObservation then
            if game:GetService("Players").LocalPlayer.VisionRadius.Value >= 3000 then
                        game:GetService("StarterGui"):SetCore("SendNotification", {
                            Icon = "rbxassetid://123709024751036";
                            Title = "Status Observation", 
                            Text = "You Have Max Points"
                        })
                        wait(2)
            else
                if World2 then
                    local enemy = game:GetService("Workspace").Enemies:FindFirstChild("Lava Pirate")
                    if enemy then
                        if game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel") then
                            repeat task.wait()
                                topos(enemy.HumanoidRootPart.CFrame * CFrame.new(3, 0, 0))
                            until not _G.AutoObservation or not game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel")
                        else
                            repeat task.wait()
                                topos(enemy.HumanoidRootPart.CFrame * CFrame.new(0, 50, 0))
                                wait(1)
                                if not game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel") and _G.AutoObservation_Hop then
                                    game:GetService("TeleportService"):Teleport(game.PlaceId, game:GetService("Players").LocalPlayer)
                                end
                            until not _G.AutoObservation or game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel")
                        end
                    else
                        topos(CFrame.new(-5478.39209, 15.9775667, -5246.9126))
                    end
                elseif World1 then
                    local enemy = game:GetService("Workspace").Enemies:FindFirstChild("Galley Captain")
                    if enemy then
                        if game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel") then
                            repeat task.wait()
                                topos(enemy.HumanoidRootPart.CFrame * CFrame.new(3, 0, 0))
                            until not _G.AutoObservation or not game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel")
                        else
                            repeat task.wait()
                                topos(enemy.HumanoidRootPart.CFrame * CFrame.new(0, 50, 0))
                                wait(1)
                                if not game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel") and _G.AutoObservation_Hop then
                                    game:GetService("TeleportService"):Teleport(game.PlaceId, game:GetService("Players").LocalPlayer)
                                end
                            until not _G.AutoObservation or game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel")
                        end
                    else
                        topos(CFrame.new(5533.29785, 88.1079102, 4852.3916))
                    end
                elseif World3 then
                    local enemy = game:GetService("Workspace").Enemies:FindFirstChild("Marine Commodore")
                    if enemy then
                        if game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel") then
                            repeat task.wait()
                                topos(enemy.HumanoidRootPart.CFrame * CFrame.new(3, 0, 0))
                            until not _G.AutoObservation or not game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel")
                        else
                            repeat task.wait()
                                topos(enemy.HumanoidRootPart.CFrame * CFrame.new(0, 50, 0))
                                wait(1)
                                if not game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel") and _G.AutoObservation_Hop then
                                    game:GetService("TeleportService"):Teleport(game.PlaceId, game:GetService("Players").LocalPlayer)
                                end
                            until not _G.AutoObservation or game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel")
                        end
                    else
                        topos(CFrame.new(2462.396240234375, 74.5496597290039, -7521.6142578125))
                        end
                    end
                end
            end
        end
    end)
end)

local FruitMapping = {
    ["🍎 Bomb-Bomb"] = "Bomb-Bomb",
    ["🌵 Spike-Spike"] = "Spike-Spike",
    ["🔪 Blade-Blade"] = "Blade-Blade",
    ["🌱 Spring-Spring"] = "Spring-Spring",
    ["🚀 Rocket-Rocket"] = "Rocket-Rocket",
    ["🌀 Spin-Spin"] = "Spin-Spin",
    ["🦅 Eagle-Eagle"] = "Eagle-Eagle",
    ["☁️ Smoke-Smoke"] = "Smoke-Smoke",
    ["🔥 Flame-Flame"] = "Flame-Flame",
    ["❄️ Ice-Ice"] = "Ice-Ice",
    ["🏜️ Sand-Sand"] = "Sand-Sand",
    ["🌑 Dark-Dark"] = "Dark-Dark",
    ["👻 Ghost-Ghost"] = "Ghost-Ghost",
    ["💎 Diamond-Diamond"] = "Diamond-Diamond",
    ["💡 Light-Light"] = "Light-Light",
    ["❤️ Love-Love"] = "Love-Love",
    ["🥊 Rubber-Rubber"] = "Rubber-Rubber",
    ["🛡️ Barrier-Barrier"] = "Barrier-Barrier",
    ["🌋 Magma-Magma"] = "Magma-Magma",
    ["🚪 Portal-Portal"] = "Portal-Portal",
    ["🌊 Quake-Quake"] = "Quake-Quake",
    ["🙏 Buddha-Buddha"] = "Buddha-Buddha",
    ["🕸️ String-String"] = "String-String",
    ["🔥 Phoenix-Phoenix"] = "Phoenix-Phoenix",
    ["⚡ Rumble-Rumble"] = "Rumble-Rumble",
    ["🐾 Paw-Paw"] = "Paw-Paw",
    ["🌍 Gravity-Gravity"] = "Gravity-Gravity",
    ["🍩 Dough-Dough"] = "Dough-Dough",
    ["☠️ Venom-Venom"] = "Venom-Venom",
    ["👥 Shadow-Shadow"] = "Shadow-Shadow",
    ["🕹️ Control-Control"] = "Control-Control",
    ["👻 Spirit-Spirit"] = "Spirit-Spirit",
    ["🐉 Dragon-Dragon"] = "Dragon-Dragon",
    ["🐆 Leopard-Leopard"] = "Leopard-Leopard",
    ["💨 Gas-Gas"] = "Gas-Gas",
    ["❄️ Blizzard-Blizzard"] = "Blizzard-Blizzard",
    ["🦊 Kitsune-Kitsune"] = "Kitsune-Kitsune",
    ["🐻‍❄️ Yeti-Yeti"] = "Yeti-Yeti",
    ["🦣 Mammoth-Mammoth"] = "Mammoth-Mammoth"
}

local FruitList = {}
for k, _ in pairs(FruitMapping) do
    table.insert(FruitList, k)
end

spawn(function()
    pcall(function()
        while wait(5) do
            if _G.Buyfruit then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("GetFruits")
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("PurchaseRawFruit", _G.SelectChut)
            end
        end
    end)
end)

spawn(function()
    pcall(function()
        while task.wait(1) do
            if _G.RandomF then
                if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Cousin", "Buy") ~= 1 then
                    task.wait(10)
                else
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Cousin", "Buy")
                end
            end
        end
    end)
end)

spawn(function()
    while wait(0.1) do
        if _G.Tweenfruit then
            for _, v in pairs(game.Workspace:GetChildren()) do
                if string.find(v.Name, "Fruit") and v:FindFirstChild("Handle") then
                    topos(v.Handle.CFrame)
                end
            end
        end
    end
end)

spawn(function()
    while wait(0.1) do
        if _G.bringfruit then
            for _, v in pairs(game.Workspace:GetChildren()) do
                if string.find(v.Name, "Fruit") and v:FindFirstChild("Handle") then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Handle.CFrame
                end
            end
        end
    end
end)

spawn(function()
    while task.wait() do
        if _G.StoreF then
            for _, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                if v:IsA("Tool") and string.find(v.Name, "Fruit") then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", v:GetAttribute("OriginalName"), v)
                end
            end
            for _, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
                if v:IsA("Tool") and string.find(v.Name, "Fruit") then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", v:GetAttribute("OriginalName"), v)
                end
            end
        end
    end
end)

spawn(function()
    while wait() do
        if _G.BuyChipRaid then
            pcall(function()
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("RaidsNpc", "Select", _G.SelectedChip)
            end)
        end
    end
end)

spawn(function()
    pcall(function()
        while task.wait(0.1) do
            if _G.KillRaid and game:GetService("Players").LocalPlayer.PlayerGui.Main.TopHUDList.RaidTimer.Visible then
                if _G.SelectedChip == "Flame" or _G.SelectedChip == "Magma" then
                    for _, v in pairs(game.Workspace:GetDescendants()) do
                        if v.Name == "Lava" then
                            v:Destroy()
                        end
                    end
                end
                local nearestmob = {}
                for _, v in pairs(game.Workspace.Enemies:GetChildren()) do
                    if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                        local distance = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.HumanoidRootPart.Position).Magnitude
                        if distance <= 700 then
                            table.insert(nearestmob, {enemy = v, distance = distance})
                        end
                    end
                end
                if #nearestmob > 0 then
                    table.sort(nearestmob, function(a, b)
                        return a.distance < b.distance
                    end)
                    local v = nearestmob[1].enemy
                    if nearestmob[1].distance <= 700 then
                        repeat
                            task.wait()
                            AutoHaki()
                            EquipWeapon(_G.SelectWeapon)
                            topos(v.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
                        until not _G.KillRaid or not v.Parent or v.Humanoid.Health <= 0 or not game.Workspace.Enemies:FindFirstChild(v.Name) 
                    end
                else
                    local nextIsland = getNextIsland()
                    if nextIsland then
                        topos(nextIsland.CFrame * CFrame.new(0, 80, 0))
                        repeat task.wait() until (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - nextIsland.Position).Magnitude <= 100 or not _G.KillRaid
                    end
                end
            end
        end
    end)
end)

spawn(function()
    clicked = false
    clicktime = 0
    while task.wait(0.1) do
        pcall(function()
            if _G.AutoStartRaid then
                if game:GetService("Players").LocalPlayer.PlayerGui.Main.TopHUDList.RaidTimer.Visible then
                    clicked = false
                elseif tick() - clicktime >= 18 then
                    clicked = false
                end
                if not clicked and not game:GetService("Players").LocalPlayer.PlayerGui.Main.TopHUDList.RaidTimer.Visible then
                    local microchip = game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Special Microchip") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Special Microchip") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Microchip") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Microchip")
                    if microchip then
                        if World2 then
                            pcall(function()
                                fireclickdetector(game:GetService("Workspace").Map.CircleIsland.RaidSummon2.Button.Main.ClickDetector)
                            end)
                        elseif World3 then
                            pcall(function()
                                fireclickdetector(game:GetService("Workspace").Map["Boat Castle"].RaidSummon2.Button.Main.ClickDetector)
                            end)
                        end
                        clicked = true
                        clicktime = tick()
                    end
                end
            end
        end)
    end
end)

function IsIslandRaid(cu)
    local locations = game:GetService("Workspace")["_WorldOrigin"].Locations
    if locations:FindFirstChild("Island " .. cu) then
        local minDistance, closestIsland = 4000, nil
        for _, v in pairs(locations:GetChildren()) do
            if v.Name == "Island " .. cu then
                local distance = (v.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
                if distance < minDistance then
                    minDistance, closestIsland = distance, v
                end
            end
        end
        return closestIsland
    end
end

function getNextIsland()
    local TableIslandsRaid = {5, 4, 3, 2, 1}
    for _, v in ipairs(TableIslandsRaid) do
        local island = IsIslandRaid(v)
        if island and (island.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 4500 then
            return island
        end
    end
end

spawn(function()
    pcall(function()
        while wait(1) do
            if _G.AwaF then
                if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("getAwakenedAbilities") ~= nil and game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("getAwakenedAbilities") ~= '' then
		      		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Awakener","Check")
		     		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Awakener","Awaken")
				end
            end
        end
    end)
end)

spawn(function()
    while task.wait() do
        if _G.GetFruitUnder1m and not game:GetService("Players").LocalPlayer.PlayerGui.Main.TopHUDList.RaidTimer.Visible then
            local found = false
            for _, v in pairs({game.Players.LocalPlayer.Backpack, game.Players.LocalPlayer.Character}) do
                for _, tool in pairs(v:GetChildren()) do
                    if tool:IsA("Tool") and string.find(tool.Name, "Fruit") then
                        found = true
                        break
                    end
                end
                if found then break end
            end
            if not found then
                GetFruitUnder1()
                task.wait(0.1)
            end
        end
    end
end)

spawn(function()
    while true do
        task.wait(1)
        if _G.GravityV2 then
            local success, result = pcall(function()
                return game:GetService("ReplicatedStorage").Modules.Net["RF/HiddenAbilitiesRF"]:InvokeServer({Context = "GetList"})
            end)

            if success and typeof(result) == "table" and result.FruitList and result.FruitList["Gravity-Gravity"] then
                local data = result.FruitList["Gravity-Gravity"]
                CurrentMastery = data.CurrentMastery or 0

                local abilities = data.Abilities
                local ab1, ab2, ab3, ab4 = abilities[1], abilities[2], abilities[3], abilities[4]

                if ab1 then
                    cancomplete1 = ab1.CanComplete or false
                    progress1 = ab1.Progress or 0
                    enabled1 = ab1.Enabled or false
                    owned1 = ab1.Owned or false
                    researching1 = ab1.Experiments and ab1.Experiments[1] and ab1.Experiments[1].Researching or false
                    materialsowned1 = ab1.MaterialsOwned or {}
                end

                if ab2 then
                    cancomplete2 = ab2.CanComplete or false
                    progress2 = ab2.Progress or 0
                    enabled2 = ab2.Enabled or false
                    owned2 = ab2.Owned or false
                    researching2 = ab2.Experiments and ab2.Experiments[1] and ab2.Experiments[1].Researching or false
                    materialsowned2 = ab2.MaterialsOwned or {}
                end

                if ab3 then
                    cancomplete3 = ab3.CanComplete or false
                    progress3 = ab3.Progress or 0
                    enabled3 = ab3.Enabled or false
                    owned3 = ab3.Owned or false
                    researching3 = ab3.Experiments and ab3.Experiments[1] and ab3.Experiments[1].Researching or false
                    materialsowned3 = ab3.MaterialsOwned or {}
                end

                if ab4 then
                    cancomplete4 = ab4.CanComplete or false
                    progress4 = ab4.Progress or 0
                    enabled4 = ab4.Enabled or false
                    owned4 = ab4.Owned or false
                    materialsowned4 = ab4.MaterialsOwned or {}

                    researching4 = ab4.Experiments and ab4.Experiments[1] and ab4.Experiments[1].Researching or false
                    expProgress4 = ab4.Experiments and ab4.Experiments[1] and ab4.Experiments[1].Progress or 0

                    researching5 = ab4.Experiments and ab4.Experiments[2] and ab4.Experiments[2].Researching or false
                    expProgress5 = ab4.Experiments and ab4.Experiments[2] and ab4.Experiments[2].Progress or 0
                end
            end
        end
    end
end)

spawn(function()
    while true do
    task.wait(0.1)
        if _G.GravityV2 then
            if owned1 == false and ((game.Players.LocalPlayer.Backpack:FindFirstChild("Gravity-Gravity") and game.Players.LocalPlayer.Backpack["Gravity-Gravity"].Level.Value >= 200) or (workspace.Characters:FindFirstChild(game.Players.LocalPlayer.Name) and workspace.Characters[game.Players.LocalPlayer.Name]:FindFirstChild("Gravity-Gravity") and workspace.Characters[game.Players.LocalPlayer.Name]["Gravity-Gravity"].Level.Value >= 200)) then
                if researching1 == false then
                    repeat 
                        task.wait(0.1)
                        local args = {
                            [1] = {
                                ["Context"] = "StartResearch",
                                ["AbilityName"] = "KineticAmplifier1"
                            }
                        }
                        game:GetService("ReplicatedStorage").Modules.Net:FindFirstChild("RF/HiddenAbilitiesRF"):InvokeServer(unpack(args))
                    until researching1 == true or owned1 == true or not _G.GravityV2
                elseif researching1 == true and owned1 == false and cancomplete1 == false then
                    if not World1 then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelMain")
                    else
                        if tostring(game.Players.LocalPlayer.Team) == "Pirates" then
                            if game:GetService("Workspace").Enemies:FindFirstChild("Bandit") then
                                for _, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                    if v.Name == "Bandit" and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                        repeat
                                            task.wait(0.1)
                                            AutoHaki()
                                            EquipWeapon(game.Players.LocalPlayer.Data.DevilFruit.Value)
                                            topos(v.HumanoidRootPart.CFrame * CFrame.new(0, 20, 0))
                                            local args = {
                                                [1] = "TAP",
                                                [2] = game.Players.LocalPlayer.Character.HumanoidRootPart.Position,
                                                [3] = v.HumanoidRootPart.Position
                                            }
                                            for _, remote in pairs(game.Players.LocalPlayer.Character.Humanoid:GetChildren()) do
                                                if remote:IsA("RemoteFunction") then
                                                    remote:InvokeServer(unpack(args))
                                                end
                                            end
                                        until not _G.GravityV2 or not v.Parent or v.Humanoid.Health <= 0
                                        Skillaimbot = false
                                    end
                                end
                            else
                                topos(CFrame.new(1059.37195, 15.4495068, 1550.4231))
                            end
                        elseif tostring(game.Players.LocalPlayer.Team) == "Marines" then
                            if game:GetService("Workspace").Enemies:FindFirstChild("Trainee") then
                                for _, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                    if v.Name == "Trainee" and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                        repeat
                                            task.wait(0.1)
                                            AutoHaki()
                                            EquipWeapon(game.Players.LocalPlayer.Data.DevilFruit.Value)
                                            topos(v.HumanoidRootPart.CFrame * CFrame.new(0, 20, 0))
                                            local args = {
                                                [1] = "TAP",
                                                [2] = game.Players.LocalPlayer.Character.HumanoidRootPart.Position,
                                                [3] = v.HumanoidRootPart.Position
                                            }
                                            for _, remote in pairs(game.Players.LocalPlayer.Character.Humanoid:GetChildren()) do
                                                if remote:IsA("RemoteFunction") then
                                                    remote:InvokeServer(unpack(args))
                                                end
                                            end
                                        until not _G.GravityV2 or not v.Parent or v.Humanoid.Health <= 0
                                    end
                                end
                            else
                                topos(CFrame.new(-2708.5769, 23.4660034, 2105.3479))
                            end
                        end
                    end
                elseif owned1 == false and cancomplete1 == true then
                    if GetCountMaterials("Radioactive Material") < 2 then
                        if not World2 then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelDressrosa")
                        else
                            if game:GetService("Workspace").Enemies:FindFirstChild("Factory Staff") then
                                for _, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                    if v.Name == "Factory Staff" and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                        repeat
                                            task.wait(0.1)
                                            AutoHaki()
                                            EquipWeapon(_G.SelectWeapon)
                                            topos(v.HumanoidRootPart.CFrame * CFrame.new(0, 20, 0))
                                        until not _G.GravityV2 or not v.Parent or v.Humanoid.Health <= 0 or GetCountMaterials("Radioactive Material") >= 2
                                    end
                                end
                            else
                                topos(CFrame.new(533.22045898438, 128.46876525879, 355.62615966797))
                            end
                        end
                    elseif GetCountMaterials("Mystic Droplet") < 1 and GetCountMaterials("Radioactive Material") >= 2 then
                        if not World2 then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelDressrosa")
                        else
                            if game:GetService("Workspace").Enemies:FindFirstChild("Water Fighter") then
                                for _, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                    if v.Name == "Water Fighter" and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                        repeat
                                            task.wait(0.1)
                                            AutoHaki()
                                            EquipWeapon(_G.SelectWeapon)
                                            topos(v.HumanoidRootPart.CFrame * CFrame.new(0, 20, 0))
                                        until not _G.GravityV2 or not v.Parent or v.Humanoid.Health <= 0 or GetCountMaterials("Mystic Droplet") >= 1
                                    end
                                end
                            else
                                topos(CFrame.new(-3214, 298, -10535))
                            end
                        end
                    elseif GetCountMaterials("Mystic Droplet") >= 1 and GetCountMaterials("Radioactive Material") >= 2 and cancomplete1 == true then
                        repeat
                            task.wait(0.1)
                            local args = {
                                [1] = {
                                    ["Context"] = "CraftAbility",
                                    ["AbilityName"] = "KineticAmplifier1"
                                }
                            }
                            game:GetService("ReplicatedStorage").Modules.Net:FindFirstChild("RF/HiddenAbilitiesRF"):InvokeServer(unpack(args))
                        until owned1 == true or not _G.GravityV2
                    end
                end
            end
        end
        task.wait()
    end
end)

spawn(function()
    while true do
    task.wait(0.1)
        if _G.GravityV2 then
            if owned1 == true and owned2 == false and ((game.Players.LocalPlayer.Backpack:FindFirstChild("Gravity-Gravity") and game.Players.LocalPlayer.Backpack["Gravity-Gravity"].Level.Value >= 300) or (workspace.Characters:FindFirstChild(game.Players.LocalPlayer.Name) and workspace.Characters[game.Players.LocalPlayer.Name]:FindFirstChild("Gravity-Gravity") and workspace.Characters[game.Players.LocalPlayer.Name]["Gravity-Gravity"].Level.Value >= 300)) then
                if researching2 == false then
                    repeat 
                        task.wait(0.1)
                        local args = {
                            [1] = {
                                ["Context"] = "StartResearch",
                                ["AbilityName"] = "KineticAmplifier2"
                            }
                        }
                        game:GetService("ReplicatedStorage").Modules.Net:FindFirstChild("RF/HiddenAbilitiesRF"):InvokeServer(unpack(args))
                    until researching2 == true or owned2 == true or not _G.GravityV2
                elseif researching2 == true and owned2 == false and cancomplete2 == false then
                    if not World1 then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelMain")
                    else
                        if tostring(game.Players.LocalPlayer.Team) == "Pirates" then
                            if game:GetService("Workspace").Enemies:FindFirstChild("Bandit") then
                                for _, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                    if v.Name == "Bandit" and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                        repeat
                                            task.wait(0.1)
                                            AutoHaki()
                                            EquipWeapon(game.Players.LocalPlayer.Data.DevilFruit.Value)
                                            topos(v.HumanoidRootPart.CFrame * CFrame.new(0, 20, 0))
                                            local args = {
                                                [1] = "TAP",
                                                [2] = game.Players.LocalPlayer.Character.HumanoidRootPart.Position,
                                                [3] = v.HumanoidRootPart.Position
                                            }
                                            for _, remote in pairs(game.Players.LocalPlayer.Character.Humanoid:GetChildren()) do
                                                if remote:IsA("RemoteFunction") then
                                                    remote:InvokeServer(unpack(args))
                                                end
                                            end
                                        until not _G.GravityV2 or not v.Parent or v.Humanoid.Health <= 0
                                    end
                                end
                            else
                                topos(CFrame.new(1059.37195, 15.4495068, 1550.4231))
                            end
                        elseif tostring(game.Players.LocalPlayer.Team) == "Marines" then
                            if game:GetService("Workspace").Enemies:FindFirstChild("Trainee") then
                                for _, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                    if v.Name == "Trainee" and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                        repeat
                                            task.wait(0.1)
                                            AutoHaki()
                                            EquipWeapon(game.Players.LocalPlayer.Data.DevilFruit.Value)
                                            topos(v.HumanoidRootPart.CFrame * CFrame.new(0, 20, 0))
                                            local args = {
                                                [1] = "TAP",
                                                [2] = game.Players.LocalPlayer.Character.HumanoidRootPart.Position,
                                                [3] = v.HumanoidRootPart.Position
                                            }
                                            for _, remote in pairs(game.Players.LocalPlayer.Character.Humanoid:GetChildren()) do
                                                if remote:IsA("RemoteFunction") then
                                                    remote:InvokeServer(unpack(args))
                                                end
                                            end
                                        until not _G.GravityV2 or not v.Parent or v.Humanoid.Health <= 0
                                    end
                                end
                            else
                                topos(CFrame.new(-2708.5769, 23.4660034, 2105.3479))
                            end
                        end
                    end
                elseif owned2 == false and cancomplete2 == true then
                    if GetCountMaterials("Radioactive Material") < 4 then
                        if not World2 then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelDressrosa")
                        else
                            if game:GetService("Workspace").Enemies:FindFirstChild("Factory Staff") then
                                for _, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                    if v.Name == "Factory Staff" and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                        repeat
                                            task.wait(0.1)
                                            AutoHaki()
                                            EquipWeapon(_G.SelectWeapon)
                                            topos(v.HumanoidRootPart.CFrame * CFrame.new(0, 20, 0))
                                        until not _G.GravityV2 or not v.Parent or v.Humanoid.Health <= 0 or GetCountMaterials("Radioactive Material") >= 4
                                    end
                                end
                            else
                                topos(CFrame.new(533.22045898438, 128.46876525879, 355.62615966797))
                            end
                        end
                    elseif GetCountMaterials("Mystic Droplet") < 2 and GetCountMaterials("Radioactive Material") >= 4 then
                        if not World2 then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelDressrosa")
                        else
                            if game:GetService("Workspace").Enemies:FindFirstChild("Water Fighter") then
                                for _, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                    if v.Name == "Water Fighter" and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                        repeat
                                            task.wait(0.1)
                                            AutoHaki()
                                            EquipWeapon(_G.SelectWeapon)
                                            topos(v.HumanoidRootPart.CFrame * CFrame.new(0, 20, 0))
                                        until not _G.GravityV2 or not v.Parent or v.Humanoid.Health <= 0 or GetCountMaterials("Mystic Droplet") >= 2
                                    end
                                end
                            else
                                topos(CFrame.new(-3214, 298, -10535))
                            end
                        end
                    elseif GetCountMaterials("Mystic Droplet") >= 2 and GetCountMaterials("Radioactive Material") >= 4 and cancomplete2 == true then
                        repeat
                            task.wait(0.1)
                            local args = {
                                [1] = {
                                    ["Context"] = "CraftAbility",
                                    ["AbilityName"] = "KineticAmplifier2"
                                }
                            }
                            game:GetService("ReplicatedStorage").Modules.Net:FindFirstChild("RF/HiddenAbilitiesRF"):InvokeServer(unpack(args))
                        until owned2 == true or not _G.GravityV2
                    end
                end
            end
        end
        task.wait()
    end
end)

function CheckShip()
    if not game.Players.LocalPlayer.Character or not game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
        return false
    end

    local playerPosition = game.Players.LocalPlayer.Character.HumanoidRootPart.Position

    for _, folder in pairs({game.Workspace.Enemies, game.Workspace.SeaBeasts}) do
        for _, enemy in pairs(folder:GetChildren()) do
            if table.find({"Shark", "Terrorshark", "Piranha", "Fish Crew Member", "SeaBeast1"}, enemy.Name) then
                if enemy:FindFirstChild("HumanoidRootPart") and (enemy.HumanoidRootPart.Position - playerPosition).Magnitude <= 800 then
                    return "normal_enemy"
                end
            elseif table.find({"PirateBrigade", "PirateGrandBrigade", "FishBoat", "PirateBasic"}, enemy.Name) then
                if enemy:FindFirstChild("HumanoidRootPart") and (enemy.HumanoidRootPart.Position - playerPosition).Magnitude <= 800 then
                    return "ship_enemy"
                end
                if enemy:FindFirstChild("VehicleSeat") and (enemy.VehicleSeat.Position - playerPosition).Magnitude <= 800 then
                    return "ship_enemy"
                end
            end
        end
    end

    return false
end

function FarmShip()
    local fishBoat = game:GetService("Workspace").Enemies:FindFirstChild("FishBoat") or 
                   game:GetService("Workspace").Enemies:FindFirstChild("PirateBrigade") or 
                   game:GetService("Workspace").Enemies:FindFirstChild("PirateGrandBrigade") or 
                   game:GetService("Workspace").Enemies:FindFirstChild("PirateBasic")
    
    if fishBoat then
        local vehicleSeat = fishBoat:FindFirstChild("VehicleSeat")
        if vehicleSeat and (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - vehicleSeat.Position).Magnitude <= 800 then
            game.Players.LocalPlayer.Character.Humanoid.Sit = false
            
            local initialHealth = fishBoat.Health.Value
            
            repeat wait(0.1)
                topos(vehicleSeat.CFrame * CFrame.new(0, 20, 0))
                Skillaimbot = true
                AimBotSkillPosition = game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(0, 5, 0)
                EquipWeapon(game.Players.LocalPlayer.Data.DevilFruit.Value)
                useSkill("Z")
                useSkill("X")
                useSkill("C")
                useSkill("V")
                useSkill("F")
                
                if fishBoat.Health.Value <= 0 then
                    break
                end
            until not fishBoat or not _G.GravityV2 or cancomplete3 == true
            
            Skillaimbot = false
            _G.AutoSkillSea = false
            return true
        end
    end
    
    Skillaimbot = false
    _G.AutoSkillSea = false
    return false
end

local lastBoatPosition = nil 

spawn(function()
    while task.wait() do
        if _G.GravityV2 then
            pcall(function()
                if owned2 == true and owned3 == false and ((game.Players.LocalPlayer.Backpack:FindFirstChild("Gravity-Gravity") and game.Players.LocalPlayer.Backpack["Gravity-Gravity"].Level.Value >= 400) or (workspace.Characters:FindFirstChild(game.Players.LocalPlayer.Name) and workspace.Characters[game.Players.LocalPlayer.Name]:FindFirstChild("Gravity-Gravity") and workspace.Characters[game.Players.LocalPlayer.Name]["Gravity-Gravity"].Level.Value >= 400)) then
                    if researching3 == false then
                        repeat 
                            task.wait(0.1)
                            local args = {
                                [1] = {
                                    ["Context"] = "StartResearch",
                                    ["AbilityName"] = "DarkMatterImplosion"
                                }
                            }
                            game:GetService("ReplicatedStorage").Modules.Net:FindFirstChild("RF/HiddenAbilitiesRF"):InvokeServer(unpack(args))
                        until researching3 == true or owned3 == true or not _G.GravityV2
                    elseif researching3 == true and owned3 == false and cancomplete3 == false then
                        if not World3 then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelZou")
                        else
                            if not game.Players.LocalPlayer.Character or not game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then return end 
                            if CheckShip() == "ship_enemy" then 
                                game.Players.LocalPlayer.Character.Humanoid.Sit = false
                                FarmShip()
                            elseif CheckShip() == "normal_enemy" then
                            if not game.Players.LocalPlayer.Character.Humanoid.Sit then
                            TPP(boat.VehicleSeat.CFrame * CFrame.new(0, 1, 0))
                            else
                            TPB2(CFrame.new(-32654, 50, 4788))
                            end
                            elseif not CheckShip() then
                                local boat = CheckSwanBoat()
                                if not boat then
                                    if World3 then
                                        TPP(CFrame.new(-16927, 9, 433))
                                        if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(-16927, 9, 433)).Magnitude <= 10 then
                                            game.ReplicatedStorage.Remotes.CommF_:InvokeServer("BuyBoat", SelectBoat)
                                        end
                                    end
                                else
                                    if not boat:FindFirstChild("YOUR_BOAT_ESP") then
                                        AddEsp("YOUR_BOAT_ESP", boat)
                                    end
                                    if not game.Players.LocalPlayer.Character.Humanoid.Sit then
                                        TPP(boat.VehicleSeat.CFrame * CFrame.new(0, 1, 0))
                                    else
                                        lastBoatPosition = boat.VehicleSeat.Position
                                        if World3 then
                                            local destination = CFrame.new(-42250, 50, 9247)
                                            local distance = (boat.VehicleSeat.Position - destination.Position).Magnitude
                                            if distance > 350 then
                                                for _, v in pairs(boat:GetDescendants()) do
                                                    if v:IsA("BasePart") then
                                                        v.CanCollide = false
                                                        v.Velocity = Vector3.new(0, 0, 0)
                                                        v.RotVelocity = Vector3.new(0, 0, 0)
                                                    end
                                                end
                                                boat.VehicleSeat.CFrame = CFrame.new(boat.VehicleSeat.Position.X, 300, boat.VehicleSeat.Position.Z)
                                                TPB2(CFrame.new(-42250, 50, 9247))
                                            else
                                                for _, boatItem in pairs(game:GetService("Workspace").Boats:GetChildren()) do
                                                    if boatItem:FindFirstChild("VehicleSeat") and boatItem.Owner.Value == game.Players.LocalPlayer then
                                                        if (boatItem.VehicleSeat.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 10 then
                                                            for _, v in pairs(boatItem:GetDescendants()) do
                                                                if v:IsA("BasePart") then
                                                                    v.CanCollide = false
                                                                    v.Velocity = Vector3.new(0, 0, 0)
                                                                    v.RotVelocity = Vector3.new(0, 0, 0)
                                                                end
                                                            end
                                                            boatItem.VehicleSeat.CFrame = CFrame.new(boatItem.VehicleSeat.Position.X, boatItem.VehicleSeat.Position.Y, boatItem.VehicleSeat.Position.Z)
                                                        end
                                                    end
                                                end
                                            end
                                        end
                                    end
                                end
                                
                                if not boat and lastBoatPosition and not CheckShip() then
                                    game.Players.LocalPlayer.Character.Head:Destroy()
                                    lastBoatPosition = nil
                                end
                            end
                        end
                    elseif owned3 == false and cancomplete3 == true then
                        if GetCountMaterials("Radioactive Material") < 6 then
                            if not World2 then
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelDressrosa")
                            else
                                if game:GetService("Workspace").Enemies:FindFirstChild("Factory Staff") then
                                    for _, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                        if v.Name == "Factory Staff" and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                            repeat
                                                task.wait(0.1)
                                                AutoHaki()
                                                EquipWeapon(_G.SelectWeapon)
                                                topos(v.HumanoidRootPart.CFrame * CFrame.new(0, 20, 0))
                                            until not _G.GravityV2 or not v.Parent or v.Humanoid.Health <= 0 or GetCountMaterials("Radioactive Material") >= 6
                                        end
                                    end
                                else
                                    topos(CFrame.new(533.22045898438, 128.46876525879, 355.62615966797))
                                end
                            end
                        elseif GetCountMaterials("Mystic Droplet") < 4 and GetCountMaterials("Radioactive Material") >= 6 then
                            if not World2 then
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelDressrosa")
                            else
                                if game:GetService("Workspace").Enemies:FindFirstChild("Water Fighter") then
                                    for _, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                        if v.Name == "Water Fighter" and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                            repeat
                                                task.wait(0.1)
                                                AutoHaki()
                                                EquipWeapon(_G.SelectWeapon)
                                                topos(v.HumanoidRootPart.CFrame * CFrame.new(0, 20, 0))
                                            until not _G.GravityV2 or not v.Parent or v.Humanoid.Health <= 0 or GetCountMaterials("Mystic Droplet") >= 4
                                        end
                                    end
                                else
                                    topos(CFrame.new(-3214, 298, -10535))
                                end
                            end
                        elseif GetCountMaterials("Mystic Droplet") >= 4 and GetCountMaterials("Radioactive Material") >= 6 and GetCountMaterials("Meteorite") < 1 then
                        if not World2 then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelDressrosa")
                        else
                            if game:GetService("Workspace").Enemies:FindFirstChild("Orbitus") then
                                boss = game:GetService("Workspace").Enemies:FindFirstChild("Orbitus")
                                repeat task.wait(0.1)
                                    AutoHaki()
                                    EquipWeapon(_G.SelectWeapon)
                                    topos(boss.HumanoidRootPart.CFrame * CFrame.new(0, 25, 0))
                                until not boss.Parent or boss.Humanoid.Health <= 0 or GetCountMaterials("Meteorite") >= 1
                            else
                                topos(CFrame.new(-2121, 88, -4379))
                            end
                            end
                        elseif GetCountMaterials("Mystic Droplet") >= 4 and GetCountMaterials("Radioactive Material") >= 6 and GetCountMaterials("Meteorite") >= 1 and cancomplete3 == true then
                            repeat
                                task.wait()
                                local args = {
                                    [1] = {
                                        ["Context"] = "CraftAbility",
                                        ["AbilityName"] = "DarkMatterImplosion"
                                    }
                                }
                                game:GetService("ReplicatedStorage").Modules.Net:FindFirstChild("RF/HiddenAbilitiesRF"):InvokeServer(unpack(args))
                            until owned3 == true or not _G.GravityV2
                        end
                    end
                end
            end)
        end
    end
end)

spawn(function()
    while task.wait() do
        if _G.GravityV2 then
            pcall(function()
                if owned3 == true and owned4 == false and ((game.Players.LocalPlayer.Backpack:FindFirstChild("Gravity-Gravity") and game.Players.LocalPlayer.Backpack["Gravity-Gravity"].Level.Value >= 500) or (workspace.Characters:FindFirstChild(game.Players.LocalPlayer.Name) and workspace.Characters[game.Players.LocalPlayer.Name]:FindFirstChild("Gravity-Gravity") and workspace.Characters[game.Players.LocalPlayer.Name]["Gravity-Gravity"].Level.Value >= 500)) then
                    if researching4 == false and researching5 == false then
                        repeat 
                            task.wait(0.1)
                            local args = {
                                [1] = {
                                    ["Context"] = "StartResearch",
                                    ["AbilityName"] = "CelestialCataclysm"
                                }
                            }
                            game:GetService("ReplicatedStorage").Modules.Net:FindFirstChild("RF/HiddenAbilitiesRF"):InvokeServer(unpack(args))
                        until researching4 == true or owned4 == true or not _G.GravityV2
                    elseif researching4 == true and owned4 == false and expProgress4 ~= 0.2 then
                        if not World3 then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelZou")
                        else
                            repeat 
                                task.wait(0.1)
                                topos(CFrame.new(9047, 0, -1035))
                                if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(9047, 0, -1035)).Magnitude <= 10 then
                                    EquipWeapon(game.Players.LocalPlayer.Data.DevilFruit.Value)
                                    AimBotSkillPosition = game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(0, 5, 0)
                                    Skillaimbot = true
                                    local args = {
                                    [1] = "TAP",
                                    [2] = game.Players.LocalPlayer.Character.HumanoidRootPart.Position,
                                    [3] = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
                                    }
                                    for _, remote in pairs(game.Players.LocalPlayer.Character.Humanoid:GetChildren()) do
                                    if remote:IsA("RemoteFunction") then
                                    remote:InvokeServer(unpack(args))
                                    end
                                    end
                                end
                            until expProgress4 == 0.2 or not _G.GravityV2 or cancomplete4 == true or owned4 == true
                        end
                    elseif researching4 == true or expProgress4 == 0.2 then
                        if researching5 == false then
                            repeat 
                                task.wait(0.1)
                                local args = {
                                    [1] = {
                                        ["Context"] = "StartResearch",
                                        ["AbilityName"] = "CelestialCataclysm"
                                    }
                                }
                                game:GetService("ReplicatedStorage").Modules.Net:FindFirstChild("RF/HiddenAbilitiesRF"):InvokeServer(unpack(args))
                            until researching5 == true or owned4 == true or not _G.GravityV2
                        elseif researching5 == true and owned4 == false and cancomplete4 == false then
                            if not World2 then
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelDressrosa")
                            else
                                if game:GetService("Workspace").Enemies:FindFirstChild("Orbitus") then
                                    boss = game:GetService("Workspace").Enemies:FindFirstChild("Orbitus")
                                    repeat task.wait(0.1)
                                        AutoHaki()
                                        EquipWeapon(game.Players.LocalPlayer.Data.DevilFruit.Value)
                                        topos(boss.HumanoidRootPart.CFrame * CFrame.new(0, 25, 0))
                                        AimBotSkillPosition = boss.HumanoidRootPart.Position
                                        Skillaimbot = true
                                        useSkill("Z")
                                        useSkill("X")
                                        useSkill("C")
                                        useSkill("V")
                                        useSkill("F")
                                    until not boss.Parent or boss.Humanoid.Health <= 0 or cancomplete4 == true
                                else
                                    if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(-2121, 88, -4379)).Magnitude <= 10 and not CheckBoss("Orbitus") then
                                        Hop()
                                    else
                                        topos(CFrame.new(-2121, 88, -4379))
                                    end
                                end
                            end
                        elseif GetCountMaterials("Mystic Droplet") < 8 and cancomplete4 == true then
                            if not World2 then
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelDressrosa")
                            else
                                if game:GetService("Workspace").Enemies:FindFirstChild("Water Fighter") then
                                    for _, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                        if v.Name == "Water Fighter" and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                            repeat
                                                task.wait(0.1)
                                                AutoHaki()
                                                EquipWeapon(_G.SelectWeapon)
                                                topos(v.HumanoidRootPart.CFrame * CFrame.new(0, 20, 0))
                                                sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
                                            until not _G.GravityV2 or not v.Parent or v.Humanoid.Health <= 0 or GetCountMaterials("Mystic Droplet") >= 8
                                        end
                                    end
                                else
                                    topos(CFrame.new(-3214, 298, -10535))
                                end
                            end
                        elseif GetCountMaterials("Mystic Droplet") >= 8 and GetCountMaterials("Moonstone") >= 2 and GetCountMaterials("Meteorite") >= 2 and cancomplete4 == true then
                            repeat
                                task.wait()
                                local args = {
                                    [1] = {
                                        ["Context"] = "CraftAbility",
                                        ["AbilityName"] = "CelestialCataclysm"
                                    }
                                }
                                game:GetService("ReplicatedStorage").Modules.Net:FindFirstChild("RF/HiddenAbilitiesRF"):InvokeServer(unpack(args))
                            until owned4 == true or not _G.GravityV2
                        end
                    end
                end
            end)
        end
    end
end)

spawn(function()
    pcall(function()
        while task.wait(0.1) do
            if _G.StartLawRaid then
                if not game.Players.LocalPlayer.Character:FindFirstChild("Microchip") and not game.Players.LocalPlayer.Backpack:FindFirstChild("Microchip") and not CheckBoss("Order") then
                wait(3)
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward", "Microchip", "1")
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward", "Microchip", "2")
                elseif (game.Players.LocalPlayer.Character:FindFirstChild("Microchip") or game.Players.LocalPlayer.Backpack:FindFirstChild("Microchip")) and not CheckBoss("Order") then
                    fireclickdetector(game:GetService("Workspace").Map.CircleIsland.RaidSummon.Button.Main.ClickDetector)
                elseif CheckBoss("Order") then
                    KillBoss("Order")
                end
            end
        end
    end)
end)

spawn(function()
    while task.wait(0.1) do
        if _G.FullyGear and World3 then
        local Mirr = GetCountMaterials("Mirror Fractal")
        local Val = checkInventory("Valkyrie Helm")
            if not done then
                if Val and Mirr >= 1 and game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("RaceV4Progress", "Check") ~= 4 then
                    pull()
                    if Val and Mirr >= 1 and game.Workspace._WorldOrigin.Locations:FindFirstChild("Mirage Island") and game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("RaceV4Progress", "Check") == 4 and not InMi() then
                        for _, cac_329 in pairs(game:GetService("Workspace")._WorldOrigin.Locations:GetChildren()) do
                            if cac_329.Name == "Mirage Island" then
                                topos(cac_329.CFrame * CFrame.new(0, 333, 0))
                            end
                            if Val and Mirr >= 1 and game.Workspace._WorldOrigin.Locations:FindFirstChild("Mirage Island") and game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("RaceV4Progress", "Check") == 4 and InMi() then
                                local moonDir = game.Lighting:GetMoonDirection()
                                local lookAtPos = game.Workspace.CurrentCamera.CFrame.Position + moonDir * 100
                                game.Workspace.CurrentCamera.CFrame = CFrame.lookAt(game.Workspace.CurrentCamera.CFrame.Position, lookAtPos)
                                game.Players.LocalPlayer.Character.Humanoid.AutoRotate = false
                                game.Players.LocalPlayer.Character.Humanoid.RootPart.CFrame = CFrame.lookAt(game.Players.LocalPlayer.Character.Humanoid.RootPart.Position, lookAtPos)
                                task.wait(1)
                                game:GetService("ReplicatedStorage").Remotes.CommE:FireServer("ActivateAbility")
                            elseif getBlueGear() and getBlueGear().Transparency ~= 1 then
                                topos(getBlueGear().CFrame)
                            elseif done then
                                game.StarterGui:SetCore("SendNotification", {
                                    Title = "Pull Lever Completed",
                                    Text = "",
                                    Duration = 3,
                                    Icon = "rbxassetid://123709024751036"
                                })
                            end
                        end
                    end
                end
            end
        end
    end
end)

spawn(function()
    while task.wait(0.1) do
        pcall(function()
            if _G.AutoMysticIsland then
                for _, cac_329 in pairs(game:GetService("Workspace")._WorldOrigin.Locations:GetChildren()) do
                    if cac_329.Name == "Mirage Island" then
                        topos(cac_329.CFrame * CFrame.new(0, 333, 0))
                    end
                end
            end
        end)
    end
end)

spawn(function()
    while task.wait(0.1) do
        pcall(function()
            if _G.LockM then
                game.Workspace.CurrentCamera.CFrame = CFrame.lookAt(game.Workspace.CurrentCamera.CFrame.Position, game.Workspace.CurrentCamera.CFrame.Position + game.Lighting:GetMoonDirection() * 100)
            end
        end)
    end
end)

spawn(function()
    while wait() do
        if _G.TweenMGear then
            if getBlueGear() and getBlueGear().Transparency ~= 1 then
            topos(getBlueGear().CFrame)
            end
        end
    end
end)

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer
local foldername = "Lion Hub"
local checkConnection

local gg = getrawmetatable(game)
local old = gg.__namecall
setreadonly(gg, false)

gg.__namecall = newcclosure(function(self, ...)
    local args = {...}
    local method = getnamecallmethod()
    
    if tostring(method) == "FireServer" and tostring(self) == "CommE" and tostring(args[1]) == "ActivateAbility" and _G.PlayerAwaV4 and World3 then
        if not isfolder(foldername) then
            makefolder(foldername)
        end
        
        local filename = foldername .. "/TurnV3_" .. player.Name .. ".txt"
        writefile(filename, "activate")
        
        spawn(function()
            wait(5)
            if isfile(filename) then
                delfile(filename)
            end
        end)
    end
    
    return old(self, ...)
end)

local function checkForV4Files()
    if _G.SelectPlayerUpV4 and World3 then
        local targetFilename = foldername .. "/TurnV3_" .. _G.SelectPlayerUpV4 .. ".txt"
        
        if isfolder(foldername) and isfile(targetFilename) then
            game:GetService("ReplicatedStorage").Remotes.CommE:FireServer("ActivateAbility")
        end
    end
end

if checkConnection then
    checkConnection:Disconnect()
end

checkConnection = RunService.Heartbeat:Connect(checkForV4Files)

setreadonly(gg, true)

spawn(function()
    pcall(function()
        while wait() do
            if _G.TweenRaceDoor then
                Tocchodedjmetmetlamroi = game:GetService("Players").LocalPlayer.Data.Race.Value
                if Tocchodedjmetmetlamroi == "Human" then
                    topos(CFrame.new(29239.271484375, 14890.759765625, -204.24472045898438))
                elseif Tocchodedjmetmetlamroi == "Skypiea" then
                    topos(CFrame.new(28969.751953125, 14923.216796875, 234.89938354492188))
                elseif Tocchodedjmetmetlamroi == "Fishman" then
                    topos(CFrame.new(28221.904296875, 14894.7763671875, -210.73574829101562))
                elseif Tocchodedjmetmetlamroi == "Cyborg" then
                    topos(CFrame.new(28490.708984375, 14895.759765625, -420.38848876953125))
                elseif Tocchodedjmetmetlamroi == "Ghoul" then
                    topos(CFrame.new(28673.220703125, 14890.4609375, 456.0308837890625))
                elseif Tocchodedjmetmetlamroi == "Mink" then
                    topos(CFrame.new(29023.35546875, 14891.642578125, -377.6640625))
                end
            end
        end
    end)
end)

spawn(function()
    pcall(function()
        while task.wait(0.1) do
            if _G.CompleteTrial then
            if game:GetService("Players").LocalPlayer.PlayerGui.Main.TopHUDList.RaidTimer.Visible then
                if not game.Players.LocalPlayer.Character or not game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then return end
                if game.Players.LocalPlayer.Data.Race.Value == "Human" or game.Players.LocalPlayer.Data.Race.Value == "Ghoul" then
                    local nearestEnemy = nil
                    local shortestDistance = 700
                    
                    for _, enemy in pairs(game.Workspace.Enemies:GetChildren()) do
                        if enemy:FindFirstChild("Humanoid") and 
                           enemy:FindFirstChild("HumanoidRootPart") and 
                           enemy.Humanoid.Health > 0 then
                            local distance = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - enemy.HumanoidRootPart.Position).Magnitude
                            if distance <= 700 and distance < shortestDistance then
                                nearestEnemy = enemy
                                shortestDistance = distance
                            end
                        end
                    end
                    
                    if nearestEnemy then
                        repeat
                            task.wait()
                            AutoHaki()
                            EquipWeapon(_G.SelectWeapon)
                            topos(nearestEnemy.HumanoidRootPart.CFrame * CFrame.new(10, 30, 10))
                            sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
                        until not _G.CompleteTrial or not nearestEnemy.Parent or nearestEnemy.Humanoid.Health <= 0 or not game.Workspace.Enemies:FindFirstChild(nearestEnemy.Name)
                    end
                elseif game.Players.LocalPlayer.Data.Race.Value == "Skypiea" then
                    for _, v in next, workspace:GetDescendants() do
                        if v.Name == "FinishPart" then
                            repeat
                                task.wait(0.1)
                                local distance = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.Position).Magnitude
                                if distance > 3 then
                                    topos(v.CFrame)
                                end
                            until not _G.CompleteTrial or not v.Parent
                        end
                    end
                elseif game.Players.LocalPlayer.Data.Race.Value == "Fishman" then
                    for _, v in pairs(game.Workspace.SeaBeasts:GetChildren()) do
                        local seaBeastRoot = v:FindFirstChild("HumanoidRootPart")
                        if seaBeastRoot then
                            local distance = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - seaBeastRoot.Position).Magnitude
                            if distance <= 800 then
                                local fixedHeight = seaBeastRoot.Position.Y + 300
                                repeat
                                    task.wait(0.5)
                                    AutoHaki()
                                    topos(CFrame.new(seaBeastRoot.Position.X + 20, fixedHeight, seaBeastRoot.Position.Z + 10))
                                    Skillaimbot = true
                                    AimBotSkillPosition = game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(0, 2, 0)
                                    _G.AutoSkill = true
                                    game.Players.LocalPlayer.Character.Humanoid.Sit = false
                                until not seaBeastRoot.Parent or not _G.CompleteTrial or v.Health.Value <= 0
                                Skillaimbot = false
                                _G.AutoSkill = false
                            end
                        end
                    end
                elseif game.Players.LocalPlayer.Data.Race.Value == "Cyborg" then
                    topos(CFrame.new(game.Players.LocalPlayer.Character.HumanoidRootPart.Position.X, game.Players.LocalPlayer.Character.HumanoidRootPart.Position.Y + 100, game.Players.LocalPlayer.Character.HumanoidRootPart.Position.Z))
                elseif game.Players.LocalPlayer.Data.Race.Value == "Mink" then
                    for _, v in next, workspace:GetDescendants() do
                        if v.Name == "StartPoint" then
                            repeat
                                task.wait(0.1)
                                local distance = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.Position).Magnitude
                                if distance > 3 then
                                    topos(v.CFrame)
                                end
                            until not _G.CompleteTrial or not v.Parent
                            end
                        end
                    end
                end
            end
        end
    end)
end)

spawn(function()
    pcall(function()
        while task.wait(1) do
            if _G.ResetAfterTrial then
                if game:GetService("Players").LocalPlayer.PlayerGui.Main.Timer.Visible then
                    Death(1)
                else
                    for _, v in ipairs(game.Players.LocalPlayer.PlayerGui:GetDescendants()) do
                        if v:IsA("TextLabel") and v.Text:match("FIGHT!") then
                            Death(1)
                            break
                        end
                    end
                end
            end
        end
    end)
end)

spawn(function()
    pcall(function()
        while task.wait(0.1) do
            if _G.KillPlayerAfterTrial then
                if game:GetService("Players").LocalPlayer.PlayerGui.Main.Timer.Visible then
                    for _, v in pairs(game.Workspace.Characters:GetChildren()) do
                        if v.Name ~= game:GetService("Players").LocalPlayer.Name and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 and v.Parent then
                            if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.HumanoidRootPart.Position).Magnitude <= 400 then
                                repeat
                                    task.wait()
                                    AutoHaki()
                                    EquipWeapon(_G.SelectWeapon)
                                    topos(v.HumanoidRootPart.CFrame * CFrame.new(0, 1, 5))
                                    if game.Players.LocalPlayer.Character:FindFirstChild("RaceEnergy") and game.Players.LocalPlayer.Character.RaceEnergy.Value >= 1 and not game.Players.LocalPlayer.Character.RaceTransformed.Value then
                                        useSkill("Y")
                                    end
                                until not _G.KillPlayerAfterTrial or v.Humanoid.Health <= 0
                            end
                        end
                    end
                end
            end
        end
    end)
end)

Gears = {"Alpha", "Omega"}
GearOrder = {"Gear1", "Gear2", "Gear3", "Gear4"}

function DetectGearUp()
    for _, v in pairs(workspace.Map["Temple of Time"].InnerClock:GetChildren()) do
        if v:IsA("MeshPart") and v:FindFirstChild("Highlight") and v.Highlight.FillTransparency == 1 then
            return v.Name
        end
    end
end

spawn(function()
    while task.wait() do
        if _G.AutoUpgradeGear then
            pcall(function()
                local gearData = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TempleClock", "Check")
                if gearData and gearData.HadPoint then
                    local gearToUpgrade = DetectGearUp()
                    if gearToUpgrade then
                        for _, gearType in ipairs(Gears) do
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TempleClock", "SpendPoint", gearToUpgrade, gearType)
                            task.wait(0.5)
                        end
                    else
                        getsenv(game:GetService("Players").LocalPlayer.PlayerGui.TempleGui.LocalScript):EaseIn()
                    end
                else
                    if game:GetService("Players").LocalPlayer.PlayerGui.TempleGui.Enabled then
                        getsenv(game:GetService("Players").LocalPlayer.PlayerGui.TempleGui.LocalScript):EaseOut()
                    end
                end
            end)
        end
    end
end)

spawn(function()
    while task.wait(0.1) do
        if _G.AutoTrain and World3 then
            pcall(function()
                local LionCheck = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("UpgradeRace", "Check")
                if game.Players.LocalPlayer.Character.RaceTransformed.Value then
                    _G.AutoBones = false
                    topos(CFrame.new(-8964.06640625, 545.8358154296875, 5416.81640625))
                elseif tonumber(LionCheck) == 0 then
                    _G.AutoBones = false
                elseif tonumber(LionCheck) ~= 0 and done == true then
                    _G.AutoBones = true
                end
                
                if game.Players.LocalPlayer.Character:FindFirstChild("RaceEnergy") and game.Players.LocalPlayer.Character.RaceEnergy.Value >= 1 and not game.Players.LocalPlayer.Character.RaceTransformed.Value then
                    game:GetService("VirtualInputManager"):SendKeyEvent(true, "Y", false, game)
                    task.wait()
                    game:GetService("VirtualInputManager"):SendKeyEvent(false, "Y", false, game)
                end
                
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("UpgradeRace", "Buy")
            end)
        end
    end
end)

spawn(function()
    while task.wait(0.1) do
        if _G.AutoBones then
            pcall(function()
                local player = game.Players.LocalPlayer
                if not player.Character or not player.Character:FindFirstChild("HumanoidRootPart") then return end
                
                local BonePos = CFrame.new(-9506.234375, 172.130615234375, 6117.0771484375)
                local boneMobsList = {"Reborn Skeleton", "Living Zombie", "Demonic Soul", "Posessed Mummy"}
                local nearbyMob = nil

                if game:GetService("Workspace").Enemies:FindFirstChild("Soul Reaper") then
                    for _, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if v.Name == "Soul Reaper" and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                            repeat task.wait()
                                AutoHaki()
                                EquipWeapon(_G.SelectWeapon)
                                topos(v.HumanoidRootPart.CFrame * CFrame.new(0, 20, 0))
                            until not _G.AutoBones or not v.Parent or v.Humanoid.Health <= 0
                        end
                    end
                else
                    for _, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if table.find(boneMobsList, v.Name) and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                            if (player.Character.HumanoidRootPart.Position - v.HumanoidRootPart.Position).Magnitude <= 300 then
                                nearbyMob = v
                                break
                            end
                        end
                    end

                    if nearbyMob then
                        repeat task.wait()
                            AutoHaki()
                            EquipWeapon(_G.SelectWeapon)
                            StartBring = true
                            MonFarm = nearbyMob.Name
                            PosMon = nearbyMob.HumanoidRootPart.CFrame
                            topos(nearbyMob.HumanoidRootPart.CFrame * CFrame.new(20, 10, 20))
                        until not _G.AutoBones or not nearbyMob.Parent or nearbyMob.Humanoid.Health <= 0
                        StartBring = false
                    else
                        for _, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if table.find(boneMobsList, v.Name) and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                repeat task.wait()
                                    AutoHaki()
                                    EquipWeapon(_G.SelectWeapon)
                                    StartBring = true
                                    MonFarm = v.Name
                                    PosMon = v.HumanoidRootPart.CFrame
                                    topos(v.HumanoidRootPart.CFrame * CFrame.new(0, 20, 0))
                                until not _G.AutoBones or not v.Parent or v.Humanoid.Health <= 0
                                StartBring = false
                                break
                            end
                        end
                        
                        local foundMob = false
                        for _, mobName in pairs(boneMobsList) do
                            if game:GetService("Workspace").Enemies:FindFirstChild(mobName) then
                                foundMob = true
                                break
                            end
                        end
                        
                        if not foundMob then
                            if BypassTP and (player.Character.HumanoidRootPart.Position - BonePos.Position).Magnitude > 1500 then
                                BTP(BonePos)
                            else
                                topos(BonePos)
                            end
                        end
                    end
                end
            end)
        end
    end
end)

SeaCoordinates = {
    ["Sea1[Low]"] = CFrame.new(-22526, 50, 1716),
    ["Sea2[Medium]"] = CFrame.new(-25645, 50, 2554),
    ["Sea3[High]"] = CFrame.new(-29842, 50, 4070),
    ["Sea4[Extreme]"] = CFrame.new(-32654, 50, 4788),
    ["Sea5[Crazy]"] = CFrame.new(-37813, 50, 6105),
    ["Sea6[???]"] = CFrame.new(-42250, 50, 9247),
    ["Infinity"] = CFrame.new(-999999, 999, -999999)
}

local LowTierBoatBuyCoordinates = CFrame.new(-5332.83544921875, 5.0309906005859375, -700.0574340820312)
local HighTierBoatBuyCoordinates = CFrame.new(-5326.291015625, 5.030991554260254, -712.1959838867188)
local DestinationCoordinates = CFrame.new(-6788.043945, -4.713245, 2117.271484)

local oldpos = nil

spawn(function()
    while task.wait() do
        if _G.AutoSeaEvent then
            pcall(function()
                if not game.Players.LocalPlayer.Character or not game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then return end
                if not checkEnemies() then
                    local boat = CheckSwanBoat()
                    if not boat then
                        if World3 then
                            TPP(CFrame.new(-16927, 9, 433))
                            if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(-16927, 9, 433)).Magnitude <= 10 then
                                game.ReplicatedStorage.Remotes.CommF_:InvokeServer("BuyBoat", SelectBoat)
                            end
                        elseif World2 then
                            local buyCoordinates = table.find({"Guardian", "Lantern", "Beast Hunter"}, SelectBoat) and LowTierBoatBuyCoordinates or HighTierBoatBuyCoordinates
                            TPP(buyCoordinates)
                            if (buyCoordinates.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 10 then
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyBoat", SelectBoat)
                            end
                        end
                    else
                        if not boat:FindFirstChild("YOUR_BOAT_ESP") then
                            AddEsp("YOUR_BOAT_ESP", boat)
                        end
                        if not game.Players.LocalPlayer.Character.Humanoid.Sit then
                            TPP(boat.VehicleSeat.CFrame * CFrame.new(0, 1, 0))
                        else
                            oldpos = boat.VehicleSeat.Position
                            if World3 and _G.SelectLocalTeleportSea and SeaCoordinates[_G.SelectLocalTeleportSea] then
                                local destination = SeaCoordinates[_G.SelectLocalTeleportSea]
                                local distance = (boat.VehicleSeat.Position - destination.Position).Magnitude
                                if distance > 350 then
                                    for _, v in pairs(boat:GetDescendants()) do
                                        if v:IsA("BasePart") then
                                            v.CanCollide = false
                                            v.Velocity = Vector3.new(0, 0, 0)
                                            v.RotVelocity = Vector3.new(0, 0, 0)
                                        end
                                    end
                                    boat.VehicleSeat.CFrame = CFrame.new(boat.VehicleSeat.Position.X, 300, boat.VehicleSeat.Position.Z)
                                    TPB2(destination)
                                else
                                    for _, boat in pairs(game:GetService("Workspace").Boats:GetChildren()) do
                                        if boat:FindFirstChild("VehicleSeat") and boat.Owner.Value == game.Players.LocalPlayer then
                                            if (boat.VehicleSeat.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 10 then 
                                                for _, v in pairs(boat:GetDescendants()) do
                                                    if v:IsA("BasePart") then
                                                        v.CanCollide = false
                                                        v.Velocity = Vector3.new(0, 0, 0)
                                                        v.RotVelocity = Vector3.new(0, 0, 0)
                                                    end
                                                end
                                                boat.VehicleSeat.CFrame = CFrame.new(boat.VehicleSeat.Position.X, boat.VehicleSeat.Position.Y, boat.VehicleSeat.Position.Z)
                                            end
                                        end
                                    end
                                end
                            elseif World2 then
                                local destination = DestinationCoordinates
                                local distance = (boat.VehicleSeat.Position - destination.Position).Magnitude
                                if distance > 350 then
                                    for _, boat in pairs(game:GetService("Workspace").Boats:GetChildren()) do
                                        if boat:FindFirstChild("VehicleSeat") and boat.Owner.Value == game.Players.LocalPlayer then
                                            if (boat.VehicleSeat.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 10 then 
                                                for _, v in pairs(boat:GetDescendants()) do
                                                    if v:IsA("BasePart") then
                                                        v.CanCollide = false
                                                        v.Velocity = Vector3.new(0, 0, 0)
                                                        v.RotVelocity = Vector3.new(0, 0, 0)
                                                    end
                                                end
                                                boat.VehicleSeat.CFrame = CFrame.new(boat.VehicleSeat.Position.X, 300, boat.VehicleSeat.Position.Z)
                                                TPB2(destination)
                                            end
                                        end
                                    end
                                else
                                    for _, boat in pairs(game:GetService("Workspace").Boats:GetChildren()) do
                                        if boat:FindFirstChild("VehicleSeat") and boat.Owner.Value == game.Players.LocalPlayer then
                                            if (boat.VehicleSeat.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 10 then 
                                                for _, v in pairs(boat:GetDescendants()) do
                                                    if v:IsA("BasePart") then
                                                        v.CanCollide = false
                                                        v.Velocity = Vector3.new(0, 0, 0)
                                                        v.RotVelocity = Vector3.new(0, 0, 0)
                                                    end
                                                end
                                                boat.VehicleSeat.CFrame = CFrame.new(boat.VehicleSeat.Position.X, boat.VehicleSeat.Position.Y, boat.VehicleSeat.Position.Z)
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
                if not boat and _G.ResetSea and oldpos and not checkEnemies() then
                    game.Players.LocalPlayer.Character.Head:Destroy() 
                    GetCountMaterials = nil
                end
            end)
        end
    end
end)

spawn(function()
    while wait() do
        if _G.AutoSeaEvent and checkEnemies() then
            game.Players.LocalPlayer.Character.Humanoid.Sit = false
        end
    end
end)

function FarmPiranha()
    if _G.FarmPiranha then
        local target = CheckSeaMonster("Piranha")
        if target then
            repeat task.wait(0.1)
                AutoHaki()
                EquipWeapon(_G.SelectWeapon)
                topos(target.HumanoidRootPart.CFrame * CFrame.new(20, 20, 10))
            until not _G.FarmPiranha or not target.Parent or target.Humanoid.Health <= 0
            return true
        end
    end
    return false
end

function FarmShark()
    if _G.FarmShark then
        local target = CheckSeaMonster("Shark")
        if target then
            repeat task.wait(0.1)
                AutoHaki()
                EquipWeapon(_G.SelectWeapon)
                topos(target.HumanoidRootPart.CFrame * CFrame.new(10, 20, 10))
            until not _G.FarmShark or not target.Parent or target.Humanoid.Health <= 0
            return true
        end
    end
    return false
end

function FarmTerrorshark()
    if _G.FarmTerrorshark then
        local target = CheckSeaMonster("Terrorshark")
        if target and target:FindFirstChild("HumanoidRootPart") then
            repeat
                task.wait(0.1)
                AutoHaki()
                EquipWeapon(_G.SelectWeapon)
                if game:GetService("Workspace")["_WorldOrigin"]:FindFirstChild("SpinSlash") or 
                   game:GetService("Workspace")["_WorldOrigin"]:FindFirstChild("SharkSplash") then
                    topos(target.HumanoidRootPart.CFrame * CFrame.new(0, 250, 0))
                else
                    topos(target.HumanoidRootPart.CFrame * CFrame.new(0, 20, 0))
                end
            until not _G.FarmTerrorshark or not target.Parent or target.Humanoid.Health <= 0
            return true
        end
    end
    return false
end

function FarmFishCrew()
    if _G.FarmFishCrew then
        local target = CheckSeaMonster("Fish Crew Member")
        if target then
            repeat task.wait(0.1)
                AutoHaki()
                EquipWeapon(_G.SelectWeapon)
                topos(target.HumanoidRootPart.CFrame * CFrame.new(20, 20, 10))
            until not _G.FarmFishCrew or not target.Parent or target.Humanoid.Health <= 0
            return true
        end
    end
    return false
end

function FarmFishBoat()
    if _G.FarmFishBoat then
        local fishBoat = game:GetService("Workspace").Enemies:FindFirstChild("FishBoat") or game:GetService("Workspace").Enemies:FindFirstChild("PirateBrigade") or game:GetService("Workspace").Enemies:FindFirstChild("PirateGrandBrigade") or game:GetService("Workspace").Enemies:FindFirstChild("PirateBasic")
        
        if fishBoat then
            local vehicleSeat = fishBoat:FindFirstChild("VehicleSeat")
            if vehicleSeat and (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - vehicleSeat.Position).Magnitude <= 800 then
                game.Players.LocalPlayer.Character.Humanoid.Sit = false
                repeat task.wait(0.1)
                    topos(vehicleSeat.CFrame * CFrame.new(0, 20, 0))
                    Skillaimbot = true
                    AimBotSkillPosition = game.Players.LocalPlayer.Character.HumanoidRootPart.Position + Vector3.new(0, 50, 0)
                    _G.AutoSkillSea = true
                until not fishBoat or not _G.FarmFishBoat or fishBoat.Health.Value <= 0 or not fishBoat.Parent
                Skillaimbot = false
                _G.AutoSkillSea = false
                return true
            end
        end
        Skillaimbot = false
        _G.AutoSkillSea = false
    end
    return false
end

function FarmSeaBeast()
    if _G.FarmSeaBeast then
        for _, v in pairs(game:GetService("Workspace").SeaBeasts:GetChildren()) do
            local seaBeastRoot = v:FindFirstChild("HumanoidRootPart")
            if seaBeastRoot then
                local distance = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - seaBeastRoot.Position).Magnitude
                if distance <= 800 then
                    repeat task.wait(0.1)
                        AutoHaki()
                        RandomFarm = math.random(1, 6)
                        local offsets = {CFrame.new(30, 300, 20), CFrame.new(30, 230, 35), CFrame.new(20, 400, -35), CFrame.new(35, 260, 30), CFrame.new(-1, 300, 35), CFrame.new(-30, 250, 1)}
                        topos(seaBeastRoot.CFrame * offsets[RandomFarm])
                        task.wait(0.5)
                        Skillaimbot = true
                        AimBotSkillPosition = game.Players.LocalPlayer.Character.HumanoidRootPart.Position + Vector3.new(0, 50, 0)
                        _G.AutoSkillSea = true
                        game.Players.LocalPlayer.Character.Humanoid.Sit = false
                    until not seaBeastRoot.Parent or not _G.FarmSeaBeast or v.Health.Value <= 0
                    Skillaimbot = false
                    _G.AutoSkillSea = false
                    return true
                end
            end
        end
    end
    return false
end

spawn(function()
    while task.wait(0.1) do
        pcall(function()
        if _G.FarmSeaBeast or _G.FarmFishBoat or _G.FarmFishCrew or _G.FarmTerrorshark or _G.FarmShark or _G.FarmPiranha then
            if not game.Players.LocalPlayer.Character or not game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then return end
            local priorityOrder = {
                FarmPiranha,
                FarmTerrorshark,
                FarmShark,
                FarmFishCrew,
                FarmFishBoat,
                FarmSeaBeast
            }
            for _, farmFunc in ipairs(priorityOrder) do
                if farmFunc() and World3 and World2 then break end
               end
            end
        end)
    end
end)

spawn(function()
    while wait() do
        if _G.Nocliprock then
            if game.Players.LocalPlayer.Character.Humanoid.Sit then
                for _, v in pairs(game.Workspace.Boats:GetDescendants()) do
                    if v:IsA("BasePart") then
                        v.CanCollide = false
                    end
                end
                for _, v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
                    if v:IsA("BasePart") then
                        v.CanCollide = false
                    end
                end
            else
                for _, v in pairs(game.Workspace.Boats:GetDescendants()) do
                    if v:IsA("BasePart") then
                        v.CanCollide = true
                    end
                end
                for _, v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
                    if v:IsA("BasePart") then
                        v.CanCollide = true
                    end
                end
            end
        end
    end
end)

spawn(function()
    local lastState = nil
    while wait(1) do 
        pcall(function()
            if _G.IncreaseBoatSpeed ~= lastState then
                lastState = _G.IncreaseBoatSpeed
                local newSpeed = _G.IncreaseBoatSpeed and 350 or 150
                for _, v in pairs(game.Workspace.Boats:GetDescendants()) do
                    if v:IsA("VehicleSeat") and v.MaxSpeed ~= newSpeed then
                        v.MaxSpeed = newSpeed
                    end
                end
            end
        end)
    end
end)

spawn(function()
    while task.wait(0.1) do
        if _G.FindKit then
            pcall(function()
                local shrine = game.Workspace.Map:FindFirstChild("KitsuneIsland") and game.Workspace.Map.KitsuneIsland:FindFirstChild("ShrineActive") and game.Workspace.Map.KitsuneIsland.ShrineActive:FindFirstChild("NeonShrinePart")
                if shrine and Time() == "Night" then
                    repeat
                        topos(shrine.CFrame)
                        game.Players.LocalPlayer.Character.Humanoid.Sit = false
                        task.wait()
                    until Time() == "Day" or not _G.FindKit or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - shrine.Position).Magnitude <= 100
                else
                    local boat = CheckSwanBoat()
                    if not boat then
                        if game.PlaceId == 7449423635 then
                            TPP(CFrame.new(-16927, 9, 433))
                            if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(-16927, 9, 433)).Magnitude <= 10 then
                                game.ReplicatedStorage.Remotes.CommF_:InvokeServer("BuyBoat", SelectBoat)
                            end
                        end
                    else
                        if not boat:FindFirstChild("YOUR_BOAT_ESP") then
                            AddEsp("YOUR_BOAT_ESP", boat)
                        end
                        if not game.Players.LocalPlayer.Character.Humanoid.Sit then
                            TPP(boat.VehicleSeat.CFrame * CFrame.new(0, 1, 0))
                        else
                            local isMoonNight = game:GetService("Lighting"):FindFirstChild("Sky") and game:GetService("Lighting").Sky.MoonTextureId == "http://www.roblox.com/asset/?id=9709149431" and Time() == "Night"
                            local Y = isMoonNight and boat.VehicleSeat.Position.Y or 300
                            for _, v in pairs(boat:GetDescendants()) do
                                if v:IsA("BasePart") then
                                    v.CanCollide = false
                                    v.Velocity = Vector3.new(0, 0, 0)
                                    v.RotVelocity = Vector3.new(0, 0, 0)
                                end
                            end
                            boat.VehicleSeat.CFrame = CFrame.new(boat.VehicleSeat.Position.X, Y, boat.VehicleSeat.Position.Z)
                            TPB2(CFrame.new(-42250, 50, 9247))
                        end
                    end
                end
            end)
        end
    end
end)

spawn(function()
    while task.wait(3) do
        if _G.Starts then
            pcall(function()
            if game.Workspace.Map:FindFirstChild("KitsuneIsland").ShrineActive:FindFirstChild("NeonShrinePart") and Time() == "Night" then
                game:GetService("ReplicatedStorage").Modules.Net:FindFirstChild("RE/TouchKitsuneStatue"):FireServer()
                game:GetService("ReplicatedStorage").Modules.Net:FindFirstChild("RF/KitsuneStatuePray"):InvokeServer()
                end
            end)
        end
    end
end)

spawn(function()
    while task.wait(0.1) do
        if _G.AutoAzureEmber then
            pcall(function()
                if game:GetService("Workspace"):FindFirstChild("AttachedAzureEmber") then
                   topos(game.Workspace.EmberTemplate.Part.CFrame)
                end
            end)
        end
    end
end)

spawn(function()
    while task.wait(1) do
        if _G.AutoTradeAzure then
            pcall(function()
                local availableCount = GetCountMaterials("Azure Ember")
                if availableCount >= (_G.AzureTradeQuantity or 25) then
                    game:GetService("ReplicatedStorage").Modules.Net:FindFirstChild("RF/KitsuneStatuePray"):InvokeServer()
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("KitsuneStatuePray")
                end
            end)
        end
    end
end)

MethodF = Tabs.General:AddDropdown("DropdownSelectWeapon", {
    Title = "Select Method Farm",
    Values = {'Level', 'Nearest', 'Bones', 'Katakuri', 'Ectoplasm'},
    Multi = false,
    Default = 1
}) 
MethodF:SetValue('Level')
MethodF:OnChanged(function(Value)
    _G.SelectFarm = Value
end)

Get = Tabs.General:AddToggle("Get", {
    Title = "Get Quest",
    Default = false 
})

Get:OnChanged(function(Value)
    _G.GetQuest = Value
    StopTween(_G.GetQuest)
end)

Farm = Tabs.General:AddToggle("Farm", {
    Title = "Start Farm",
    Default = false 
})

Farm:OnChanged(function(Value)
    _G.AutoFarm = Value
    StopTween(_G.AutoFarm)
end)

Tabs.General:AddSection("Mastery Farm")

FarmMasteryDropdown = Tabs.General:AddDropdown("DropdownFarmMastery", {
    Title = "Select Auto Farm Mastery Mode",
    Values = {"Level Fruit Mastery", "Level Gun Mastery", "Kata Fruit Mastery", "Kata Gun Mastery", "Bones Fruit Mastery", "Bones Gun Mastery"},
    Multi = false,
    Default = 1
})
FarmMasteryDropdown:SetValue("Level Fruit Mastery")
FarmMasteryDropdown:OnChanged(function(Value)
    _G.SelectFarmMas = Value
end)

FarmMasteryToggle = Tabs.General:AddToggle("ToggleFarmMastery", {
    Title = "Start Farm Mastery",
    Default = false
})
FarmMasteryToggle:OnChanged(function(Value)
    _G.AutoFarmMastery = Value
    if Value == false then
        StopTween(_G.AutoFarmMastery)
    end
end)

HealthFarmDropdown = Tabs.General:AddDropdown("DropdownSetHealthFarm", {
    Title = "Set Health For Farm Mastery",
    Values = {"0.4", "0.5", "0.6"},
    Multi = false,
    Default = 1
})
HealthFarmDropdown:SetValue("0.4")
HealthFarmDropdown:OnChanged(function(Value)
    _G.SetHealthMas = tonumber(Value)
end)

ToggleZ = Tabs.General:AddToggle("ToggleZ", {
    Title = "Z",
    Default = true
})
ToggleZ:OnChanged(function(Value)
    KillZ = Value
end)

ToggleX = Tabs.General:AddToggle("ToggleX", {
    Title = "X",
    Default = true
})
ToggleX:OnChanged(function(Value)
    KillX = Value
end)

ToggleC = Tabs.General:AddToggle("ToggleC", {
    Title = "C",
    Default = true
})
ToggleC:OnChanged(function(Value)
    KillC = Value
end)

ToggleV = Tabs.General:AddToggle("ToggleV", {
    Title = "V",
    Default = false
})
ToggleV:OnChanged(function(Value)
    KillV = Value
end)

ToggleF = Tabs.General:AddToggle("ToggleF", {
    Title = "F",
    Default = true
})
ToggleF:OnChanged(function(Value)
    KillF = Value
end)

Tabs.General:AddSection("Boss Fully")

BossFullyDropdown = Tabs.General:AddDropdown("DropdownSelectBossFully", {
    Title = "Select Auto Boss Fully",
    Values = {"Dark Beard", "Rip_Indra", "Dough King", "Tyrant of the Skies"},
    Multi = false,
    Default = 1
})
BossFullyDropdown:SetValue("Dark Beard")
BossFullyDropdown:OnChanged(function(value)
    _G.SelectBossFully = value
end)

BossFullyToggle = Tabs.General:AddToggle("ToggleStartBossFully", {
    Title = "Start Farm Boss Fully",
    Default = false
})
BossFullyToggle:OnChanged(function(Vu)
    _G.BossFully = Vu
    StopTween(_G.BossFully)
end)

Tabs.General:AddSection("Boss")

   if World1 then
		tableBoss = {"The Gorilla King","Bobby","Yeti","Mob Leader","Ice Admiral","Warden","Chief Warden","Swan","Magma Admiral","Fishman Lord","Wysper","Thunder God","Cyborg","Saber Expert"}
	elseif World2 then
		tableBoss = {"Diamond","Jeremy","Fajita","Don Swan","Smoke Admiral","Cursed Captain","Darkbeard","Order","Awakened Ice Admiral","Tide Keeper"}
	elseif World3 then
		tableBoss = {"Stone","Island Empress","Kilo Admiral","Captain Elephant","Beautiful Pirate","rip_indra True Form","Longma","Soul Reaper","Cake Queen"}
	end
	
	  Dropdown = Tabs.General:AddDropdown("Dropdown", {
        Title = "Sclect Boss",
        Values = tableBoss,
        Multi = false,
        Default = 1,
    })

    Dropdown:SetValue("")

    Dropdown:OnChanged(function(Value)
        _G.SelectBoss = Value
    end)
    
      Toggle = Tabs.General:AddToggle("MyToggle", {Title = "Auto Farm Boss", Default = false })

    Toggle:OnChanged(function(Value)
        _G.AutoFarmBoss = Value
		StopTween(_G.AutoFarmBoss)
    end)
    
if World1 then
    MaterialList = {"Leather + Scrap Metal", "Angel Wings", "Magma Ore", "Fish Tail"}
elseif World2 then
    MaterialList = {"Leather + Scrap Metal", "Radioactive Material", "Mystic Droplet", "Magma Ore", "Vampire Fang"}
elseif World3 then
    MaterialList = {"Leather + Scrap Metal", "Demonic Wisp", "Conjured Cocoa", "Dragon Scale", "Gunpowder", "Fish Tail", "Mini Tusk"}
end

Tabs.General:AddSection("Material Farm")

  Dropdown = Tabs.General:AddDropdown("MaterialDropdown", {
    Title = "Select Material",
    Values = MaterialList,
    Multi = false,
    Default = 1,
})

Dropdown:SetValue(MaterialList[1] or "")

Dropdown:OnChanged(function(Value)
    _G.SelectMaterial = Value
end)

  Toggle = Tabs.General:AddToggle("AutoMaterialToggle", {
    Title = "Auto Farm Material",
    Default = false,
})

Toggle:OnChanged(function(Value)
    _G.AutoMaterial = Value
    StopTween(_G.AutoMaterial)
end)

Tabs.General:AddSection("Chest Farm")

ChestCounter = Tabs.General:AddParagraph({
    Title = "Chest Counter",
    Content = ""
})

Toggle = Tabs.General:AddToggle("TweenChest", {
    Title = "Tween Chest",
    Default = false,
})

Toggle:OnChanged(function(Value)
    _G.ChestTween = Value
    StopTween(_G.ChestTween)
end)

Toggle = Tabs.General:AddToggle("ChestHop", {
    Title = "Chest Hop",
    Default = false,
})

Toggle:OnChanged(function(Value)
    _G.ChestHop = Value
    StopTween(_G.ChestHop)
end)

Toggle = Tabs.General:AddToggle("Stop", {
    Title = "Stop if have Key/Cup",
    Default = true,
})

Toggle:OnChanged(function(Value)
    _G.StopItemsChest = Value
    StopTween(_G.StopItemsChest)
end)

Tabs.General:AddSection("Setting Farm")

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")
local Modules = ReplicatedStorage:WaitForChild("Modules")
local Net = Modules:WaitForChild("Net")
local RegisterAttack = Net:WaitForChild("RE/RegisterAttack")
local RegisterHit = Net:WaitForChild("RE/RegisterHit")

local SUCCESS_FLAGS, COMBAT_REMOTE_THREAD = pcall(function()
    return require(Modules.Flags).COMBAT_REMOTE_THREAD or false
end)

local SUCCESS_HIT, HIT_FUNCTION = pcall(function()
    return (getmenv or getsenv)(Net)._G.SendHitsToServer
end)

function SendAttack(Cooldown, Args)
    RegisterAttack:FireServer(Cooldown)
    if SUCCESS_FLAGS and COMBAT_REMOTE_THREAD and SUCCESS_HIT and HIT_FUNCTION then
        HIT_FUNCTION(Args[1], Args[2])
    else
        RegisterHit:FireServer(Args[1], Args[2])
    end
end

local FastAttackModule = {
    Distance = 60,
    AttackMobs = true,
    AttackPlayers = true,
    Debounce = 0
}

function FastAttackModule:IsEntityAlive(entity)
    local humanoid = entity and entity:FindFirstChild("Humanoid")
    return humanoid and humanoid.Health > 0
end

function FastAttackModule:GetTargets(character)
    if not character or not character:FindFirstChild("HumanoidRootPart") then return {} end
    local playerPos = character.HumanoidRootPart.Position
    local targets = {}
    
    if self.AttackMobs then
        for _, enemy in ipairs(Workspace.Enemies:GetChildren()) do
            local rootPart = enemy:FindFirstChild("HumanoidRootPart")
            local head = enemy:FindFirstChild("Head")
            if rootPart and self:IsEntityAlive(enemy) and (rootPart.Position - playerPos).Magnitude <= self.Distance then
                table.insert(targets, {enemy, head or rootPart})
            end
        end
    end
    
    if self.AttackPlayers then
        for _, otherPlayer in ipairs(Players:GetPlayers()) do
            if otherPlayer ~= LocalPlayer and otherPlayer.Character then
                local rootPart = otherPlayer.Character:FindFirstChild("HumanoidRootPart")
                if rootPart and self:IsEntityAlive(otherPlayer.Character) and (rootPart.Position - playerPos).Magnitude <= self.Distance then
                    table.insert(targets, {otherPlayer.Character, rootPart})
                end
            end
        end
    end
    
    return targets
end

function FastAttackModule:Attack()
    local character = LocalPlayer.Character
    if not character or not character:FindFirstChild("HumanoidRootPart") then return end
    
    local weapon = character:FindFirstChildOfClass("Tool")
    if not weapon then return end
    
    local currentTime = tick()
    if currentTime - self.Debounce < 0.1 then return end
    self.Debounce = currentTime
    
    local targets = self:GetTargets(character)
    if #targets == 0 then return end
    
    local hitTargets = {}
    for _, target in ipairs(targets) do
        table.insert(hitTargets, {target[1], target[2]})
    end
    
    pcall(function()
        SendAttack(0.1, {hitTargets[1][2], hitTargets})
    end)
end

 FastAttack = Tabs.General:AddToggle("FastAttack", {
    Title = "Fast Attack",
    Default = true,
})

FastAttack:OnChanged(function(Value)
    _G.FastAttack = Value
end)

task.spawn(function()
    while true do
        if _G.FastAttack then
            pcall(function()
                FastAttackModule:Attack()
            end)
        end
        task.wait(0.1)
    end
end)

FruitAttack = Tabs.General:AddToggle("FruitAttack", {
    Title = "Fruit Attack",
    Default = true,
})

FruitAttack:OnChanged(function(Value)
    _G.FruitAttack = Value
    StopTween(_G.FruitAttack)
end)

function GetNearestTarget()
    local char = game.Players.LocalPlayer.Character
    if not char or not char:FindFirstChild("HumanoidRootPart") then return nil end

    local rootPart = char.HumanoidRootPart
    local nearestTarget = nil
    local shortestDistance = math.huge

    for _, player in pairs(game:GetService("Players"):GetPlayers()) do
        if player ~= game.Players.LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            local targetRoot = player.Character.HumanoidRootPart
            local distance = (targetRoot.Position - rootPart.Position).Magnitude
            
            if distance < shortestDistance then
                shortestDistance = distance
                nearestTarget = targetRoot
            end
        end
    end

    return nearestTarget
end

task.spawn(function()
    while task.wait(0.1) do
        if _G.FruitAttack then
            local char = game.Players.LocalPlayer.Character
            if char then
                for _, tool in pairs(char:GetChildren()) do
                    if tool:IsA("Tool") and tool:FindFirstChild("LeftClickRemote") then
                        local target = GetNearestTarget()
                        if target then
                            local direction = (target.Position - char.HumanoidRootPart.Position).Unit 
                            local args = {
                                [1] = direction,
                                [2] = math.random(1, 3) 
                            }
                            tool.LeftClickRemote:FireServer(unpack(args))
                        end
                    end
                end
            end
        end
    end
end)

BringMob = Tabs.General:AddToggle("BringMob", {
    Title = "Bring Mob",
    Default = true,
})

BringMob:OnChanged(function(Value)
    _G.BringMonster = Value
    StopTween(_G.BringMonster)
end)

spawn(function()
    local TS = game:GetService("TweenService")
    local bringCount = 1
    local mobTimers = {}
    while wait(0.1) do
        pcall(function()
            CheckQuest()
            for _, v in pairs(game.Workspace.Enemies:GetChildren()) do
                if _G.BringMonster and StartBring and (v.Name == MonFarm or v.Name == Mon) then
                    if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                        if (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 300 then
                            if not v:FindFirstChild("Stun") or v.Stun.Value <= 0 then
                                if not mobTimers[v] then
                                    mobTimers[v] = tick()
                                    spawn(function()
                                        wait(15)
                                        if v and v.Parent and v.Humanoid.Health > 0 then
                                            v:Destroy()
                                            mobTimers[v] = nil
                                        end
                                    end)
                                end
                                if not v.PrimaryPart then
                                    v.PrimaryPart = v.HumanoidRootPart
                                end
                                local distance = (v.HumanoidRootPart.Position - PosMon.Position).magnitude
                                local tweenTime = distance / 300
                                local tween = TS:Create(v.HumanoidRootPart, TweenInfo.new(tweenTime, Enum.EasingStyle.Linear), {CFrame = PosMon})
                                tween:Play()
                                v.Humanoid:ChangeState(14)
                                sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
                                bringCount = bringCount % 2 + 1
                                if bringCount == 1 then
                                    break
                                end
                            end
                        end
                    end
                end
            end
        end)
    end
end)

function FPSBooster()
    local decalsyeeted = true
    local g = game
    local w = g.Workspace
    local l = g.Lighting
    local t = w.Terrain

    l.GlobalShadows = false
    l.FogEnd = 1e10
    l.Brightness = 0

    task.spawn(function()
        for _, v in ipairs(g:GetDescendants()) do
            if v:IsA("Part") or v:IsA("Union") or v:IsA("CornerWedgePart") or v:IsA("TrussPart") then
                v.Material = Enum.Material.Plastic
                v.Reflectance = 0
            elseif (v:IsA("Decal") or v:IsA("Texture")) and decalsyeeted then
                v.Transparency = 1
            elseif v:IsA("Explosion") then
                v.BlastPressure = 1
                v.BlastRadius = 1
            elseif v:IsA("Fire") or v:IsA("SpotLight") or v:IsA("Smoke") or v:IsA("Sparkles") then
                v.Enabled = false
            elseif v:IsA("MeshPart") then
                v.Material = Enum.Material.Plastic
                v.Reflectance = 0
                v.TextureID = ""
            end
        end
    end)

    task.spawn(function()
        for _, e in ipairs(l:GetChildren()) do
            if e:IsA("BlurEffect") or e:IsA("SunRaysEffect") or e:IsA("ColorCorrectionEffect") or e:IsA("BloomEffect") or e:IsA("DepthOfFieldEffect") then
                e.Enabled = false
            end
        end
    end)
end

Tabs.General:AddButton({
    Title = "Reduce CPU",
    Description = "",
    Callback = function()
    FPSBooster()
end})

local x2Code = {
    "REWARDFUN", "Chandler", "NEWTROLL", "KITT_RESET", "Sub2CaptainMaui",
    "DEVSCOOKING", "kittgaming", "Sub2Fer999", "Enyu_is_Pro", "Magicbus",
    "JCWK", "Starcodeheo", "Bluxxy", "fudd10_v2", "SUB2GAMERROBOT_EXP1",
    "Sub2NoobMaster123", "Sub2UncleKizaru", "Sub2Daigrock", "Axiore",
    "TantaiGaming", "StrawHatMaine", "Sub2OfficialNoobie", "Fudd10",
    "Bignews", "TheGreatAce", "DRAGONABUSE", "SECRET_ADMIN", "ADMIN_TROLL",
    "STAFFBATTLE", "ADMIN_STRENGTH", "JULYUPDATE_RESET", "NOOB_REFUND",
    "15B_BESTBROTHERS", "CINCODEMAYO_BOOST", "ADMINGIVEAWAY",
    "GAMER_ROBOT_1M", "SUBGAMERROBOT_RESET", "SUB2GAMERROBOT_RESET1",
    "GAMERROBOT_YT", "TY_FOR_WATCHING", "EXP_5B", "RESET_5B", "UPD16",
    "3BVISITS", "2BILLION", "UPD15", "THIRDSEA", "1MLIKES_RESET", "UPD14",
    "1BILLION", "ShutDownFix2", "XmasExp", "XmasReset", "Update11",
    "PointsReset", "Update10", "Control", "SUB2OFFICIALNOOBIE", "AXIORE",
    "BIGNEWS", "BLUXXY", "CHANDLER", "ENYU_IS_PRO", "FUDD10", "FUDD10_V2",
    "KITTGAMING", "MAGICBUS", "STARCODEHEO", "STRAWHATMAINE",
    "SUB2CAPTAINMAUI", "SUB2DAIGROCK", "SUB2FER999", "SUB2NOOBMASTER123",
    "SUB2UNCLEKIZARU", "TANTAIGAMING", "THEGREATACE", "CONTROL", "UPDATE11",
    "XMASEXP", "Colosseum"
}

Tabs.General:AddButton({
    Title = "Redeem Code",
    Description = "",
    Callback = function()
        for _, code in ipairs(x2Code) do
            pcall(function()
                game:GetService("ReplicatedStorage").Remotes.Redeem:InvokeServer(code)
            end)
        end
    end
})



-------------------Quest-Item
if World1 then
Tabs.Quest:AddSection("Quest Second Sea")
Tos2 = Tabs.Quest:AddToggle("Tos2", {
    Title = "Quest to Second Sea",
    Default = false,
})

Tos2:OnChanged(function(Value)
    _G.CompleteQuest2 = Value
    StopTween(_G.CompleteQuest2)
end)

spawn(function()
    while task.wait(0.1) do
        if _G.CompleteQuest2 and not World2 then
            pcall(CompleteQuest2)
        end
    end
end)

Tabs.Quest:AddSection("Berries")
Berries = Tabs.Quest:AddToggle("Berries", {
    Title = "Collect Berries",
    Default = false,
})

Berries:OnChanged(function(Value)
    _G.CollectBerry = Value
    StopTween(_G.CollectBerry)
end)

BerriesHop = Tabs.Quest:AddToggle("BerriesHop", {
    Title = "Berries [ HOP ]",
    Default = false,
})

BerriesHop:OnChanged(function(Value)
    _G.CollectBerryHop = Value
end)

Tabs.Quest:AddSection("Pole")
Pole = Tabs.Quest:AddToggle("Pole", {
    Title = "Get Pole",
    Default = false,
})

Pole:OnChanged(function(Value)
    _G.AutoPole = Value
    StopTween(_G.AutoPole)
end)

PoleHop = Tabs.Quest:AddToggle("PoleHop", {
    Title = "Pole [ HOP ]",
    Default = false,
})

PoleHop:OnChanged(function(Value)
    _G.PoleHop = Value
end)

Tabs.Quest:AddSection("Saber")
Saber = Tabs.Quest:AddToggle("Saber", {
    Title = "Get Saber",
    Default = false,
})

Saber:OnChanged(function(Value)
    _G.AutoSaber = Value
    StopTween(_G.AutoSaber)
end)

spawn(function()
    while task.wait(0.1) do
        if _G.AutoSaber and not checkInventory("Saber") then
            pcall(Getsb)
        end
    end
end)
end

if World2 then
Tabs.Quest:AddSection("Berries")
Berries = Tabs.Quest:AddToggle("Berries", {
    Title = "Collect Berries",
    Default = false,
})

Berries:OnChanged(function(Value)
    _G.CollectBerry = Value
    StopTween(_G.CollectBerry)
end)

BerriesHop = Tabs.Quest:AddToggle("BerriesHop", {
    Title = "Berries [ HOP ]",
    Default = false,
})

BerriesHop:OnChanged(function(Value)
    _G.CollectBerryHop = Value
end)

Tabs.Quest:AddSection("Factory")
Factory = Tabs.Quest:AddToggle("Factory", {
    Title = "Attack Factory",
    Default = false,
})

Factory:OnChanged(function(Value)
    _G.AttackFac = Value
    StopTween(_G.AttackFac)
end)

spawn(function()
    while task.wait(0.1) do
        if _G.AttackFac then
            pcall(Factory)
        end
    end
end)

Tabs.Quest:AddSection("Darkbeard")
Darkbeard = Tabs.Quest:AddToggle("Darkbeard", {
    Title = "Kill Darkbeard",
    Default = false,
})

Darkbeard:OnChanged(function(Value)
    _G.KillDark = Value
    StopTween(_G.KillDark)
end)

DarkbeardHop = Tabs.Quest:AddToggle("DarkbeardHop", {
    Title = "Kill Darkbeard [ HOP ]",
    Default = false,
})

DarkbeardHop:OnChanged(function(Value)
    _G.DarkBeardHop = Value
    StopTween(_G.DarkBeardHopk)
end)

DarkbeardHopAPI = Tabs.Quest:AddToggle("DarkbeardHopAPI", {
    Title = "Kill Darkbeard [ API HOP ]",
    Default = false,
})

DarkbeardHop:OnChanged(function(Value)
    _G.DarkBeardHopApi = Value
    StopTween(_G.DarkBeardHopApi)
end)

spawn(function()
    while task.wait(0.1) do
        if _G.KillDark and CheckBoss("Darkbeard") then
            KillBoss("Darkbeard")
        elseif _G.DarkBeardHop and not CheckBoss("Darkbeard") then
            Hop()
        elseif _G.DarkBeardHopApi and not CheckBoss("Darkbeard") then
            HopB("dark")
        end
    end
end)

Tabs.Quest:AddSection("Rengoku")
Rengoku = Tabs.Quest:AddToggle("Rengoku", {
    Title = "Get Rengoku Sword",
    Default = false,
})

Rengoku:OnChanged(function(Value)
    _G.GetRen = Value
    StopTween(_G.GetRen)
end)

Tabs.Quest:AddSection("True Triple Katana")
Bar = Tabs.Quest:AddToggle("Bar", {
    Title = "Buy True Triple Katana",
    Default = false,
})

Bar:OnChanged(function(Value)
    _G.BuyZoroSword = Value
    StopTween(_G.BuyZoroSword)
end)

spawn(function()
    while task.wait(3) do
        if _G.BuyZoroSword then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("LegendarySwordDealer", "1")
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("LegendarySwordDealer", "2")
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("LegendarySwordDealer", "3")
        end
    end
end)

Tabs.Quest:AddSection("Race")
Ghoul = Tabs.Quest:AddToggle("Ghoul", {
    Title = "Get Ghoul Race",
    Default = false,
})

Ghoul:OnChanged(function(Value)
    _G.AutoGhoul = Value
    StopTween(_G.AutoGhoul)
end)

spawn(function()
    while task.wait(0.1) do
        if _G.AutoGhoul and game.Players.LocalPlayer.Data.Race.Value ~= "Ghoul" then
            pcall(GetGhoul)
        end
    end
end)

Ghoulh = Tabs.Quest:AddToggle("Ghoulh", {
    Title = "Get Ghoul [ Hop Use Api ]",
    Default = false,
})

Ghoulh:OnChanged(function(Value)
    _G.UseApi = Value
    StopTween(_G.UseApi)
end)

Cyborg = Tabs.Quest:AddToggle("Cyborg", {
    Title = "Get Cyborg Race",
    Default = false,
})

Cyborg:OnChanged(function(Value)
    _G.AutoCyborg = Value
    if Value then
    fireclickdetector(game.Workspace.Map.CircleIsland.RaidSummon.Button.Main.ClickDetector)
    fireclickdetector(game.Workspace.Map.CircleIsland.RaidSummon.Button.Main.ClickDetector)
    end
    StopTween(_G.AutoCyborg)
end)

Tabs.Quest:AddSection("Race Evo")
Bar = Tabs.Quest:AddToggle("Bar", {
    Title = "Do Bartilo Quest",
    Default = false,
})

Bar:OnChanged(function(Value)
    _G.AutoBartilo = Value
    StopTween(_G.AutoBartilo)
end)

V2 = Tabs.Quest:AddToggle("V2", {
    Title = "Evo Race V2",
    Default = false,
})

V2:OnChanged(function(Value)
    _G.Auto_EvoRace = Value
    StopTween(_G.Auto_EvoRace)
end)

V3 = Tabs.Quest:AddToggle("V3", {
    Title = "Evo Race V3",
    Default = false,
})

V3:OnChanged(function(Value)
    _G.EvoV3 = Value
    StopTween(_G.EvoV3)
end)

spawn(function()
    while task.wait(0.1) do
        if _G.EvoV3 and game:GetService("Players").LocalPlayer.Data.Race:FindFirstChild("Evolved") and game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Wenlocktoad", "3") ~= -2 then
            pcall(EvoRaceV3)
        end
    end
end)
end

if World3 then
Tabs.Quest:AddSection("Pirate Raid")
Pirate = Tabs.Quest:AddToggle("Pirate", {
    Title = "Pirate Raid",
    Default = false,
})

Pirate:OnChanged(function(Value)
    _G.PirateRaid = Value
    StopTween(_G.PirateRaid)
end)

spawn(function()
    while task.wait(0.1) do
        if _G.PirateRaid then
            pcall(PirateRaid)
        end
    end
end)

Tabs.Quest:AddSection("Berries")
Berries = Tabs.Quest:AddToggle("Berries", {
    Title = "Collect Berries",
    Default = false,
})

Berries:OnChanged(function(Value)
    _G.CollectBerry = Value
    StopTween(_G.CollectBerry)
end)

BerriesHop = Tabs.Quest:AddToggle("BerriesHop", {
    Title = "Berries [ HOP ]",
    Default = false,
})

BerriesHop:OnChanged(function(Value)
    _G.CollectBerryHop = Value
end)

Tabs.Quest:AddSection("Rainbow Haki")
Rainbow = Tabs.Quest:AddToggle("Rainbow", {
    Title = "Get Rainbow Haki",
    Default = false,
})

Rainbow:OnChanged(function(Value)
    _G.HakiRainbow = Value
    StopTween(_G.HakiRainbow)
end)

spawn(function()
    while task.wait(0.1) do
        if _G.HakiRainbow then
            pcall(RainBow)
        end
    end
end)

Tabs.Quest:AddSection("Observation Haki")
Citizen = Tabs.Quest:AddToggle("Citizen", {
    Title = "Do Citizen Quest",
    Default = false,
})

Citizen:OnChanged(function(Value)
    _G.DoCitizenQ = Value
    StopTween(_G.DoCitizenQ)
end)

spawn(function()
    while task.wait(0.1) do
        if _G.DoCitizenQ then
            pcall(Citizen)
        end
    end
end)

Observation = Tabs.Quest:AddToggle("Observation", {
    Title = "Auto Observation",
    Default = false,
})

Observation:OnChanged(function(Value)
    _G.AutoObservation = Value
    StopTween(_G.AutoObservation)
end)

Haki = Tabs.Quest:AddToggle("Haki", {
    Title = "Get Haki V2",
    Default = false,
})

Haki:OnChanged(function(Value)
    _G.GetHakiV2 = Value
    StopTween(_G.GetHakiV2)
end)

spawn(function()
    while task.wait(0.1) do
        if _G.GetHakiV2 then
            pcall(HakiV2)
        end
    end
end)

Tabs.Quest:AddSection("Skull Guitar [ Beta ]")
Skull = Tabs.Quest:AddToggle("Skull", {
    Title = "Get Skull Guitar",
    Default = false,
})

Skull:OnChanged(function(Value)
    _G.GetSkullGuitar = Value
    StopTween(_G.GetSkullGuitar)
end)

Skullh = Tabs.Quest:AddToggle("Skullh", {
    Title = "Get Skull Guitar [ HOP ]",
    Default = false,
})

Skullh:OnChanged(function(Value)
    _G.soulGuitarhop = Value
end)

Tabs.Quest:AddSection("rip_indra")
Pad = Tabs.Quest:AddToggle("Pad", {
    Title = "Open Haki Pad",
    Default = false,
})

Pad:OnChanged(function(Value)
    _G.OpenPad = Value
    StopTween(_G.OpenPad)
end)

rip_indra = Tabs.Quest:AddToggle("rip_indra", {
    Title = "Kill rip_indra",
    Default = false,
})

rip_indra:OnChanged(function(Value)
    _G.KillRipIndra = Value
    StopTween(_G.KillRipIndra)
end)

function EquipAuraSkin(skinName)
    local request = {
        [1] = {
            StorageName = skinName,
            Type = "AuraSkin",
            Context = "Equip"
        }
    }
    game:GetService("ReplicatedStorage").Modules.Net:FindFirstChild("RF/FruitCustomizerRF"):InvokeServer(unpack(request))
end

spawn(function()
    while task.wait(0.1) do
        if World3 and _G.OpenPad then
            for i, v in pairs(game.Workspace.Map["Boat Castle"].Summoner.Circle:GetChildren()) do
                if v.Name == "Part" and v.BrickColor.Name == "Oyster" and v:FindFirstChild("Part") and v.Part.BrickColor.Name == "Lime green" then
                    oyster = true
                elseif v.Name == "Part" and v.BrickColor.Name == "Hot pink" and v:FindFirstChild("Part") and v.Part.BrickColor.Name == "Lime green" then
                    hot = true
                elseif v.Name == "Part" and v.BrickColor.Name == "Really red" and v:FindFirstChild("Part") and v.Part.BrickColor.Name == "Lime green" then
                    really = true
                end
            end
        end
    end
end)

spawn(function()
    pcall(function()
        while task.wait(0.1) do
            if World3 and _G.OpenPad then
                if not oyster then
                    repeat task.wait(0.1)
                        EquipAuraSkin("Snow White")
                        topos(CFrame.new(-4971.47559, 331.565765, -3720.02954))
                    until oyster or not _G.OpenPad
                elseif oyster and not hot then
                    repeat task.wait(0.1)
                        EquipAuraSkin("Winter Sky")
                        topos(CFrame.new(-5420.16602, 1084.9657, -2666.8208))
                    until hot or not _G.OpenPad
                elseif oyster and hot and not really then
                    repeat task.wait(0.1)
                        EquipAuraSkin("Pure Red")
                        topos(CFrame.new(-5414.41357, 309.865753, -2212.45776))
                    until really or not _G.OpenPad
                end
            end
        end
    end)
end)

spawn(function()
    while task.wait(0.1) do
        if _G.KillRipIndra and CheckBoss("rip_indra") or CheckBoss("rip_indra True Form") then
        if CheckBoss("rip_indra") then
        KillBoss("rip_indra")
        elseif CheckBoss("rip_indra True Form") then
        KillBoss("rip_indra True Form")
        end
        end
    end
end)

Tabs.Quest:AddSection("Yama")
Elitehun = Tabs.Quest:AddToggle("Elitehun", {
    Title = "Kill Elite Boss",
    Default = false,
})

Elitehun:OnChanged(function(Value)
    _G.AutoElitehunter = Value
    StopTween(_G.AutoElitehunter)
end)

EliteHop = Tabs.Quest:AddToggle("EliteHop", {
    Title = "Kill Elite Boss [ HOP ]",
    Default = false,
})

EliteHop:OnChanged(function(Value)
    _G.AutoElitehunterHop = Value
end)

Yama = Tabs.Quest:AddToggle("Yama", {
    Title = "Get Yama",
    Default = false,
})

Yama:OnChanged(function(Value)
    _G.GetYama = Value
end)

Tabs.Quest:AddSection("Tushita")
Tushita = Tabs.Quest:AddToggle("Tushita", {
    Title = "Get Tushita",
    Default = false,
})

Tushita:OnChanged(function(Value)
    _G.GetTushita = Value
    StopTween(_G.GetTushita)
end)

TushitaHop = Tabs.Quest:AddToggle("TushitaHop", {
    Title = "Get Tushita [ API HOP RIP_INDRA ]",
    Default = false,
})

TushitaHop:OnChanged(function(Value)
    _G.HopBossIndra = Value
end)

Tabs.Quest:AddSection("Cursed Dual Katana")
CDK = Tabs.Quest:AddToggle("CDK", {
    Title = "Get CDK",
    Default = false,
})

CDK:OnChanged(function(Value)
    _G.CDKQuest = Value
    StopTween(_G.CDKQuest)
end)
end


--------/// Volcano

Tabs.Volcano:AddSection("Volcano Quest")
TP = Tabs.Volcano:AddToggle("TP", {
    Title = "TP to Volcano Island",
    Default = false,
})

TP:OnChanged(function(Value)
    _G.TweenPre = Value
    StopTween(_G.TweenPre)
end)

spawn(function()
    while not game:GetService("Workspace").Map:FindFirstChild("PrehistoricIsland") do
        wait()
    end
    while wait() do
        if _G.TweenPre then
            if game:GetService("Workspace").Map:FindFirstChild("PrehistoricIsland") then
                if game:GetService("Workspace").Map:FindFirstChild("PrehistoricIsland"):FindFirstChild("Core") and game:GetService("Workspace").Map:FindFirstChild("PrehistoricIsland").Core:FindFirstChild("PrehistoricRelic") then
                    if game:GetService("Workspace").Map:FindFirstChild("PrehistoricIsland").Core:FindFirstChild("PrehistoricRelic"):FindFirstChild("Skull") then
                        topos(CFrame.new(game:GetService("Workspace").Map:FindFirstChild("PrehistoricIsland").Core:FindFirstChild("PrehistoricRelic"):FindFirstChild("Skull").Position))
                        if game:GetService("Players").LocalPlayer.Character and (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position - game:GetService("Workspace").Map:FindFirstChild("PrehistoricIsland").Core:FindFirstChild("PrehistoricRelic"):FindFirstChild("Skull").Position).Magnitude <= 5 then
                            if game:GetService("Workspace").Map:FindFirstChild("PrehistoricIsland").Core:FindFirstChild("PrehistoricRelic"):FindFirstChild("Skull"):FindFirstChildOfClass("ProximityPrompt") then
                                fireproximityprompt(game:GetService("Workspace").Map:FindFirstChild("PrehistoricIsland").Core:FindFirstChild("PrehistoricRelic"):FindFirstChild("Skull"):FindFirstChildOfClass("ProximityPrompt"))
                            end
                        end
                    end
                end
            end
        end
    end
end)

Lava = Tabs.Volcano:AddToggle("Lava", {
    Title = "Kill Lava Golem",
    Default = false,
})

Lava:OnChanged(function(Value)
    _G.KillGolem = Value
    StopTween(_G.KillGolem)
end)

spawn(function()
    while wait() do
        if _G.KillGolem and World3 then
            pcall(function()
                if game:GetService("Players").LocalPlayer.PlayerGui.Main.TopHUDList.PrehistoricRaidTimer.Visible then
                    pcall(removeInteriorLava)
                    if game:GetService("Workspace").Enemies:FindFirstChild("Lava Golem") then
                        for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if v.Name == "Lava Golem" then
                                if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                    repeat task.wait()
                                        AutoHaki()
                                        topos(v.HumanoidRootPart.CFrame * CFrame.new(0, 20, 0))
                                        EquipWeapon(_G.SelectWeapon)
                                    until not _G.KillGolem or not v.Parent or v.Humanoid.Health <= 0
                                end
                            end
                        end
                    else
                        if game:GetService("ReplicatedStorage"):FindFirstChild("Lava Golem") then
                            topos(game:GetService("ReplicatedStorage"):FindFirstChild("Lava Golem").HumanoidRootPart.CFrame * CFrame.new(2,20,2))
                        end
                    end
                end
            end)
        end
    end
end)

def = Tabs.Volcano:AddToggle("def", {
    Title = "Defence Volcano Island",
    Default = false,
})

def:OnChanged(function(Value)
    _G.AutoDefendVolcano = Value
    StopTween(_G.AutoDefendVolcano)
end)

function findValidRock()
    local volcanoRocksFolder = game.Workspace.Map.PrehistoricIsland.Core.VolcanoRocks
    for _, Rock in pairs(volcanoRocksFolder:GetChildren()) do
        if Rock:IsA("Model") then
            local volcanorock = Rock:FindFirstChild("volcanorock")
            if volcanorock and volcanorock:IsA("MeshPart") then
                local color = volcanorock.Color
                if color == Color3.fromRGB(185, 53, 56) or color == Color3.fromRGB(185, 53, 57) then
                    return volcanorock
                end
            end
        end
    end
    return nil 
end

spawn(function()
    while wait() do
        if _G.AutoDefendVolcano and game:GetService("Players").LocalPlayer.PlayerGui.Main.TopHUDList.PrehistoricRaidTimer.Visible then
            AutoHaki()
            EquipWeapon(_G.SelectWeapon)
            pcall(removeInteriorLava)
            
            local currentTarget = findValidRock()
            if currentTarget then
                local targetPosition = CFrame.new(currentTarget.Position + Vector3.new(0, 1, 0))
                topos(targetPosition)
                
                local currentPosition = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
                local distance = (currentPosition - currentTarget.Position).Magnitude
                
                if distance <= 35 then
                    EquipWeapon(_G.SelectWeapon)
                    useSkill("Z")
                    useSkill("X")
                    useSkill("C")
                end
            end
        end
    end
end)

bone = Tabs.Volcano:AddToggle("bone", {
    Title = "Collect Bones",
    Default = false,
})

bone:OnChanged(function(Value)
    _G.AutoCollectBone = Value
    StopTween(_G.AutoCollectBone)
end)

spawn(function()
    while task.wait() do
        if _G.AutoCollectBone then
            for _, v in pairs(workspace:GetDescendants()) do
                if v:IsA("BasePart") and v.Name == "DinoBone" then
                    topos(v.CFrame)
                end
            end
        end
    end
end)

egg = Tabs.Volcano:AddToggle("egg", {
    Title = "Collect Egg",
    Default = false,
})

egg:OnChanged(function(Value)
    _G.AutoCollectEgg = Value
    StopTween(_G.AutoCollectEgg)
end)

spawn(function()
    while task.wait(0.1) do
        if _G.AutoCollectEgg then
            local eggs = workspace.Map.PrehistoricIsland.Core.SpawnedDragonEggs:GetChildren()
            if (#eggs > 0) then
                local randomEgg = eggs[math.random(1, #eggs)]
                if (randomEgg:IsA("Model") and randomEgg.PrimaryPart) then
                    topos(randomEgg.PrimaryPart.CFrame)
                    local playerPos = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
                    local eggPos = randomEgg.PrimaryPart.Position
                    local distance = (playerPos - eggPos).Magnitude
                    if (distance <= 5) then
                        local proximityPrompt = randomEgg:FindFirstChildOfClass("ProximityPrompt") or randomEgg:FindFirstChild("ProximityPrompt", true)
                        if proximityPrompt then
                            fireproximityprompt(proximityPrompt)
                        else
                            randomEgg:Destroy()
                        end
                    end
                end
            end
        end
    end
end)

Tabs.PVP:AddSection("PVP")
local Playerslist = {}
for i,v in pairs(game:GetService("Players"):GetChildren()) do
    table.insert(Playerslist,v.Name)
end

  SelectedPly = Tabs.PVP:AddDropdown("SelectedPly", {
    Title = "Select Player",
    Description = "",
    Values = Playerslist,
    Multi = false,
    Default = 1,
})

SelectedPly:SetValue("nil")
SelectedPly:OnChanged(function(Value)
    _G.SelectPly = Value
end)

Tabs.PVP:AddButton({
    Title = "Refresh Player",
    Description = "",
    Callback = function()
        Playerslist = {}
        if not SelectedPly then
            SelectedPly = {} 
        end
        if type(SelectedPly.Clear) == "function" then
            SelectedPly:Clear()
        end
        
        for i, v in pairs(game:GetService("Players"):GetChildren()) do  
            table.insert(Playerslist, v.Name)
            if type(SelectedPly.Add) == "function" then
                SelectedPly:Add(v.Name)
            end
        end
    end
})


  ToggleTeleport = Tabs.PVP:AddToggle("ToggleTeleport", {Title = "Teleport To Player", Description = "",Default = false })
ToggleTeleport:OnChanged(function(Value)
    _G.TeleportPly = Value
    StopTween(_G.TeleportPly)
end)

spawn(function()
	while wait() do
		if _G.TeleportPly then
			pcall(function()
				if game.Players:FindFirstChild(_G.SelectPly) then
					topos(game.Players[_G.SelectPly].Character.HumanoidRootPart.CFrame)
				end
			end)
		end
	end
end)	

Aimbot = Tabs.PVP:AddToggle("Aimbot", {Title = "Aimbot Skill", Description = "",Default = false })
Aimbot:OnChanged(function(Value)
    _G.AimbotSkill_LionHub_BestScript = Value
end)

local gg = getrawmetatable(game)
local old = gg.__namecall
setreadonly(gg, false)
gg.__namecall = newcclosure(function(...)
    local method = getnamecallmethod()
    local args = { ... }
    if tostring(method) == "FireServer" then
        if tostring(args[1]) == "RemoteEvent" then
            if tostring(args[2]) ~= "true" and tostring(args[2]) ~= "false" then
                if _G.AimbotSkill_LionHub_BestScript then
                    args[2] = AimBotSkillPosition
                    return old(unpack(args))
                end
            end
        end
    end
    return old(...)
end)

local function getDistance(position1, position2)
    return (position1 - position2).Magnitude
end

task.spawn(function()
    while task.wait() do
        if _G.AimbotSkill_LionHub_BestScript then
            local localPlayer = game.Players.LocalPlayer
            local localCharacter = localPlayer.Character
            local localRootPart = localCharacter and localCharacter:FindFirstChild("HumanoidRootPart")
            
            if localRootPart then
                local closestPlayer = nil
                local closestDistance = 1000  
                
                for _, player in pairs(game.Players:GetPlayers()) do
                    if player ~= localPlayer and player.Character then
                        local character = player.Character
                        local rootPart = character:FindFirstChild("HumanoidRootPart")
                        local humanoid = character:FindFirstChild("Humanoid")
                        
                        if rootPart and humanoid and humanoid.Health > 0 then
                            local distance = getDistance(localRootPart.Position, rootPart.Position)
                            if distance < closestDistance then
                                closestDistance = distance
                                closestPlayer = player
                            end
                        end
                    end
                end
                
                if closestPlayer then
                    AimBotSkillPosition = closestPlayer.Character:FindFirstChild("HumanoidRootPart").Position
                end
            end
        end
    end
end)

Tabs.PVP:AddSection("Visual")

ToggleIslandESP = Tabs.PVP:AddToggle("ToggleIslandESP", {Title = "🏝️ ESP Island", Default = false })
ToggleIslandESP:OnChanged(function(Value)
    _G.IslandESP = Value
end)

spawn(function()
    pcall(function()
        while wait() do
            if _G.IslandESP then
                for _, v in pairs(game:GetService("Workspace")["_WorldOrigin"].Locations:GetChildren()) do
                    pcall(function()
                        if v.Name ~= "Sea" then
                            if not v:FindFirstChild("NameEsp") then
                                local bill = Instance.new("BillboardGui", v)
                                bill.Name = "NameEsp"
                                bill.ExtentsOffset = Vector3.new(0, 1, 0)
                                bill.Size = UDim2.new(1, 200, 1, 30)
                                bill.Adornee = v
                                bill.AlwaysOnTop = true
                                local name = Instance.new("TextLabel", bill)
                                name.Font = Enum.Font.GothamBold
                                name.TextSize = 14
                                name.TextWrapped = true
                                name.Size = UDim2.new(1, 0, 1, 0)
                                name.TextYAlignment = Enum.TextYAlignment.Top
                                name.BackgroundTransparency = 1
                                name.TextStrokeTransparency = 0.5
                                name.TextColor3 = Color3.fromRGB(0, 191, 255)
                                name.Text = v.Name .. "\n" .. math.floor((game.Players.LocalPlayer.Character.Head.Position - v.Position).Magnitude / 3) .. " M"
                            else
                                v["NameEsp"].TextLabel.Text = v.Name .. "\n" .. math.floor((game.Players.LocalPlayer.Character.Head.Position - v.Position).Magnitude / 3) .. " M"
                            end
                        elseif v:FindFirstChild("NameEsp") then
                            v:FindFirstChild("NameEsp"):Destroy()
                        end
                    end)
                end
            else
                for _, v in pairs(game:GetService("Workspace")["_WorldOrigin"].Locations:GetChildren()) do
                    if v:FindFirstChild("NameEsp") then
                        v:FindFirstChild("NameEsp"):Destroy()
                    end
                end
            end
        end
    end)
end)

TogglePlayerESP = Tabs.PVP:AddToggle("TogglePlayerESP", {Title = "👤 ESP Player", Default = false })
TogglePlayerESP:OnChanged(function(Value)
    _G.ESPPlayer = Value
end)

spawn(function()
    pcall(function()
        while wait() do
            if _G.ESPPlayer then
                for _, v in pairs(game:GetService("Players"):GetPlayers()) do
                    pcall(function()
                        if v ~= game.Players.LocalPlayer and v.Character and v.Character:FindFirstChild("Head") then
                            local head = v.Character.Head
                            if not head:FindFirstChild("NameEsp") then
                                local bill = Instance.new("BillboardGui", head)
                                bill.Name = "NameEsp"
                                bill.ExtentsOffset = Vector3.new(0, 1, 0)
                                bill.Size = UDim2.new(1, 200, 1, 30)
                                bill.Adornee = head
                                bill.AlwaysOnTop = true
                                local name = Instance.new("TextLabel", bill)
                                name.Font = Enum.Font.GothamSemibold
                                name.TextSize = 14
                                name.TextWrapped = true
                                name.Size = UDim2.new(1, 0, 1, 0)
                                name.TextYAlignment = Enum.TextYAlignment.Top
                                name.BackgroundTransparency = 1
                                name.TextStrokeTransparency = 0.5
                                name.TextColor3 = v.Team == game.Players.LocalPlayer.Team and Color3.fromRGB(0, 255, 128) or Color3.fromRGB(255, 69, 58)
                                local humanoid = v.Character:FindFirstChild("Humanoid")
                                if humanoid then
                                    local dist = math.floor((game.Players.LocalPlayer.Character.Head.Position - head.Position).Magnitude / 3)
                                    local hp = math.floor(humanoid.Health * 100 / humanoid.MaxHealth)
                                    name.Text = v.Name .. "\n" .. dist .. " M | HP: " .. hp .. "%"
                                end
                            else
                                local humanoid = v.Character:FindFirstChild("Humanoid")
                                if humanoid then
                                    local dist = math.floor((game.Players.LocalPlayer.Character.Head.Position - head.Position).Magnitude / 3)
                                    local hp = math.floor(humanoid.Health * 100 / humanoid.MaxHealth)
                                    head["NameEsp"].TextLabel.Text = v.Name .. "\n" .. dist .. " M | HP: " .. hp .. "%"
                                end
                            end
                        end
                    end)
                end
            else
                for _, v in pairs(game:GetService("Players"):GetPlayers()) do
                    if v ~= game.Players.LocalPlayer and v.Character and v.Character:FindFirstChild("Head") and v.Character.Head:FindFirstChild("NameEsp") then
                        v.Character.Head:FindFirstChild("NameEsp"):Destroy()
                    end
                end
            end
        end
    end)
end)

ToggleDevilFruitESP = Tabs.PVP:AddToggle("ToggleDevilFruitESP", {Title = "🍈 ESP Devil Fruit", Default = false })
ToggleDevilFruitESP:OnChanged(function(Value)
    _G.DevilFruitESP = Value
end)

spawn(function()
    pcall(function()
        while wait() do
            if _G.DevilFruitESP then
                for _, v in pairs(game.Workspace:GetChildren()) do
                    pcall(function()
                        if string.find(v.Name, "Fruit") and v:FindFirstChild("Handle") then
                            if not v.Handle:FindFirstChild("NameEsp") then
                                local bill = Instance.new("BillboardGui", v.Handle)
                                bill.Name = "NameEsp"
                                bill.ExtentsOffset = Vector3.new(0, 1, 0)
                                bill.Size = UDim2.new(1, 200, 1, 30)
                                bill.Adornee = v.Handle
                                bill.AlwaysOnTop = true
                                local name = Instance.new("TextLabel", bill)
                                name.Font = Enum.Font.GothamSemibold
                                name.TextSize = 14
                                name.TextWrapped = true
                                name.Size = UDim2.new(1, 0, 1, 0)
                                name.TextYAlignment = Enum.TextYAlignment.Top
                                name.BackgroundTransparency = 1
                                name.TextStrokeTransparency = 0.5
                                name.TextColor3 = Color3.fromRGB(255, 182, 193)
                                name.Text = v.Name .. "\n" .. math.floor((game.Players.LocalPlayer.Character.Head.Position - v.Handle.Position).Magnitude / 3) .. " M"
                            else
                                v.Handle["NameEsp"].TextLabel.Text = v.Name .. "\n" .. math.floor((game.Players.LocalPlayer.Character.Head.Position - v.Handle.Position).Magnitude / 3) .. " M"
                            end
                        end
                    end)
                end
            else
                for _, v in pairs(game.Workspace:GetChildren()) do
                    if v:FindFirstChild("Handle") and v.Handle:FindFirstChild("NameEsp") then
                        v.Handle:FindFirstChild("NameEsp"):Destroy()
                    end
                end
            end
        end
    end)
end)

ToggleBerryESP = Tabs.PVP:AddToggle("ToggleBerryESP", {Title = "🍓 ESP Berries", Default = false })
ToggleBerryESP:OnChanged(function(Value)
    _G.BerryESP = Value
end)

spawn(function()
    pcall(function()
        while wait() do
            if _G.BerryESP then
                for _, v in pairs(game:GetService("CollectionService"):GetTagged("BerryBush")) do
                    pcall(function()
                        for AttributeName, Berry in pairs(v:GetAttributes()) do
                            if Berry then
                                if not v.Parent:FindFirstChild("BerryESP") then
                                    local bill = Instance.new("BillboardGui", v.Parent)
                                    bill.Name = "BerryESP"
                                    bill.ExtentsOffset = Vector3.new(0, 2, 0)
                                    bill.Size = UDim2.new(1, 200, 1, 30)
                                    bill.Adornee = v.Parent
                                    bill.AlwaysOnTop = true
                                    local name = Instance.new("TextLabel", bill)
                                    name.Font = Enum.Font.GothamSemibold
                                    name.TextSize = 14
                                    name.TextWrapped = true
                                    name.Size = UDim2.new(1, 0, 1, 0)
                                    name.TextYAlignment = Enum.TextYAlignment.Top
                                    name.BackgroundTransparency = 1
                                    name.TextStrokeTransparency = 0.5
                                    name.TextColor3 = Color3.fromRGB(255, 255, 0)
                                    name.Text = Berry .. "\n" .. math.floor((game.Players.LocalPlayer.Character.Head.Position - v.Parent:GetPivot().Position).Magnitude / 3) .. " M"
                                else
                                    v.Parent["BerryESP"].TextLabel.Text = Berry .. "\n" .. math.floor((game.Players.LocalPlayer.Character.Head.Position - v.Parent:GetPivot().Position).Magnitude / 3) .. " M"
                                end
                            end
                        end
                    end)
                end
            else
                for _, v in pairs(game:GetService("CollectionService"):GetTagged("BerryBush")) do
                    if v.Parent:FindFirstChild("BerryESP") then
                        v.Parent:FindFirstChild("BerryESP"):Destroy()
                    end
                end
            end
        end
    end)
end)

ToggleMirageIslandESP = Tabs.PVP:AddToggle("ToggleMirageIslandESP", {Title = "🌌 ESP Mirage Island", Default = false })
ToggleMirageIslandESP:OnChanged(function(Value)
    _G.MirageIslandESP = Value
end)

spawn(function()
    pcall(function()
        while wait() do
            if _G.MirageIslandESP then
                for _, v in pairs(game:GetService("Workspace")["_WorldOrigin"].Locations:GetChildren()) do
                    pcall(function()
                        if v.Name == "Mirage Island" then
                            if not v:FindFirstChild("NameEsp") then
                                local bill = Instance.new("BillboardGui", v)
                                bill.Name = "NameEsp"
                                bill.ExtentsOffset = Vector3.new(0, 1, 0)
                                bill.Size = UDim2.new(1, 200, 1, 30)
                                bill.Adornee = v
                                bill.AlwaysOnTop = true
                                local name = Instance.new("TextLabel", bill)
                                name.Font = Enum.Font.Code
                                name.TextSize = 14
                                name.TextWrapped = true
                                name.Size = UDim2.new(1, 0, 1, 0)
                                name.TextYAlignment = Enum.TextYAlignment.Top
                                name.BackgroundTransparency = 1
                                name.TextStrokeTransparency = 0.5
                                name.TextColor3 = Color3.fromRGB(147, 112, 219)
                                name.Text = v.Name .. "\n" .. math.floor((game.Players.LocalPlayer.Character.Head.Position - v.Position).Magnitude / 3) .. " M"
                            else
                                v["NameEsp"].TextLabel.Text = v.Name .. "\n" .. math.floor((game.Players.LocalPlayer.Character.Head.Position - v.Position).Magnitude / 3) .. " M"
                            end
                        end
                    end)
                end
            else
                for _, v in pairs(game:GetService("Workspace")["_WorldOrigin"].Locations:GetChildren()) do
                    if v.Name == "Mirage Island" and v:FindFirstChild("NameEsp") then
                        v:FindFirstChild("NameEsp"):Destroy()
                    end
                end
            end
        end
    end)
end)

ToggleChestESP = Tabs.PVP:AddToggle("ToggleChestESP", {Title = "💰 ESP Chest", Default = false })
ToggleChestESP:OnChanged(function(Value)
    _G.ChestESP = Value
end)

spawn(function()
    pcall(function()
        while wait() do
            if _G.ChestESP then
                for _, chest in pairs(game:GetService("CollectionService"):GetTagged("_ChestTagged")) do
                    pcall(function()
                        if not chest:GetAttribute("IsDisabled") then
                            if not chest:FindFirstChild("ChestEsp") then
                                local bill = Instance.new("BillboardGui", chest)
                                bill.Name = "ChestEsp"
                                bill.ExtentsOffset = Vector3.new(0, 1, 0)
                                bill.Size = UDim2.new(1, 200, 1, 30)
                                bill.Adornee = chest
                                bill.AlwaysOnTop = true
                                local name = Instance.new("TextLabel", bill)
                                name.Font = Enum.Font.Code
                                name.TextSize = 14
                                name.TextWrapped = true
                                name.Size = UDim2.new(1, 0, 1, 0)
                                name.TextYAlignment = Enum.TextYAlignment.Top
                                name.BackgroundTransparency = 1
                                name.TextStrokeTransparency = 0.5
                                name.TextColor3 = Color3.fromRGB(255, 223, 0)
                                name.Text = "Chest\n" .. math.floor((game.Players.LocalPlayer.Character.Head.Position - chest:GetPivot().Position).Magnitude / 3) .. " M"
                            else
                                chest["ChestEsp"].TextLabel.Text = "Chest\n" .. math.floor((game.Players.LocalPlayer.Character.Head.Position - chest:GetPivot().Position).Magnitude / 3) .. " M"
                            end
                        end
                    end)
                end
            else
                for _, chest in pairs(game:GetService("CollectionService"):GetTagged("_ChestTagged")) do
                    if chest:FindFirstChild("ChestEsp") then
                        chest:FindFirstChild("ChestEsp"):Destroy()
                    end
                end
            end
        end
    end)
end)

--------/// Devil Fruit
MirageStockInfo = Tabs.DevilFruit:AddParagraph({
        Title = "Mirage Stock",
        Content = ""
    })

    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local Remotes = ReplicatedStorage.Remotes
    local Event = Remotes["CommF_"]
    local result = Event:InvokeServer("GetFruits", true)
    local fruitsOnSale = {}
    function addCommas(number)
        local formatted = tostring(number)
        while true do
            formatted, k = formatted:gsub("^(-?%d+)(%d%d%d)", '%1,%2')
            if k == 0 then break end
        end
        return formatted
    end

    local content = ""
    for _, fruitData in pairs(result) do
        if fruitData["OnSale"] == true then
            local priceWithCommas = addCommas(fruitData["Price"])
            local fruitInfo = fruitData["Name"] .. " - $" .. priceWithCommas
            table.insert(fruitsOnSale, fruitInfo)
        end
    end
    content = table.concat(fruitsOnSale, "\n")
    MirageStockInfo:SetDesc(content)
    

SelectFruit = Tabs.DevilFruit:AddDropdown("SelectFruit", {
    Title = "Select Fruit",
    Values = FruitList,
    Multi = false,
    Default = 1
})

SelectFruit:SetValue("🐉 Dragon-Dragon")

SelectFruit:OnChanged(function(value)
    _G.SelectChut = value
end)

Toggle = Tabs.DevilFruit:AddToggle("MyToggle", {Title = "Buy Fruit Selected", Default = false})

Toggle:OnChanged(function(Value)
    _G.Buyfruit = Value
end)

ToggleRandomFruit = Tabs.DevilFruit:AddToggle("ToggleRandomFruit", {Title = "Random Fruit", Default = false })
ToggleRandomFruit:OnChanged(function(Value)
    _G.RandomF = Value
end)

tweenf = Tabs.DevilFruit:AddToggle("tweenf", {Title = "Tween Fruit", Default = false })
tweenf:OnChanged(function(Value)
    _G.Tweenfruit = Value
    StopTween(_G.Tweenfruit)
end)

bringf = Tabs.DevilFruit:AddToggle("bringf", {Title = "Bring Fruit", Default = false })
bringf:OnChanged(function(Value)
    _G.bringfruit = Value
    StopTween(_G.bringfruit)
end)

storef = Tabs.DevilFruit:AddToggle("storef", {Title = "Store Fruit", Default = false })
storef:OnChanged(function(Value)
    _G.StoreF = Value
    StopTween(_G.StoreF)
end)
-------/// Dungeon

schip = Tabs.Dungeon:AddDropdown("schip", {
    Title = "Select Raid Chip",
    Values = {"Flame","Ice","Quake","Light","Dark","Spider","Rumble","Magma","Buddha","Sand","Phoenix","Dough"},
    Multi = false,
})

schip:SetValue("Flame")
schip:OnChanged(function(Value)
    _G.SelectedChip = Value
end)

bchip = Tabs.Dungeon:AddToggle("bchip", {Title = "Buy Selected Chip", Default = false })
bchip:OnChanged(function(Value)
    _G.BuyChipRaid = Value
end)

dung = Tabs.Dungeon:AddToggle("dung", {Title = "Enable Raid", Default = false })
dung:OnChanged(function(Value)
    _G.KillRaid = Value
    _G.AutoStartRaid = Value
    StopTween(_G.KillRaid)
end)

awa = Tabs.Dungeon:AddToggle("awa", {Title = "Awakened Fruit", Default = false })
awa:OnChanged(function(Value)
    _G.AwaF = Value
end)

Under = Tabs.Dungeon:AddToggle("Under", {Title = "Get Fruit Under 1m", Default = false })
Under:OnChanged(function(Value)
    _G.GetFruitUnder1m = Value
end)

Tabs.Dungeon:AddSection("Gravity")

Gra = Tabs.Dungeon:AddToggle("Gra", {Title = "Evo Gravity", Default = false })
Gra:OnChanged(function(Value)
    _G.GravityV2 = Value
    StopTween(_G.GravityV2)
end)

Tabs.Dungeon:AddSection("Law Raid")

law = Tabs.Dungeon:AddToggle("law", {Title = "Enable Law Raid", Default = false })
law:OnChanged(function(Value)
    _G.StartLawRaid = Value
    StopTween(_G.StartLawRaid)
end)

Tabs.Dungeon:AddButton({
    Title = "Buy Law Chip",
    Description = "",
    Callback = function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward", "Microchip", "1")
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward", "Microchip", "2")
end})

Tabs.Dungeon:AddButton({
    Title = "Start Raid",
    Description = "",
    Callback = function()
    fireclickdetector(game:GetService("Workspace").Map.CircleIsland.RaidSummon.Button.Main.ClickDetector)
end})


---------// Travel

Tabs.Travel:AddButton({
    Title = "Sea 1",
    Description = "",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelMain")
    end
})

Tabs.Travel:AddButton({
    Title = "Sea 2",
    Description = "",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelDressrosa")
    end
})

Tabs.Travel:AddButton({
    Title = "Sea 3",
    Description = "",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelZou")
    end
})

local islandValues = {}
if World1 then
    table.insert(islandValues, {
        "WindMill", "Marine", "Middle Town", "Jungle", "Pirate Village", "Desert", "Snow Island",
        "MarineFord", "Colosseum", "Sky Island 1", "Sky Island 2", "Sky Island 3", "Prison",
        "Magma Village", "Under Water Island", "Fountain City", "Shank Room", "Mob Island"
    })
end
if World2 then
    table.insert(islandValues, {
        "The Cafe", "Frist Spot", "Dark Area", "Flamingo Mansion", "Flamingo Room", "Green Zone",
        "Factory", "Colossuim", "Zombie Island", "Two Snow Mountain", "Punk Hazard", "Cursed Ship",
        "Ice Castle", "Forgotten Island", "Ussop Island", "Mini Sky Island"
    })
end
if World3 then
    table.insert(islandValues, {
        "Mansion", "Port Town", "Great Tree", "Castle On The Sea", "MiniSky", "Hydra Island",
        "Hydra Temple", "Floating Turtle", "Haunted Castle", "Ice Cream Island", "Peanut Island",
        "Cake Island", "Cocoa Island", "Tiki Outpost"
    })
end

local flattenedValues = {}
for _, world in pairs(islandValues) do
    for _, island in pairs(world) do
        table.insert(flattenedValues, island)
    end
end

IslandSelect = Tabs.Travel:AddDropdown("IslandSelect", {
    Title = "Select Island",
    Values = flattenedValues,
    Multi = false,
    Default = false
})

IslandSelect:SetValue(World1 and "WindMill" or World2 and "The Cafe" or World3 and "Mansion" or nil)
IslandSelect:OnChanged(function(Value)
    _G.SelectIsland = Value
end)

TeleportIsland = Tabs.Travel:AddToggle("TeleportIsland", {
    Title = "Teleport To Island",
    Default = false
})

TeleportIsland:OnChanged(function(Value)
    _G.TeleportIsland = Value
    StopTween(_G.TeleportIsland)
    if _G.TeleportIsland then
        spawn(function()
            while task.wait() and _G.TeleportIsland do
                pcall(function()
                    if _G.SelectIsland == "WindMill" then
                        topos(CFrame.new(979.79895019531, 16.516613006592, 1429.0466308594))
                    elseif _G.SelectIsland == "Marine" then
                        topos(CFrame.new(-2566.4296875, 6.8556680679321, 2045.2561035156))
                    elseif _G.SelectIsland == "Middle Town" then
                        topos(CFrame.new(-690.33081054688, 15.09425163269, 1582.2380371094))
                    elseif _G.SelectIsland == "Jungle" then
                        topos(CFrame.new(-1612.7957763672, 36.852081298828, 149.12843322754))
                    elseif _G.SelectIsland == "Pirate Village" then
                        topos(CFrame.new(-1181.3093261719, 4.7514905929565, 3803.5456542969))
                    elseif _G.SelectIsland == "Desert" then
                        topos(CFrame.new(944.15789794922, 20.919729232788, 4373.3002929688))
                    elseif _G.SelectIsland == "Snow Island" then
                        topos(CFrame.new(1347.8067626953, 104.66806030273, -1319.7370605469))
                    elseif _G.SelectIsland == "MarineFord" then
                        topos(CFrame.new(-4914.8212890625, 50.963626861572, 4281.0278320313))
                    elseif _G.SelectIsland == "Colosseum" then
                        topos(CFrame.new(-1427.6203613281, 7.2881078720093, -2792.7722167969))
                    elseif _G.SelectIsland == "Sky Island 1" then
                        topos(CFrame.new(-4869.1025390625, 733.46051025391, -2667.0180664063))
                    elseif _G.SelectIsland == "Sky Island 2" then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(-4607.82275, 872.54248, -1667.55688))
                    elseif _G.SelectIsland == "Sky Island 3" then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(-7894.6176757813, 5547.1416015625, -380.29119873047))
                    elseif _G.SelectIsland == "Prison" then
                        topos(CFrame.new(4875.330078125, 5.6519818305969, 734.85021972656))
                    elseif _G.SelectIsland == "Magma Village" then
                        topos(CFrame.new(-5247.7163085938, 12.883934020996, 8504.96875))
                    elseif _G.SelectIsland == "Under Water Island" then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(61163.8515625, 11.6796875, 1819.7841796875))
                    elseif _G.SelectIsland == "Fountain City" then
                        topos(CFrame.new(5127.1284179688, 59.501365661621, 4105.4458007813))
                    elseif _G.SelectIsland == "Shank Room" then
                        topos(CFrame.new(-1442.16553, 29.8788261, -28.3547478))
                    elseif _G.SelectIsland == "Mob Island" then
                        topos(CFrame.new(-2850.20068, 7.39224768, 5354.99268))
                    elseif _G.SelectIsland == "The Cafe" then
                        topos(CFrame.new(-380.47927856445, 77.220390319824, 255.82550048828))
                    elseif _G.SelectIsland == "Frist Spot" then
                        topos(CFrame.new(-11.311455726624, 29.276733398438, 2771.5224609375))
                    elseif _G.SelectIsland == "Dark Area" then
                        topos(CFrame.new(3780.0302734375, 22.652164459229, -3498.5859375))
                    elseif _G.SelectIsland == "Flamingo Mansion" then
                        topos(CFrame.new(-483.73370361328, 332.0383605957, 595.32708740234))
                    elseif _G.SelectIsland == "Flamingo Room" then
                        topos(CFrame.new(2284.4140625, 15.152037620544, 875.72534179688))
                    elseif _G.SelectIsland == "Green Zone" then
                        topos(CFrame.new(-2448.5300292969, 73.016105651855, -3210.6306152344))
                    elseif _G.SelectIsland == "Factory" then
                        topos(CFrame.new(424.12698364258, 211.16171264648, -427.54049682617))
                    elseif _G.SelectIsland == "Colossuim" then
                        topos(CFrame.new(-1503.6224365234, 219.7956237793, 1369.3101806641))
                    elseif _G.SelectIsland == "Zombie Island" then
                        topos(CFrame.new(-5622.033203125, 492.19604492188, -781.78552246094))
                    elseif _G.SelectIsland == "Two Snow Mountain" then
                        topos(CFrame.new(753.14288330078, 408.23559570313, -5274.6147460938))
                    elseif _G.SelectIsland == "Punk Hazard" then
                        topos(CFrame.new(-6127.654296875, 15.951762199402, -5040.2861328125))
                    elseif _G.SelectIsland == "Cursed Ship" then
                        topos(CFrame.new(923.40197753906, 125.05712890625, 32885.875))
                    elseif _G.SelectIsland == "Ice Castle" then
                        topos(CFrame.new(6148.4116210938, 294.38687133789, -6741.1166992188))
                    elseif _G.SelectIsland == "Forgotten Island" then
                        topos(CFrame.new(-3032.7641601563, 317.89672851563, -10075.373046875))
                    elseif _G.SelectIsland == "Ussop Island" then
                        topos(CFrame.new(4816.8618164063, 8.4599885940552, 2863.8195800781))
                    elseif _G.SelectIsland == "Mini Sky Island" then
                        topos(CFrame.new(-288.74060058594, 49326.31640625, -35248.59375))
                    elseif _G.SelectIsland == "Great Tree" then
                        topos(CFrame.new(2681.2736816406, 1682.8092041016, -7190.9853515625))
                    elseif _G.SelectIsland == "Castle On The Sea" then
                        topos(CFrame.new(-5074.45556640625, 314.5155334472656, -2991.054443359375))
                    elseif _G.SelectIsland == "MiniSky" then
                        topos(CFrame.new(-260.65557861328, 49325.8046875, -35253.5703125))
                    elseif _G.SelectIsland == "Port Town" then
                        topos(CFrame.new(-135.15020751953125, 21.52459144592285, 5482.73828125))
                    elseif _G.SelectIsland == "Hydra Island" then
                        topos(CFrame.new(5558.84716796875, 1106.465087890625, 104.48194885253906))
                    elseif _G.SelectIsland == "Hydra Temple" then
                        topos(CFrame.new(5781.1083984375, 1360.948974609375, 911.2042846679688))
                    elseif _G.SelectIsland == "Floating Turtle" then
                        topos(CFrame.new(-13274.528320313, 531.82073974609, -7579.22265625))
                    elseif _G.SelectIsland == "Mansion" then
                        topos(CFrame.new(-12471.169921875, 374.94024658203, -7551.677734375))
                    elseif _G.SelectIsland == "Haunted Castle" then
                        topos(CFrame.new(-9515.3720703125, 164.00624084473, 5786.0610351562))
                    elseif _G.SelectIsland == "Ice Cream Island" then
                        topos(CFrame.new(-902.56817626953, 79.93204498291, -10988.84765625))
                    elseif _G.SelectIsland == "Peanut Island" then
                        topos(CFrame.new(-2062.7475585938, 50.473892211914, -10232.568359375))
                    elseif _G.SelectIsland == "Cake Island" then
                        topos(CFrame.new(-1884.7747802734375, 19.327526092529297, -11666.8974609375))
                    elseif _G.SelectIsland == "Cocoa Island" then
                        topos(CFrame.new(87.94276428222656, 73.55451202392578, -12319.46484375))
                    elseif _G.SelectIsland == "Tiki Outpost" then
                        topos(CFrame.new(-16207, 9, 443))
                    end
                end)
            end
        end)
    end
end)


--------// Race V4
--// Mirage

Pulllever = Tabs.RaceV4:AddParagraph({
    Title = "Pull Lever",
    Content = ""
})

spawn(function()
    while wait(1) do
        pcall(function()
        if World3 then
            if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CheckTempleDoor") == true then
                Pulllever:SetDesc("✅ Done")
                done = true
            else
                Pulllever:SetDesc("❌ Not Done")
               end
            end
        end)
    end
end)

Unlock = Tabs.RaceV4:AddToggle("Unlock", {Title = "Fully Auto Unlock Race V4 Entrance", Default = false })
Unlock:OnChanged(function(Value)
    _G.FullyGear = Value
    StopTween(_G.FullyGear)
end)

TMirage = Tabs.RaceV4:AddToggle("TMirage", {Title = "To Mirage Island", Default = false })
TMirage:OnChanged(function(Value)
    _G.AutoMysticIsland = Value
    StopTween(_G.AutoMysticIsland)
end)

Lock = Tabs.RaceV4:AddToggle("Lock", {Title = "Lock Moon", Default = false })
Lock:OnChanged(function(Value)
    _G.LockM = Value
end)

Gear = Tabs.RaceV4:AddToggle("Gear", {Title = "Tween Gear", Default = false })
Gear:OnChanged(function(Value)
    _G.TweenMGear = Value
    StopTween(_G.TweenMGear)
end)

--// Up V4 With Team
Tabs.RaceV4:AddSection("Up V4 With Team")

SelectedPly = Tabs.RaceV4:AddDropdown("SelectedPly", {
    Title = "Select Player",
    Description = "",
    Values = Playerslist,
    Multi = false,
    Default = 1,
})

SelectedPly:SetValue("nil")
SelectedPly:OnChanged(function(Value)
    _G.SelectPlayerUpV4 = Value
end)

Awakens = Tabs.RaceV4:AddToggle("Awakens", {Title = "Player Awakens V4", Description = "[Activate to upgrade this account]", Default = false })
Awakens:OnChanged(function(Value)
    _G.PlayerAwaV4 = Value
end)

Door = Tabs.RaceV4:AddToggle("Door", {Title = "To Race Door", Description = "", Default = false})
Door:OnChanged(function(Value)
    _G.TweenRaceDoor = Value
    StopTween(_G.TweenRaceDoor)
end)

Complete = Tabs.RaceV4:AddToggle("Complete", {Title = "Complete Trial", Description = "", Default = false})
Complete:OnChanged(function(Value)
    _G.CompleteTrial = Value
    StopTween(_G.CompleteTrial)
end)

Choose = Tabs.RaceV4:AddToggle("Choose", {Title = "Choose gear", Description = "", Default = false})
Choose:OnChanged(function(Value)
    _G.AutoUpgradeGear = Value
end)

Reset = Tabs.RaceV4:AddToggle("Reset", {Title = "Reset After Trial", Description = "", Default = false})
Reset:OnChanged(function(Value)
    _G.ResetAfterTrial = Value
end)

Kill = Tabs.RaceV4:AddToggle("Kill", {Title = "Kill Player After Trial", Description = "", Default = false})
Kill:OnChanged(function(Value)
    _G.KillPlayerAfterTrial = Value
    StopTween(_G.KillPlayerAfterTrial)
end)

Tabs.RaceV4:AddSection("Train")
Train = Tabs.RaceV4:AddParagraph({
    Title = "Status Train:",
    Content = ""
})

spawn(function()
    while task.wait(3) do
        pcall(function()
        if World3 then
            local response = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("UpgradeRace", "Check")
            if tonumber(response) and response ~= 0 then
                Train:SetDesc("You Need To Train First")
            else
                Train:SetDesc("You Are Ready For Next Trial")
                end
            end
        end)
    end
end)

ATrain = Tabs.RaceV4:AddToggle("ATrain", {Title = "Auto Train", Description = "", Default = false})
ATrain:OnChanged(function(Value)
    _G.AutoTrain = Value
    StopTween(_G.AutoTrain)
end)

-----/// Sea Event

SeBoat = Tabs.SeaEvent:AddDropdown("SeBoat", {
    Title = "Select Boat",
    Values = {"Dinghy", "PirateSloop", "PirateBrigade", "PirateGrandBrigade", "MarineSloop", "MarineBrigade", "MarineGrandBrigade", "Guardian", "Lantern", "Beast Hunter"},
    Multi = false,
    Default = 1
})
SeBoat:SetValue('Guardian')

SeBoat:OnChanged(function(Value)
    SelectBoat = Value
end)

SeSea = Tabs.SeaEvent:AddDropdown("SeSea", {
    Title = "Select Sea",
    Values = {"Sea1[Low]", "Sea2[Medium]", "Sea3[High]", "Sea4[Extreme]", "Sea5[Crazy]", "Sea6[???]", "Infinity"},
    Multi = false,
    Default = 1
})
SeSea:SetValue('Sea6[???]')

SeSea:OnChanged(function(Value)
    _G.SelectLocalTeleportSea = Value
end)

SeaEv = Tabs.SeaEvent:AddToggle("SeaEv", {
    Title = "Auto Sea Event",
    Default = false 
})

SeaEv:OnChanged(function(Value)
    _G.AutoSeaEvent = Value
    StopTween(_G.AutoSeaEvent)
end)

ReSea = Tabs.SeaEvent:AddToggle("ReSea", {
    Title = "Reset if no boat found",
    Default = false 
})

ReSea:OnChanged(function(Value)
    _G.ResetSea = Value
    StopTween(_G.ResetSea)
end)

NCR = Tabs.SeaEvent:AddToggle("NCR", {
    Title = "No Clip Rock",
    Default = false 
})

NCR:OnChanged(function(Value)
    _G.Nocliprock = Value
end)

SPB = Tabs.SeaEvent:AddToggle("SPB", {
    Title = "Speed Boat",
    Default = false 
})

SPB:OnChanged(function(Value)
    _G.IncreaseBoatSpeed = Value
end)

Tabs.SeaEvent:AddSection("Sea Monsters")
TRS = Tabs.SeaEvent:AddToggle("TRS", {
    Title = "Kill Terrorshark",
    Default = false 
})

TRS:OnChanged(function(Value)
    _G.FarmTerrorshark = Value
    StopTween(_G.FarmTerrorshark)
end)

SN = Tabs.SeaEvent:AddToggle("SN", {
    Title = "Kill Shark",
    Default = false 
})

SN:OnChanged(function(Value)
    _G.FarmShark = Value
    StopTween(_G.FarmShark)
end)

Piraha = Tabs.SeaEvent:AddToggle("Piraha", {
    Title = "Kill Piraha",
    Default = false 
})

Piraha:OnChanged(function(Value)
    _G.FarmPiranha = Value
    StopTween(_G.FarmPiranha)
end)

FishCrewMem = Tabs.SeaEvent:AddToggle("FishCrewMem", {
    Title = "Kill Fish Crew Member",
    Default = false 
})

FishCrewMem:OnChanged(function(Value)
    _G.FarmFishCrew = Value
    StopTween(_G.FarmFishCrew)
end)

Ship = Tabs.SeaEvent:AddToggle("Ship", {
    Title = "Kill Ship",
    Default = false 
})

Ship:OnChanged(function(Value)
    _G.FarmFishBoat = Value
    StopTween(_G.FarmFishBoat)
end)

SeaB = Tabs.SeaEvent:AddToggle("SeaB", {
    Title = "Kill Sea Beast",
    Default = false 
})

SeaB:OnChanged(function(Value)
    _G.FarmSeaBeast = Value
    StopTween(_G.FarmSeaBeast)
end)

Tabs.SeaEvent:AddSection("Kitsune Island")

KitIs = Tabs.SeaEvent:AddToggle("KitIs", {
    Title = "Find Kitsune Island",
    Default = false
})

KitIs:OnChanged(function(Value)
    _G.FindKit = Value
    StopTween(_G.FindKit)
end)

StartKitsune = Tabs.SeaEvent:AddToggle("StartKitsune", {
    Title = "Start Kitsune Event",
    Default = false
})

StartKitsune:OnChanged(function(Value)
    _G.Starts = Value
    StopTween(_G.Starts)
end)

AutoAzureEmber = Tabs.SeaEvent:AddToggle("AutoAzureEmber", {
    Title = "Auto Collect Azure Ember",
    Default = false
})

AutoAzureEmber:OnChanged(function(Value)
    _G.AutoAzureEmber = Value
    StopTween(_G.AutoAzureEmber)
end)

AzureTradeDropdown = Tabs.SeaEvent:AddDropdown("AzureTradeDropdown", {
    Title = "Set Azure Ember Trade",
    Values = {"10", "15", "20", "25"},
    Multi = false,
    Default = 1
})

AzureTradeDropdown:SetValue("25")

AzureTradeDropdown:OnChanged(function(Value)
    _G.AzureTradeQuantity = tonumber(Value)
end)

AutoTradeAzure = Tabs.SeaEvent:AddToggle("AutoTradeAzure", {
    Title = "Auto Trade Azure Ember",
    Default = false
})

AutoTradeAzure:OnChanged(function(Value)
    _G.AutoTradeAzure = Value
    StopTween(_G.AutoTradeAzure)
end)

Tabs.SeaEvent:AddSection("Setting Farm")
SkillZ = Tabs.SeaEvent:AddToggle("SkillZ", {
    Title = "Skill Z",
    Default = true
})

SkillZ:OnChanged(function(Value)
    _G.SikiuZ = Value
end)

SkillX = Tabs.SeaEvent:AddToggle("SkillX", {
    Title = "Skill X",
    Default = true
})

SkillX:OnChanged(function(Value)
    _G.SikiuX = Value
end)

SkillC = Tabs.SeaEvent:AddToggle("SkillC", {
    Title = "Skill C",
    Default = true
})

SkillC:OnChanged(function(Value)
    _G.SikiuC = Value
end)

SkillV = Tabs.SeaEvent:AddToggle("SkillV", {
    Title = "Skill V",
    Default = false
})

SkillV:OnChanged(function(Value)
    _G.SikiuV = Value
end)

SkillF = Tabs.SeaEvent:AddToggle("SkillF", {
    Title = "Skill F",
    Default = true
})

SkillF:OnChanged(function(Value)
    _G.SikiuF = Value
end)

function UseSkillsForTool(tool)
    if _G.SikiuZ then
        game:GetService("VirtualInputManager"):SendKeyEvent(true, "Z", false, game)
        task.wait(0.1)
        game:GetService("VirtualInputManager"):SendKeyEvent(false, "Z", false, game)
    end
    if _G.SikiuX then
        game:GetService("VirtualInputManager"):SendKeyEvent(true, "X", false, game)
        task.wait(0.1)
        game:GetService("VirtualInputManager"):SendKeyEvent(false, "X", false, game)
    end
    if _G.SikiuC then
        game:GetService("VirtualInputManager"):SendKeyEvent(true, "C", false, game)
        task.wait(0.1)
        game:GetService("VirtualInputManager"):SendKeyEvent(false, "C", false, game)
    end
    if _G.SikiuV then
        game:GetService("VirtualInputManager"):SendKeyEvent(true, "V", false, game)
        task.wait(0.1)
        game:GetService("VirtualInputManager"):SendKeyEvent(false, "V", false, game)
    end
    if _G.SikiuF then
        game:GetService("VirtualInputManager"):SendKeyEvent(true, "F", false, game)
        task.wait(0.1)
        game:GetService("VirtualInputManager"):SendKeyEvent(false, "F", false, game)
    end
end

spawn(function()
    while task.wait(0.1) do
        if _G.AutoSkillSea then
            pcall(function() 
                if not game.Players.LocalPlayer.Character or not game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then return end 
                for _, toolType in ipairs({"Melee", "Blox Fruit", "Sword", "Gun"}) do
                    local foundTool = nil
                    for _, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                        if v:IsA("Tool") and v.ToolTip == toolType then
                            foundTool = v
                            break
                        end
                    end
                    if foundTool then
                        if not game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool") or game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool") ~= foundTool then
                            game.Players.LocalPlayer.Character.Humanoid:EquipTool(foundTool)
                            task.wait()
                        end
                        UseSkillsForTool(foundTool)
                        task.wait(0.1)
                    end
                end
            end)
        end
    end
end)

------/// Shop
SelectMelee = Tabs.Shop:AddDropdown("SelectMelee", {
    Title = "Select Melee",
    Values = {"Black Leg", "Electro", "Fishman Karate", "Dragon Claw", "Super Human", "Death Step", "Sharkman Karate", "Electric Claw", "Dragon Talon", "God Human", "Sanguine Art"},
    Multi = false
})

SelectMelee:OnChanged(function(Value)
    _G.Select_Melee = Value
    if Value == "Black Leg" then
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyBlackLeg")
    elseif Value == "Electro" then
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectro")
    elseif Value == "Fishman Karate" then
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyFishmanKarate")
    elseif Value == "Dragon Claw" then
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward", "DragonClaw", "1")
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward", "DragonClaw", "2")
    elseif Value == "Super Human" then
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySuperhuman")
    elseif Value == "Death Step" then
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDeathStep")
    elseif Value == "Sharkman Karate" then
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySharkmanKarate", true)
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySharkmanKarate")
    elseif Value == "Electric Claw" then
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectricClaw")
    elseif Value == "Dragon Talon" then
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDragonTalon")
    elseif Value == "God Human" then
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyGodhuman")
    elseif Value == "Sanguine Art" then
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySanguineArt")
    end
end)

SelectSword = Tabs.Shop:AddDropdown("SelectSword", {
    Title = "Select Sword",
    Values = {"Katana", "Iron Mace", "Dual Katana", "Triple Katana", "Pipe", "Dual-Headed Blade", "Bisento", "Soul Cane"},
    Multi = false
})

SelectSword:OnChanged(function(Value)
    _G.Select_Sword = Value
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", Value)
end)

SelectGun = Tabs.Shop:AddDropdown("SelectGun", {
    Title = "Select Gun",
    Values = {"Slingshot", "Musket", "Flintlock", "Dual Flintlock", "Refined Slingshot", "Cannon", "Kabucha", "Bizarre Rifle"},
    Multi = false
})

SelectGun:OnChanged(function(Value)
    _G.Select_Gun = Value
    if Value == "Dual Flintlock" then
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Dual Flintlock")
    elseif Value == "Refined Slingshot" then
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Refined Flintlock")
    elseif Value == "Kabucha" then
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward", "Slingshot", "1")
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward", "Slingshot", "2")
    elseif Value == "Bizarre Rifle" then
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Ectoplasm", "Buy", 1)
    else
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", Value)
    end
end)

SelectAbilities = Tabs.Shop:AddDropdown("SelectAbilities", {
    Title = "Select Abilities",
    Values = {"Geppo", "Buso Haki", "Soru", "Observation Haki"},
    Multi = false
})

SelectAbilities:OnChanged(function(Value)
    _G.SelectAbilities = Value
        if Value == "Geppo" then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyHaki", "Geppo")
        elseif Value == "Buso Haki" then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyHaki", "Buso")
        elseif Value == "Soru" then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyHaki", "Soru")
        elseif Value == "Observation Haki" then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("KenTalk", "Buy")
        end
    end)

AutoRandomBone = Tabs.Shop:AddToggle("AutoRandomBone", {
    Title = "Random Bones",
    Default = false
})

AutoRandomBone:OnChanged(function(value)
    _G.Auto_Random_Bone = value
end)

spawn(function()
    while wait(0.1) do
        if _G.Auto_Random_Bone then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Bones", "Buy", 1, 1)
        end
    end
end)

Tabs.Shop:AddButton({
    Title = "Stats Refund",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward", "Refund", "1")
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward", "Refund", "2")
    end
})

Tabs.Shop:AddButton({
    Title = "Reroll Race",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward", "Reroll", "1")
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward", "Reroll", "2")
    end
})

Tabs.Shop:AddButton({
    Title = "Buy Ghoul",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Ectoplasm", "Change", 4)
    end
})

Tabs.Shop:AddButton({
    Title = "Buy Cyborg",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CyborgTrainer", "Buy")
    end
})

local username = game.Players.LocalPlayer.Name
local folder = "Lion Hub Webhook Setting/" .. username
local webhookFile = folder.."/Webhook.txt"
local timeFile = folder.."/Time.txt"
local settingsFile = folder.."/Settings.txt"

local CollectionService = game:GetService("CollectionService")
local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")

if not isfolder("Lion Hub Webhook Setting") then
    makefolder("Lion Hub Webhook Setting")
end

if not isfolder(folder) then
    makefolder(folder)
end

function saveSettingsweb()
    local settings = {
        checkmoon = checkmoon,
        checkwea = checkwea,
        checkfr = checkfr,
        checkbe = checkbe,
        checkis = checkis,
        StartSendWebhook = _G.StartSendWebhook or false
    }
    writefile(settingsFile, HttpService:JSONEncode(settings))
end

function loadSettingweb()
    if isfile(settingsFile) then
        local success, data = pcall(function()
            return HttpService:JSONDecode(readfile(settingsFile))
        end)
        if success and data then
            checkmoon = data.checkmoon or false
            checkwea = data.checkwea or false
            checkfr = data.checkfr or false
            checkbe = data.checkbe or false
            checkis = data.checkis or false
            _G.StartSendWebhook = data.StartSendWebhook or false
        end
    end
end

loadSettingweb()

Tabs.Webhook:AddInput("Input_Webhook", {
    Title = "Webhook Url",
    Default = "",
    Placeholder = "",
    Numeric = false,
    Finished = false,
    Callback = function(Vu)
        if game.Players.LocalPlayer.Name == username then
            writefile(webhookFile, Vu)
        end
    end
})

Tabs.Webhook:AddInput("time", {
    Title = "Input time to send Webhook",
    Default = "",
    Placeholder = "",
    Numeric = true,
    Finished = false,
    Callback = function(Vu)
        if game.Players.LocalPlayer.Name == username then
            writefile(timeFile, Vu)
        end
    end
})

local webhook = isfile(webhookFile) and readfile(webhookFile) or nil
local sendTime = isfile(timeFile) and tonumber(readfile(timeFile)) or nil

chmp = Tabs.Webhook:AddToggle("chmp", {
    Title = "Check Moon Phase",
    Default = false
})

chmp:OnChanged(function(value)
    checkmoon = value
    saveSettingsweb()
end)

chw = Tabs.Webhook:AddToggle("chw", {
    Title = "Check Weapon",
    Default = false
})

chw:OnChanged(function(value)
    checkwea = value
    saveSettingsweb()
end)

chf = Tabs.Webhook:AddToggle("chf", {
    Title = "Check Fruit",
    Default = false
})

chf:OnChanged(function(value)
    checkfr = value
    saveSettingsweb()
end)

chb = Tabs.Webhook:AddToggle("chb", {
    Title = "Check Berry",
    Default = false
})

chb:OnChanged(function(value)
    checkbe = value
    saveSettingsweb()
end)

chi = Tabs.Webhook:AddToggle("chi", {
    Title = "Check Island",
    Default = false
})

chi:OnChanged(function(value)
    checkis = value
    saveSettingsweb()
end)

StartSendWeb = Tabs.Webhook:AddToggle("StartSendWeb", {
    Title = "Start Send Webhook",
    Default = false
})

StartSendWeb:OnChanged(function(value)
    _G.StartSendWebhook = value
    saveSettingsweb()
end)

function GetMoonPhase()
    local sky = game.Lighting:FindFirstChildWhichIsA("Sky")
    if sky then
        local MoonTextureId = sky.MoonTextureId
        local MoonPhase = {
            ["http://www.roblox.com/asset/?id=9709149431"] = "[🌕🌕🌕] Full Moon 100%",
            ["http://www.roblox.com/asset/?id=9709149052"] = "[🌖🌖🌖] Full Moon 75%",
            ["http://www.roblox.com/asset/?id=9709143733"] = "[🌗🌗🌗] Full Moon 50%",
            ["http://www.roblox.com/asset/?id=9709140401"] = "[🌘🌘🌘] Full Moon 25%",
            ["http://www.roblox.com/asset/?id=9709149680"] = "[🌘] Full Moon 15%"
        }
        return MoonPhase[MoonTextureId] or "Unknown Moon Phase"
    end
    return "Unknown Moon Phase"
end

function GetIsland()
    local islands = {
        ["Mirage Island"] = game.Workspace._WorldOrigin.Locations:FindFirstChild("Mirage Island"),
        ["Prehistoric Island"] = game.Workspace.Map:FindFirstChild("PrehistoricIsland"),
        ["Kitsune Island"] = game.Workspace.Map:FindFirstChild("KitsuneIsland")
    }
    for name, obj in pairs(islands) do
        if obj then return name end
    end
    return "No Special Island Found"
end

function getBerryInfo()
    local BerryBushes = CollectionService:GetTagged("BerryBush")
    local BerryNames = {}
    for _, Bush in ipairs(BerryBushes) do
        for _, BerryValue in pairs(Bush:GetAttributes()) do
            if typeof(BerryValue) == "string" then
                table.insert(BerryNames, BerryValue)
            end
        end
    end
    return BerryNames
end

function sendWebhook()
    if not webhook or webhook == "" then return end
    
    local playerCount = #Players:GetPlayers()
    local hwid = game:GetService("RbxAnalyticsService"):GetClientId()
    local ExecutorUsing = identifyexecutor()
    local jobId = game.JobId
    local placeId = game.PlaceId
    
    local fields = {
        {
            ["name"] = "Execute:",
            ["value"] = "```"..ExecutorUsing.."```",
            ["inline"] = true
        },
        {
            ["name"] = "Hwid:",
            ["value"] = hwid,
            ["inline"] = true
        },
        {
            ["name"] = "Job ID:",
            ["value"] = " " .. jobId,
            ["inline"] = true
        },
        {
            ["name"] = "Script Teleport:",
            ["value"] = "\n" .. 'game:GetService("TeleportService"):TeleportToPlaceInstance('..placeId..', "'..jobId..'", game.Players.LocalPlayer)' .. "\n",
            ["inline"] = true
        }
    }
    
    if checkmoon then
        table.insert(fields, {
            ["name"] = "Moon Phase:",
            ["value"] = "```"..GetMoonPhase().."```",
            ["inline"] = true
        })
    end
    
    if checkwea then
        local inventory = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("getInventoryWeapons")
        local weaponList = ""
        for _, weapon in pairs(inventory) do
            weaponList = weaponList .. weapon.Name .. (weapon.Rarity and " (" .. weapon.Rarity .. ")\n" or "\n")
        end
        if weaponList ~= "" then
            table.insert(fields, {
                ["name"] = "Weapons:",
                ["value"] = "```"..weaponList.."```",
                ["inline"] = false
            })
        end
    end
    
    if checkfr then
    local fruits = {}
    local lp = game.Players.LocalPlayer

    for _, v in pairs(lp.Backpack:GetChildren()) do
        if string.find(v.Name, "Fruit") then
            table.insert(fruits, v.Name)
        end
    end

    for _, v in pairs(lp.Character:GetChildren()) do
        if string.find(v.Name, "Fruit") then
            table.insert(fruits, v.Name)
        end
    end

    if #fruits > 0 then
        table.insert(fields, {
            ["name"] = "Fruits:",
            ["value"] = "```"..table.concat(fruits, "\n").."```",
            ["inline"] = false
        })
    end
    end

    
    if checkbe then
        local berries = getBerryInfo()
        if #berries > 0 then
            table.insert(fields, {
                ["name"] = "Berries:",
                ["value"] = "```"..table.concat(berries, "\n").."```",
                ["inline"] = false
            })
        end
    end
    
    if checkis then
        local island = GetIsland()
        table.insert(fields, {
            ["name"] = "Special Island:",
            ["value"] = "```"..island.."```",
            ["inline"] = true
        })
    end
    
    table.insert(fields, {
        ["name"] = "Ty For Use:",
        ["value"] = "**__Lion Hub__**",
        ["inline"] = true
    })
    
    local Data = {
        ["embeds"] = {
            {
                ["title"] = "Thông Tin | Account",
                ["url"] = "https://www.roblox.com/users/"..game.Players.LocalPlayer.UserId,
                ["description"] = "```"..game.Players.LocalPlayer.DisplayName.." ```",
                ["color"] = tonumber("0xf7c74b"),
                ["thumbnail"] = {["url"] = "https://www.roblox.com/asset-thumbnail/image?assetId=123709024751036&width=420&height=420&format=png"},
                ["fields"] = fields
            }
        }
    }
    
    local Headers = {["Content-Type"] = "application/json"}
    local Encoded = HttpService:JSONEncode(Data)
    local Request = http_request or request or HttpPost or syn.request
    local Final = {Url = webhook, Body = Encoded, Method = "POST", Headers = Headers}
    Request(Final)
end

spawn(function()
    pcall(function()
        while task.wait(sendTime or 60) do
            if _G.StartSendWebhook then
                sendWebhook()
            end
        end
    end)
end)

------/// Misc
Tabs.Misc:AddSection("Team")
Tabs.Misc:AddButton({
    Title = "Pirates",
    Description = "",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetTeam", "Pirates")
    end
})

Tabs.Misc:AddButton({
    Title = "Marines",
    Description = "",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetTeam", "Marines")
    end
})

Tabs.Misc:AddSection("Job-id")

Tabs.Misc:AddInput("enjob", {
    Title = "Enter Job-id",
    Default = "",
    Placeholder = "",
    Numeric = false,
    Finished = false,
    Callback = function(Vu)
        _G.SetJobid = value
        game:GetService("TeleportService"):TeleportToPlaceInstance(game.placeId, _G.SetJobid, game.Players.LocalPlayer)
    end
})

Tabs.Misc:AddButton({
    Title = "Copy Job Id",
    Description = "",
    Callback = function()
        setclipboard(tostring(game.JobId))
    end
})

Tabs.Misc:AddButton({
    Title = "Rejoin",
    Description = "",
    Callback = function()
        game:GetService("TeleportService"):Teleport(game.PlaceId, game.Players.LocalPlayer)
    end
})

Tabs.Misc:AddButton({
    Title = "Hop Server",
    Description = "",
    Callback = function()
       Hophi()
    end
})

Tabs.Misc:AddButton({
    Title = "Hop Server Low Player",
    Description = "",
    Callback = function()
        Hop()
    end
})

Tabs.Misc:AddSection("Screen Color")
Black = Tabs.Misc:AddToggle("Black", {
    Title = "Black Screen",
    Default = false 
})

Black:OnChanged(function(Value)
    _G.BlackSc = Value
    if Value then
    SetUi("black", "on", "None")
    elseif not Value then
    SetUi("off")
    end
end)

White = Tabs.Misc:AddToggle("White", {
    Title = "White Screen",
    Default = false 
})

White:OnChanged(function(Value)
    _G.WhiteSc = Value
    if Value then
    SetUi("white", "on", "None")
    elseif not Value then
    SetUi("off")
    end
end)

Blur = Tabs.Misc:AddToggle("Blur", {
    Title = "Blur Screen",
    Default = false 
})

Blur:OnChanged(function(Value)
    _G.BlurSc = Value
    if Value then
    SetUi("blur", "on", "None")
    elseif not Value then
    SetUi("off")
    end
end)

SaveManager:LoadAutoloadConfig()

SetUi("blur", "on", "Script Loaded")
wait(1.5)
SetUi("off")
