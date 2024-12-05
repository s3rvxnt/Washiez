local Mode = getgenv().Mode
local Player = game:GetService("Players").LocalPlayer

local LimbOffsets = {
    Head = CFrame.Angles(-1.6,0,3.1) * CFrame.new(0,-3,-7),
    TorsoLeft = CFrame.Angles(-1.6,0,0) * CFrame.new(-5,-3,-3),
    TorsoRight = CFrame.Angles(-1.6,0,0) * CFrame.new(5,-3,-3),
    RightArm = CFrame.Angles(-1.6,0,0) * CFrame.new(0,-3,-3),
    LeftArm = CFrame.Angles(-1.6,0,0) * CFrame.new(0,-3,-3),
    RightLeg = CFrame.Angles(-1.6,0,0) * CFrame.new(0,-3,-1.5),
    LeftLeg = CFrame.Angles(-1.6,0,0) * CFrame.new(0,-3,-1.5)
}

local function GetVehicle()
    for _,Vehicle in game:GetService("Workspace").SpawnedCars:GetChildren() do 
        if string.find(Vehicle.Name, Player.Name) then 
            return Vehicle
        end
    end
    
    return nil
end
local Vehicle = GetVehicle()

game:GetService("Workspace").DescendantAdded:Connect(function(obj)
    pcall(function()
            obj.CanCollide = false
            obj.CollisionGroup = "Default"
    end)
end)

task.spawn(function()
    if not game:GetService("Workspace"):FindFirstChild("CarTitan") then
    repeat
    for _,d in game:GetService("Workspace"):GetDescendants() do
        pcall(function()
            d.CanCollide = false
            d.CollisionGroup = "Default"
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

game:GetService("RunService").Heartbeat:Connect(function()
pcall(function()
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
end)
end)
