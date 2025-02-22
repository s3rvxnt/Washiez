local Mode = getgenv().Mode
local UsernameList = getgenv().UsernameList
local Player = game:GetService("Players").LocalPlayer
Player.PlayerScripts:ClearAllChildren()
loadstring(game:HttpGet("https://raw.githubusercontent.com/s3rvxnt/Washiez/refs/heads/main/Utils"))()
local LimbOffsets = {
    Head = CFrame.Angles(math.rad(-90),0,math.rad(180)) * CFrame.new(0,-4.5,-7),
    TorsoLeft = CFrame.Angles(math.rad(-90),0,0) * CFrame.new(-5,-3,-3),
    TorsoRight = CFrame.Angles(math.rad(-90),0,0) * CFrame.new(5,-3,-3),
    RightArm = CFrame.Angles(math.rad(-90),0,0) * CFrame.new(0,-3,-3),
    LeftArm = CFrame.Angles(math.rad(-90),0,0) * CFrame.new(0,-3,-3),
    RightLeg = CFrame.Angles(math.rad(-90),0,0) * CFrame.new(0,-3,-1.5),
    LeftLeg = CFrame.Angles(math.rad(-90),0,0) * CFrame.new(0,-3,-1.5)
}
local _, dimensions =
    game:GetService("ReplicatedStorage"):WaitForChild("CarSpawnSystem"):WaitForChild("CarModels"):WaitForChild("Van"):GetBoundingBox(

)
local volumethreshold = dimensions.X * dimensions.Y * dimensions.Z
local function GetVan()
    local OriginalVehicle = getgenv().WashiezGetVehicle()
    local Vehiclea = OriginalVehicle
    repeat
        task.wait()
        pcall(function()
        local SCRIPT = game:GetService("Players").LocalPlayer.PlayerGui.CarSelection.Manager
        local environment = getsenv(SCRIPT)
        environment.closeMenu()
        task.wait(1)
        game:GetService("Players").LocalPlayer.Character.Humanoid.Sit = false
        task.wait(game:GetService("Players").LocalPlayer:GetNetworkPing())
        game:GetService("Players").LocalPlayer.Character:PivotTo(CFrame.new(0,100000,0))
        task.wait(2)
        getgenv().WashiezRequestVehicleSpawn()
        game:GetService("Players").LocalPlayer.Character:PivotTo(CFrame.new(0,100000,0))
        getgenv().WashiezSpawnVehicle("Van")
        local stop = false
        task.delay(
        game:GetService("Players").LocalPlayer:GetNetworkPing() + 2,
        function()
            stop = true
        end
        )
        repeat
            task.wait()
            Vehiclea = getgenv().WashiezGetVehicle()
        until Vehiclea ~= OriginalVehicle and Vehiclea ~= nil or stop == true
        if Vehiclea ~= OriginalVehicle and Vehiclea ~= nil then
            Vehiclea:WaitForChild("Chassis"):WaitForChild("VehicleSeat"):Sit(game:GetService("Players").LocalPlayer.Character.Humanoid)
            repeat task.wait() until game:GetService("Players").LocalPlayer.PlayerGui.CarSelection.MainFrame.Position == UDim2.new(1, -5, 0.5, 0)
            environment.closeMenu()
        end
            end)
    until Vehiclea ~= OriginalVehicle and Vehiclea ~= nil
    return Vehiclea
end
_G.Vehicle = getgenv().WashiezGetVehicle()
if Vehicle == nil then
    _G.Vehicle = GetVan()
end

game:GetService("Workspace").DescendantAdded:Connect(function(obj)
    pcall(function()
            obj.CanCollide = false
            obj.CollisionGroup = "Default"
    end)
end)

task.spawn(function()
    if not game:GetService("Workspace"):FindFirstChild("CarTitan") then
    repeat
    for _,child in game:GetService("Workspace"):GetChildren() do
    pcall(function()
    if game:GetService("Players"):FindFirstChild(child.Name) then
  --do nothing
    elseif child.Name ~= "SpawnedCars" and child ~= game:GetService("Workspace").CurrentCamera and child.Name ~= "Nametags" then
        child:Destroy()
    end
    end)
end
    task.wait(30)
    until false
    else
    repeat
        for _,d in game:GetService("Workspace").SpawnedCars:GetDescendants() do
            pcall(function()
                d.CanCollide = false
                d.CollisionGroup = "Default"
            end)
        end
        task.wait(5)
    until false
    end
end)
repeat task.wait()
--pcall(function()
local _, dimensions = Vehicle:GetBoundingBox()
local currentvolume = dimensions.X * dimensions.Y * dimensions.Z
if currentvolume > volumethreshold * 4.8 or Vehicle.Parent == nil then
    _G.Vehicle = GetVan()
end
local data = readfile("Titan.lua")
local data = game:GetService("HttpService"):JSONDecode(data)
local temp = Mode 
if string.find(Mode,"Torso") then 
temp = "Torso"
end
_G.Vehicle:PivotTo(CFrame.new(unpack(data[temp]))*LimbOffsets[Mode])
_G.Vehicle.PrimaryPart.AssemblyAngularVelocity = Vector3.new(0,0,0)
_G.Vehicle.PrimaryPart.AssemblyLinearVelocity = Vector3.new(0,0,0)
local highestVelocity = 0
local Highest = nil
for _,d in game:GetService("Workspace").SpawnedCars:GetChildren() do
    local IsFriendly = false
    for index,name in getgenv().UsernameList do
        if string.find(d.Name,name) then
            IsFriendly = true
        end
    end
    if not IsFriendly then
        if not table.find(getgenv().UsernameList,d.Name) then
            if d.PrimaryPart.AssemblyLinearVelocity.Magnitude > highestVelocity then
                highestVelocity = d.PrimaryPart.AssemblyLinearVelocity.Magnitude
                Highest = d
            end
            if d.PrimaryPart.AssemblyAngularVelocity.Magnitude > highestVelocity then 
                highestVelocity = d.PrimaryPart.AssemblyAngularVelocity.Magnitude
                Highest = d
            end
        end
    end
end
for _,d in game:GetService("Players"):GetPlayers() do
    if not table.find(getgenv().UsernameList,d.Name) then
        if d.Character then
            if d.Character.PrimaryPart.AssemblyLinearVelocity.Magnitude > highestVelocity then
                highestVelocity = d.Character.PrimaryPart.AssemblyLinearVelocity.Magnitude
                Highest = d
            end
            if d.Character.PrimaryPart.AssemblyAngularVelocity.Magnitude > highestVelocity then 
                highestVelocity = d.Character.PrimaryPart.AssemblyAngularVelocity.Magnitude
                Highest = d
            end
        end
    end
end
pcall(function() print(Highest:GetFullName()) end)
pcall(function() print(highestVelocity) end)
--print(Vector3.new(0,(math.abs(highestVelocity)*-1)-50,0))
local FinalVelocity = math.clamp(highestVelocity,50,1500)
_G.Vehicle.PrimaryPart.AssemblyLinearVelocity = Vector3.new(0,(FinalVelocity*-1)-200,0)
                --end)
until false
