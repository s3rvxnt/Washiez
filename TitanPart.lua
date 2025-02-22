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

local Vehicle = getgenv().WashiezGetVehicle()
if Vehicle == nil then
    repeat
        Player.PlayerGui.CarSelection.MainFrame.Visible = false
        local SCRIPT = Player.PlayerGui.CarSelection.Manager
        local environment = getsenv(SCRIPT)
        environment.closeMenu()
        task.wait(1)
        Player.Character.Humanoid.Sit = false
        getgenv().WashiezRequestVehicleSpawn()
        getgenv().WashiezSpawnVehicle("Van")
        local stop = false
        task.delay(Player:GetNetworkPing() + 2, function() stop = true end)
        repeat task.wait()
            Vehicle = getgenv().WashiezGetVehicle()
        until Vehicle ~= nil or stop == true
        if Vehicle ~= nil then
            Vehicle:WaitForChild("Chassis"):WaitForChild("VehicleSeat"):Sit(Player.Character.Humanoid)
        end
    until Vehicle ~= nil
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
local VelocityChecks = {}
repeat task.wait() until getgenv().UsernameList ~= nil
print("debug")
task.spawn(function()
    repeat
    VelocityChecks = {}
    for _,d in game:GetService("Workspace"):GetDescendants() do
        if d:IsA("BasePart") and table.find(getgenv().UsernameList,d.Parent.Name) == false then
            local IsFriendly = false
            if d:IsDescendantOf(game:GetService("Workspace").SpawnedCars) then
                for i,v in game:GetService("Workspace").SpawnedCars:GetChildren() do
                    if d:IsDescendantOf(v) then
                        for a,b in getgenv().UsernameList do
                            if string.find(v,b) then
                                IsFriendly = true
                            end
                        end
                    end
                end
                if not IsFriendly then
                    print("adding: "..d:GetFullName())
                    table.insert(VelocityChecks,d)
                end
            elseif d.Anchored == false then
                print("adding: "..d:GetFullName())
                table.insert(VelocityChecks,d)
            end
        end
    end
    task.wait(10)
    until false
end)
game:GetService("RunService").Heartbeat:Connect(function()
--pcall(function()
local data = readfile("Titan.lua")
local data = game:GetService("HttpService"):JSONDecode(data)
for _,d in Vehicle:GetDescendants() do 
    pcall(function()
        d.AssemblyAngularVelocity = Vector3.new(0,0,0)
        d.AssemblyLinearVelocity = Vector3.new(0,0,0)
    end)
end
local temp = Mode 
if string.find(Mode,"Torso") then 
temp = "Torso"
end
Vehicle:PivotTo(CFrame.new(unpack(data[temp]))*LimbOffsets[Mode])
for _,d in Vehicle:GetDescendants() do 
    pcall(function()
        d.AssemblyAngularVelocity = Vector3.new(0,0,0)
        d.AssemblyLinearVelocity = Vector3.new(0,0,0)
    end)
end
local highestVelocity = 0
local Highest = nil
for _,d in VelocityChecks do
    if d.AssemblyLinearVelocity.Magnitude > highestVelocity then
        print(d.AssemblyLinearVelocity)
        highestVelocity = d.AssemblyLinearVelocity.Magnitude
        Highest = d
    end
    if d.AssemblyAngularVelocity.Magnitude > highestVelocity then 
        print(d.AssemblyAngularVelocity)
        highestVelocity = d.AssemblyAngularVelocity.Magnitude
        Highest = d
    end
end
pcall(function() print(Highest:GetFullName()) end)
--print(Vector3.new(0,(math.abs(highestVelocity)*-1)-50,0))
local FinalVelocity = math.clamp(math.abs(highestVelocity),10,200)
Vehicle.PrimaryPart.AssemblyLinearVelocity = Vector3.new(0,(FinalVelocity*-1)-50,0)
--end)
end)
