local Mode = getgenv().Mode
local UsernameList = getgenv().UsernameList
local Player = game:GetService("Players").LocalPlayer
Player.PlayerScripts:ClearAllChildren()
loadstring(game:HttpGet("https://raw.githubusercontent.com/s3rvxnt/Washiez/refs/heads/main/Utils"))()
local LimbOffsets = {
    Head = CFrame.Angles(math.rad(-90), 0, math.rad(180)) * CFrame.new(0, -4.5, -7),
    TorsoLeft = CFrame.Angles(math.rad(-90), 0, 0) * CFrame.new(-5, -3, -3),
    TorsoRight = CFrame.Angles(math.rad(-90), 0, 0) * CFrame.new(5, -3, -3),
    RightArm = CFrame.Angles(math.rad(-90), 0, 0) * CFrame.new(0, -3, -3),
    LeftArm = CFrame.Angles(math.rad(-90), 0, 0) * CFrame.new(0, -3, -3),
    RightLeg = CFrame.Angles(math.rad(-90), 0, 0) * CFrame.new(0, -3, -1.5),
    LeftLeg = CFrame.Angles(math.rad(-90), 0, 0) * CFrame.new(0, -3, -1.5)
}
local _, dimensions =
    game:GetService("ReplicatedStorage"):WaitForChild("CarSpawnSystem"):WaitForChild("CarModels"):WaitForChild("Van"):GetBoundingBox(

)
local volumethreshold = dimensions.X * dimensions.Y * dimensions.Z
local function GetVan()
    if getgenv().Titan ~= nil then
        Player.Character = game:GetService("Workspace"):WaitForChild(Player.Name,math.huge)
    end
    local OriginalVehicle = getgenv().WashiezGetVehicle()
    local Character = Player.Character or Player.CharacterAdded:Wait()
    Character:WaitForChild("Humanoid").Sit = false
    task.wait(Player:GetNetworkPing())
    for _, v in Character:GetChildren() do
        pcall(
            function()
                v.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
                v.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
            end
        )
    end
    Character:PivotTo(CFrame.new(0, 1000000, 0))
    getsenv(game:GetService("Players").LocalPlayer.PlayerGui.CarSelection.Manager).closeMenu()
    repeat
        task.wait()
    until game:GetService("Players").LocalPlayer.PlayerGui.CarSelection.MainFrame.Position ==
        UDim2.new(1.20000005, 30, 0.5, 0)
    getgenv().WashiezRequestVehicleSpawn()
    local stop = false
    repeat
        task.wait()
        getgenv().WashiezSpawnVehicle("Van")
        for _, v in Character:GetChildren() do
            pcall(
                function()
                    v.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
                    v.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
                end
            )
        end
        stop = false
        task.delay(Player:GetNetworkPing()+3,function() stop = true end)
        repeat task.wait() until getgenv().WashiezGetVehicle() ~= nil and getgenv().WashiezGetVehicle() ~= OriginalVehicle or stop == true
    until getgenv().WashiezGetVehicle() ~= nil and getgenv().WashiezGetVehicle() ~= OriginalVehicle
    for _, v in Character:GetChildren() do
        pcall(
            function()
                v.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
                v.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
            end
        )
    end
    getgenv().WashiezGetVehicle():WaitForChild("Chassis"):WaitForChild("VehicleSeat"):Sit(
        game:GetService("Players").LocalPlayer.Character.Humanoid
    )
    if getgenv().Titan ~= nil then
        Player.Character = getgenv().Titan
    end
    return getgenv().WashiezGetVehicle()
end
local Vehicle = getgenv().WashiezGetVehicle()
if Vehicle == nil then
    Vehicle = GetVan()
end
game:GetService("Workspace").DescendantAdded:Connect(
    function(obj)
        pcall(
            function()
                obj.CanCollide = false
                obj.CollisionGroup = "Default"
            end
        )
    end
)

task.spawn(
    function()
        if not game:GetService("Workspace"):FindFirstChild("CarTitan") then
            repeat
                for _, child in game:GetService("Workspace"):GetChildren() do
                    pcall(
                        function()
                            if game:GetService("Players"):FindFirstChild(child.Name) then
                                --do nothing
                            elseif
                                child.Name ~= "SpawnedCars" and child ~= game:GetService("Workspace").CurrentCamera and
                                    child.Name ~= "Nametags"
                             then
                                child:Destroy()
                            end
                        end
                    )
                end
                task.wait(30)
            until false
        else
            repeat
                for _, d in game:GetService("Workspace").SpawnedCars:GetDescendants() do
                    pcall(
                        function()
                            d.CanCollide = false
                            d.CollisionGroup = "Default"
                        end
                    )
                end
                task.wait(5)
            until false
        end
    end
)

repeat
    task.wait()
    pcall(
        function()
            local _, dimensions = Vehicle:GetBoundingBox()
            local currentvolume = dimensions.X * dimensions.Y * dimensions.Z
            if currentvolume > volumethreshold * 4.8 or Vehicle.Parent == nil then
                Vehicle = GetVan()
            end
            getgenv().WashiezGetVehicle():WaitForChild("Chassis"):WaitForChild("VehicleSeat"):Sit(
                game:GetService("Players").LocalPlayer.Character.Humanoid
            )
            local data = readfile("Titan.lua")
            local data = game:GetService("HttpService"):JSONDecode(data)
            local temp = Mode
            if string.find(Mode, "Torso") then
                temp = "Torso"
            end
            Vehicle:PivotTo(CFrame.new(unpack(data[temp])) * LimbOffsets[Mode])
            Vehicle.PrimaryPart.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
            Vehicle.PrimaryPart.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
            local highestVelocity = 0
            local Highest = nil
            for _, d in game:GetService("Workspace").SpawnedCars:GetChildren() do
                local IsFriendly = false
                for index, name in getgenv().UsernameList do
                    if string.find(d.Name, name) then
                        IsFriendly = true
                    end
                end
                if not IsFriendly then
                    if not table.find(getgenv().UsernameList, d.Name) then
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
            for _, d in game:GetService("Players"):GetPlayers() do
                if not table.find(getgenv().UsernameList, d.Name) then
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
            local FinalVelocity = math.clamp(highestVelocity, 0, 1500)
            Vehicle.PrimaryPart.AssemblyLinearVelocity = Vector3.new(0, (FinalVelocity * -1) - 200, 0)
        end
    )
until false
