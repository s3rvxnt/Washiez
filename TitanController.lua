loadstring(game:HttpGet("https://raw.githubusercontent.com/s3rvxnt/Washiez/refs/heads/main/Utils"))()
local Vehicle = getgenv().WashiezGetVehicle()
if Vehicle == nil then
    repeat
        game.Players.LocalPlayer.PlayerGui.CarSelection.MainFrame.Visible = false
        local SCRIPT = game.Players.LocalPlayer.PlayerGui.CarSelection.Manager
        local environment = getsenv(SCRIPT)
        environment.closeMenu()
        task.wait(1)
        game.Players.LocalPlayer.Character.Humanoid.Sit = false
        getgenv().WashiezRequestVehicleSpawn()
        getgenv().WashiezSpawnVehicle("Van")
        local stop = false
        task.delay(game.Players.LocalPlayer:GetNetworkPing() + 2, function() stop = true end)
        repeat task.wait()
            Vehicle = getgenv().WashiezGetVehicle()
        until Vehicle ~= nil or stop == true
        if Vehicle ~= nil then
            Vehicle:WaitForChild("Chassis"):WaitForChild("VehicleSeat"):Sit(game.Players.LocalPlayer.Character.Humanoid)
        end
    until Vehicle ~= nil
end
pcall(function() game:GetService("ContextActionService"):UnbindAction("VehicleChassisRawInput") end)
--[[
	
	Gui2Lua Winning! ~ Ch0nky Code:tm:
	
	69 instances
	
	-> shared.gv2.require("main").printChangelogs()
	
]]--

local tbl =
{
	Rig = Instance.new("Model"),
	Head = Instance.new("Part"),
	Mesh = Instance.new("SpecialMesh"),
	face = Instance.new("Decal"),
	HairAttachment = Instance.new("Attachment"),
	HatAttachment = Instance.new("Attachment"),
	FaceFrontAttachment = Instance.new("Attachment"),
	FaceCenterAttachment = Instance.new("Attachment"),
	Torso = Instance.new("Part"),
	roblox = Instance.new("Decal"),
	NeckAttachment = Instance.new("Attachment"),
	BodyFrontAttachment = Instance.new("Attachment"),
	BodyBackAttachment = Instance.new("Attachment"),
	LeftCollarAttachment = Instance.new("Attachment"),
	RightCollarAttachment = Instance.new("Attachment"),
	WaistFrontAttachment = Instance.new("Attachment"),
	WaistCenterAttachment = Instance.new("Attachment"),
	WaistBackAttachment = Instance.new("Attachment"),
	Right_Shoulder = Instance.new("Motor6D"),
	Left_Shoulder = Instance.new("Motor6D"),
	Right_Hip = Instance.new("Motor6D"),
	Left_Hip = Instance.new("Motor6D"),
	Neck = Instance.new("Motor6D"),
	Left_Arm = Instance.new("Part"),
	LeftShoulderAttachment = Instance.new("Attachment"),
	LeftGripAttachment = Instance.new("Attachment"),
	Right_Arm = Instance.new("Part"),
	RightShoulderAttachment = Instance.new("Attachment"),
	RightGripAttachment = Instance.new("Attachment"),
	Left_Leg = Instance.new("Part"),
	LeftFootAttachment = Instance.new("Attachment"),
	Right_Leg = Instance.new("Part"),
	RightFootAttachment = Instance.new("Attachment"),
	Humanoid = Instance.new("Humanoid"),
	Animator = Instance.new("Animator"),
	HumanoidDescription = Instance.new("HumanoidDescription"),
	BodyPartDescription = Instance.new("BodyPartDescription"),
	BodyPartDescription_1 = Instance.new("BodyPartDescription"),
	BodyPartDescription_2 = Instance.new("BodyPartDescription"),
	BodyPartDescription_3 = Instance.new("BodyPartDescription"),
	BodyPartDescription_4 = Instance.new("BodyPartDescription"),
	BodyPartDescription_5 = Instance.new("BodyPartDescription"),
	HumanoidRootPart = Instance.new("Part"),
	RootAttachment = Instance.new("Attachment"),
	RootJoint = Instance.new("Motor6D"),
	Animate = Instance.new("LocalScript"),
	idle = Instance.new("StringValue"),
	Animation1 = Instance.new("Animation"),
	Weight = Instance.new("NumberValue"),
	Animation2 = Instance.new("Animation"),
	Weight_1 = Instance.new("NumberValue"),
	walk = Instance.new("StringValue"),
	WalkAnim = Instance.new("Animation"),
	run = Instance.new("StringValue"),
	RunAnim = Instance.new("Animation"),
	jump = Instance.new("StringValue"),
	JumpAnim = Instance.new("Animation"),
	climb = Instance.new("StringValue"),
	ClimbAnim = Instance.new("Animation"),
	toolnone = Instance.new("StringValue"),
	ToolNoneAnim = Instance.new("Animation"),
	fall = Instance.new("StringValue"),
	FallAnim = Instance.new("Animation"),
	sit = Instance.new("StringValue"),
	SitAnim = Instance.new("Animation"),
	PlayEmote = Instance.new("BindableFunction"),
	ScaleDampeningPercent = Instance.new("NumberValue"),
	Body_Colors = Instance.new("BodyColors")
}

tbl.Rig.Name = "CarTitan"
tbl.Rig.PrimaryPart = tbl.Torso
tbl.Rig.WorldPivot = CFrame.new(0.0139389, -4.23193e-06, 1.30777, 1, 0, 0, 0, 1, 0, 0, 0, 1)
tbl.Rig.Parent = game:GetService("Workspace")

tbl.Head.CFrame = CFrame.new(0.0139389, 44.4229, 1.30777, 1, 0, 0, 0, 1, 0, 0, 0, 1)
tbl.Head.Transparency = 0.65
tbl.Head.Color = Color3.fromRGB(127, 127, 127)
tbl.Head.TopSurface = Enum.SurfaceType.Smooth
tbl.Head.Size = Vector3.new(19.7435, 9.87176, 9.87176)
tbl.Head.BrickColor = BrickColor.new("Sand green")
tbl.Head.Name = "Head"
tbl.Head.PivotOffset = CFrame.new(0, -44.4229, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)
tbl.Head.Parent = tbl.Rig
tbl.Head.CanCollide = false

tbl.Mesh.Scale = Vector3.new(1.25, 1.25, 1.25)
tbl.Mesh.Parent = tbl.Head

tbl.face.Name = "face"
tbl.face.Texture = "rbxasset://textures/face.png"
tbl.face.Parent = tbl.Head

tbl.HairAttachment.CFrame = CFrame.new(0, 5.92306, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)
tbl.HairAttachment.WorldCFrame = CFrame.new(0.0139389, 50.346, 1.30777, 1, 0, 0, 0, 1, 0, 0, 0, 1)
tbl.HairAttachment.Name = "HairAttachment"
tbl.HairAttachment.Parent = tbl.Head

tbl.HatAttachment.CFrame = CFrame.new(0, 5.92306, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)
tbl.HatAttachment.WorldCFrame = CFrame.new(0.0139389, 50.346, 1.30777, 1, 0, 0, 0, 1, 0, 0, 0, 1)
tbl.HatAttachment.Name = "HatAttachment"
tbl.HatAttachment.Parent = tbl.Head

tbl.FaceFrontAttachment.CFrame = CFrame.new(0, 0, -5.92306, 1, 0, 0, 0, 1, 0, 0, 0, 1)
tbl.FaceFrontAttachment.WorldCFrame = CFrame.new(0.0139389, 44.4229, -4.61529, 1, 0, 0, 0, 1, 0, 0, 0, 1)
tbl.FaceFrontAttachment.Name = "FaceFrontAttachment"
tbl.FaceFrontAttachment.Parent = tbl.Head

tbl.FaceCenterAttachment.WorldCFrame = CFrame.new(0.0139389, 44.4229, 1.30777, 1, 0, 0, 0, 1, 0, 0, 0, 1)
tbl.FaceCenterAttachment.Name = "FaceCenterAttachment"
tbl.FaceCenterAttachment.Parent = tbl.Head

tbl.Torso.CFrame = CFrame.new(0.0139389, 29.6153, 1.30777, 1, 0, 0, 0, 1, 0, 0, 0, 1)
tbl.Torso.RightSurface = Enum.SurfaceType.Weld
tbl.Torso.Transparency = 0.65
tbl.Torso.Color = Color3.fromRGB(127, 127, 127)
tbl.Torso.Size = Vector3.new(19.7435, 19.7435, 9.87176)
tbl.Torso.LeftSurface = Enum.SurfaceType.Weld
tbl.Torso.BrickColor = BrickColor.new("Sand green")
tbl.Torso.Name = "Torso"
tbl.Torso.Parent = tbl.Rig
tbl.Torso.CanCollide = false

tbl.roblox.Name = "roblox"
tbl.roblox.Parent = tbl.Torso

tbl.NeckAttachment.CFrame = CFrame.new(0, 9.87176, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)
tbl.NeckAttachment.WorldCFrame = CFrame.new(0.0139389, 39.487, 1.30777, 1, 0, 0, 0, 1, 0, 0, 0, 1)
tbl.NeckAttachment.Name = "NeckAttachment"
tbl.NeckAttachment.Parent = tbl.Torso

tbl.BodyFrontAttachment.CFrame = CFrame.new(0, 0, -4.93588, 1, 0, 0, 0, 1, 0, 0, 0, 1)
tbl.BodyFrontAttachment.WorldCFrame = CFrame.new(0.0139389, 29.6153, -3.62811, 1, 0, 0, 0, 1, 0, 0, 0, 1)
tbl.BodyFrontAttachment.Name = "BodyFrontAttachment"
tbl.BodyFrontAttachment.Parent = tbl.Torso

tbl.BodyBackAttachment.CFrame = CFrame.new(0, 0, 4.93588, 1, 0, 0, 0, 1, 0, 0, 0, 1)
tbl.BodyBackAttachment.WorldCFrame = CFrame.new(0.0139389, 29.6153, 6.24365, 1, 0, 0, 0, 1, 0, 0, 0, 1)
tbl.BodyBackAttachment.Name = "BodyBackAttachment"
tbl.BodyBackAttachment.Parent = tbl.Torso

tbl.LeftCollarAttachment.CFrame = CFrame.new(-9.87176, 9.87176, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)
tbl.LeftCollarAttachment.WorldCFrame = CFrame.new(-9.85782, 39.487, 1.30777, 1, 0, 0, 0, 1, 0, 0, 0, 1)
tbl.LeftCollarAttachment.Name = "LeftCollarAttachment"
tbl.LeftCollarAttachment.Parent = tbl.Torso

tbl.RightCollarAttachment.CFrame = CFrame.new(9.87176, 9.87176, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)
tbl.RightCollarAttachment.WorldCFrame = CFrame.new(9.8857, 39.487, 1.30777, 1, 0, 0, 0, 1, 0, 0, 0, 1)
tbl.RightCollarAttachment.Name = "RightCollarAttachment"
tbl.RightCollarAttachment.Parent = tbl.Torso

tbl.WaistFrontAttachment.CFrame = CFrame.new(0, -9.87176, -4.93588, 1, 0, 0, 0, 1, 0, 0, 0, 1)
tbl.WaistFrontAttachment.WorldCFrame = CFrame.new(0.0139389, 19.7435, -3.62811, 1, 0, 0, 0, 1, 0, 0, 0, 1)
tbl.WaistFrontAttachment.Name = "WaistFrontAttachment"
tbl.WaistFrontAttachment.Parent = tbl.Torso

tbl.WaistCenterAttachment.CFrame = CFrame.new(0, -9.87176, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)
tbl.WaistCenterAttachment.WorldCFrame = CFrame.new(0.0139389, 19.7435, 1.30777, 1, 0, 0, 0, 1, 0, 0, 0, 1)
tbl.WaistCenterAttachment.Name = "WaistCenterAttachment"
tbl.WaistCenterAttachment.Parent = tbl.Torso

tbl.WaistBackAttachment.CFrame = CFrame.new(0, -9.87176, 4.93588, 1, 0, 0, 0, 1, 0, 0, 0, 1)
tbl.WaistBackAttachment.WorldCFrame = CFrame.new(0.0139389, 19.7435, 6.24365, 1, 0, 0, 0, 1, 0, 0, 0, 1)
tbl.WaistBackAttachment.Name = "WaistBackAttachment"
tbl.WaistBackAttachment.Parent = tbl.Torso

tbl.Right_Shoulder.Part1 = tbl.Right_Arm
tbl.Right_Shoulder.Name = "Right Shoulder"
tbl.Right_Shoulder.MaxVelocity = 0.1
tbl.Right_Shoulder.C1 = CFrame.new(-4.93588, 4.93588, 0, 0, 0, 1, 0, 1, 0, -1, -0, -0)
tbl.Right_Shoulder.C0 = CFrame.new(9.87176, 4.93588, 0, 0, 0, 1, 0, 1, 0, -1, -0, -0)
tbl.Right_Shoulder.Part0 = tbl.Torso
tbl.Right_Shoulder.Parent = tbl.Torso

tbl.Left_Shoulder.Part1 = tbl.Left_Arm
tbl.Left_Shoulder.Name = "Left Shoulder"
tbl.Left_Shoulder.MaxVelocity = 0.1
tbl.Left_Shoulder.C1 = CFrame.new(4.93588, 4.93588, 0, -0, -0, -1, 0, 1, 0, 1, 0, 0)
tbl.Left_Shoulder.C0 = CFrame.new(-9.87176, 4.93588, 0, -0, -0, -1, 0, 1, 0, 1, 0, 0)
tbl.Left_Shoulder.Part0 = tbl.Torso
tbl.Left_Shoulder.Parent = tbl.Torso

tbl.Right_Hip.Part1 = tbl.Right_Leg
tbl.Right_Hip.Name = "Right Hip"
tbl.Right_Hip.MaxVelocity = 0.1
tbl.Right_Hip.C1 = CFrame.new(4.93588, 9.87176, 0, 0, 0, 1, 0, 1, 0, -1, -0, -0)
tbl.Right_Hip.C0 = CFrame.new(9.87176, -9.87176, 0, 0, 0, 1, 0, 1, 0, -1, -0, -0)
tbl.Right_Hip.Part0 = tbl.Torso
tbl.Right_Hip.Parent = tbl.Torso

tbl.Left_Hip.Part1 = tbl.Left_Leg
tbl.Left_Hip.Name = "Left Hip"
tbl.Left_Hip.MaxVelocity = 0.1
tbl.Left_Hip.C1 = CFrame.new(-4.93588, 9.87176, 0, -0, -0, -1, 0, 1, 0, 1, 0, 0)
tbl.Left_Hip.C0 = CFrame.new(-9.87176, -9.87176, 0, -0, -0, -1, 0, 1, 0, 1, 0, 0)
tbl.Left_Hip.Part0 = tbl.Torso
tbl.Left_Hip.Parent = tbl.Torso

tbl.Neck.Part1 = tbl.Head
tbl.Neck.Name = "Neck"
tbl.Neck.MaxVelocity = 0.1
tbl.Neck.C1 = CFrame.new(0, -4.93588, 0, -1, -0, -0, 0, 0, 1, 0, 1, 0)
tbl.Neck.C0 = CFrame.new(0, 9.87176, 0, -1, -0, -0, 0, 0, 1, 0, 1, 0)
tbl.Neck.Part0 = tbl.Torso
tbl.Neck.Parent = tbl.Torso

tbl.Left_Arm.CFrame = CFrame.new(-14.7937, 29.6153, 1.30777, 1, 0, 0, 0, 1, 0, 0, 0, 1)
tbl.Left_Arm.CanCollide = false
tbl.Left_Arm.Transparency = 0.65
tbl.Left_Arm.Color = Color3.fromRGB(127, 127, 127)
tbl.Left_Arm.Size = Vector3.new(9.87176, 19.7435, 9.87176)
tbl.Left_Arm.BrickColor = BrickColor.new("Sand green")
tbl.Left_Arm.Name = "Left Arm"
tbl.Left_Arm.Parent = tbl.Rig

tbl.LeftShoulderAttachment.CFrame = CFrame.new(0, 9.87176, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)
tbl.LeftShoulderAttachment.WorldCFrame = CFrame.new(-14.7937, 39.487, 1.30777, 1, 0, 0, 0, 1, 0, 0, 0, 1)
tbl.LeftShoulderAttachment.Name = "LeftShoulderAttachment"
tbl.LeftShoulderAttachment.Parent = tbl.Left_Arm

tbl.LeftGripAttachment.CFrame = CFrame.new(0, -9.87176, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)
tbl.LeftGripAttachment.WorldCFrame = CFrame.new(-14.7937, 19.7435, 1.30777, 1, 0, 0, 0, 1, 0, 0, 0, 1)
tbl.LeftGripAttachment.Name = "LeftGripAttachment"
tbl.LeftGripAttachment.Parent = tbl.Left_Arm

tbl.Right_Arm.CFrame = CFrame.new(14.8216, 29.6153, 1.30777, 1, 0, 0, 0, 1, 0, 0, 0, 1)
tbl.Right_Arm.CanCollide = false
tbl.Right_Arm.Transparency = 0.65
tbl.Right_Arm.Color = Color3.fromRGB(127, 127, 127)
tbl.Right_Arm.Size = Vector3.new(9.87176, 19.7435, 9.87176)
tbl.Right_Arm.BrickColor = BrickColor.new("Sand green")
tbl.Right_Arm.Name = "Right Arm"
tbl.Right_Arm.Parent = tbl.Rig

tbl.RightShoulderAttachment.CFrame = CFrame.new(0, 9.87176, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)
tbl.RightShoulderAttachment.WorldCFrame = CFrame.new(14.8216, 39.487, 1.30777, 1, 0, 0, 0, 1, 0, 0, 0, 1)
tbl.RightShoulderAttachment.Name = "RightShoulderAttachment"
tbl.RightShoulderAttachment.Parent = tbl.Right_Arm

tbl.RightGripAttachment.CFrame = CFrame.new(0, -9.87176, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)
tbl.RightGripAttachment.WorldCFrame = CFrame.new(14.8216, 19.7435, 1.30777, 1, 0, 0, 0, 1, 0, 0, 0, 1)
tbl.RightGripAttachment.Name = "RightGripAttachment"
tbl.RightGripAttachment.Parent = tbl.Right_Arm

tbl.Left_Leg.CFrame = CFrame.new(-4.92194, 9.87176, 1.30777, 1, 0, 0, 0, 1, 0, 0, 0, 1)
tbl.Left_Leg.BottomSurface = Enum.SurfaceType.Smooth
tbl.Left_Leg.CanCollide = false
tbl.Left_Leg.Transparency = 0.65
tbl.Left_Leg.Color = Color3.fromRGB(127, 127, 127)
tbl.Left_Leg.Size = Vector3.new(9.87176, 19.7435, 9.87176)
tbl.Left_Leg.BrickColor = BrickColor.new("Sand green")
tbl.Left_Leg.Name = "Left Leg"
tbl.Left_Leg.Parent = tbl.Rig

tbl.LeftFootAttachment.CFrame = CFrame.new(0, -9.87176, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)
tbl.LeftFootAttachment.WorldCFrame = CFrame.new(-4.92194, -2.86102e-06, 1.30777, 1, 0, 0, 0, 1, 0, 0, 0, 1)
tbl.LeftFootAttachment.Name = "LeftFootAttachment"
tbl.LeftFootAttachment.Parent = tbl.Left_Leg

tbl.Right_Leg.CFrame = CFrame.new(4.94982, 9.87176, 1.30777, 1, 0, 0, 0, 1, 0, 0, 0, 1)
tbl.Right_Leg.BottomSurface = Enum.SurfaceType.Smooth
tbl.Right_Leg.CanCollide = false
tbl.Right_Leg.Transparency = 0.65
tbl.Right_Leg.Color = Color3.fromRGB(127, 127, 127)
tbl.Right_Leg.Size = Vector3.new(9.87176, 19.7435, 9.87176)
tbl.Right_Leg.BrickColor = BrickColor.new("Sand green")
tbl.Right_Leg.Name = "Right Leg"
tbl.Right_Leg.Parent = tbl.Rig

tbl.RightFootAttachment.CFrame = CFrame.new(0, -9.87176, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)
tbl.RightFootAttachment.WorldCFrame = CFrame.new(4.94982, -2.86102e-06, 1.30777, 1, 0, 0, 0, 1, 0, 0, 0, 1)
tbl.RightFootAttachment.Name = "RightFootAttachment"
tbl.RightFootAttachment.Parent = tbl.Right_Leg

tbl.Humanoid.JumpHeight = 71.0767
tbl.Humanoid.WalkSpeed = 100
tbl.Humanoid.NameDisplayDistance = 987.176
tbl.Humanoid.JumpPower = 157.097
tbl.Humanoid.HealthDisplayDistance = 987.176
tbl.Humanoid.Parent = tbl.Rig

tbl.Animator.Parent = tbl.Humanoid

tbl.HumanoidDescription.ProportionScale = 0
tbl.HumanoidDescription.RightArmColor = Color3.fromRGB(127.5, 127.5, 127.5)
tbl.HumanoidDescription.TorsoColor = Color3.fromRGB(127.5, 127.5, 127.5)
tbl.HumanoidDescription.RightLegColor = Color3.fromRGB(127.5, 127.5, 127.5)
tbl.HumanoidDescription.LeftLegColor = Color3.fromRGB(127.5, 127.5, 127.5)
tbl.HumanoidDescription.BodyTypeScale = 0
tbl.HumanoidDescription.LeftArmColor = Color3.fromRGB(127.5, 127.5, 127.5)
tbl.HumanoidDescription.HeadColor = Color3.fromRGB(127.5, 127.5, 127.5)
tbl.HumanoidDescription.Parent = tbl.Humanoid

tbl.BodyPartDescription.Color = Color3.fromRGB(127.5, 127.5, 127.5)
tbl.BodyPartDescription.Parent = tbl.HumanoidDescription

tbl.BodyPartDescription_1.Color = Color3.fromRGB(127.5, 127.5, 127.5)
tbl.BodyPartDescription_1.BodyPart = Enum.BodyPart.LeftArm
tbl.BodyPartDescription_1.Parent = tbl.HumanoidDescription

tbl.BodyPartDescription_2.Color = Color3.fromRGB(127.5, 127.5, 127.5)
tbl.BodyPartDescription_2.BodyPart = Enum.BodyPart.LeftLeg
tbl.BodyPartDescription_2.Parent = tbl.HumanoidDescription

tbl.BodyPartDescription_3.Color = Color3.fromRGB(127.5, 127.5, 127.5)
tbl.BodyPartDescription_3.BodyPart = Enum.BodyPart.RightArm
tbl.BodyPartDescription_3.Parent = tbl.HumanoidDescription

tbl.BodyPartDescription_4.Color = Color3.fromRGB(127.5, 127.5, 127.5)
tbl.BodyPartDescription_4.BodyPart = Enum.BodyPart.RightLeg
tbl.BodyPartDescription_4.Parent = tbl.HumanoidDescription

tbl.BodyPartDescription_5.Color = Color3.fromRGB(127.5, 127.5, 127.5)
tbl.BodyPartDescription_5.BodyPart = Enum.BodyPart.Torso
tbl.BodyPartDescription_5.Parent = tbl.HumanoidDescription

tbl.HumanoidRootPart.CFrame = CFrame.new(0.0139389, 29.6153, 1.30777, 1, 0, 0, 0, 1, 0, 0, 0, 1)
tbl.HumanoidRootPart.BottomSurface = Enum.SurfaceType.Smooth
tbl.HumanoidRootPart.CanCollide = false
tbl.HumanoidRootPart.Transparency = 0.65
tbl.HumanoidRootPart.TopSurface = Enum.SurfaceType.Smooth
tbl.HumanoidRootPart.Size = Vector3.new(19.7435, 19.7435, 9.87176)
tbl.HumanoidRootPart.Name = "HumanoidRootPart"
tbl.HumanoidRootPart.Parent = tbl.Rig

tbl.RootAttachment.WorldCFrame = CFrame.new(0.0139389, 29.6153, 1.30777, 1, 0, 0, 0, 1, 0, 0, 0, 1)
tbl.RootAttachment.Name = "RootAttachment"
tbl.RootAttachment.Parent = tbl.HumanoidRootPart

tbl.RootJoint.Part1 = tbl.Torso
tbl.RootJoint.Name = "RootJoint"
tbl.RootJoint.MaxVelocity = 0.1
tbl.RootJoint.C1 = CFrame.new(0, 0, 0, -1, -0, -0, 0, 0, 1, 0, 1, 0)
tbl.RootJoint.C0 = CFrame.new(0, 0, 0, -1, -0, -0, 0, 0, 1, 0, 1, 0)
tbl.RootJoint.Part0 = tbl.HumanoidRootPart
tbl.RootJoint.Parent = tbl.HumanoidRootPart

tbl.Animate.Name = "Animate"
tbl.Animate.Parent = tbl.Rig

tbl.idle.Name = "idle"
tbl.idle.Parent = tbl.Animate

tbl.Animation1.AnimationId = "http://www.roblox.com/asset/?id=180435571"
tbl.Animation1.Name = "Animation1"
tbl.Animation1.Parent = tbl.idle

tbl.Weight.Name = "Weight"
tbl.Weight.Value = 9
tbl.Weight.Parent = tbl.Animation1

tbl.Animation2.AnimationId = "http://www.roblox.com/asset/?id=180435792"
tbl.Animation2.Name = "Animation2"
tbl.Animation2.Parent = tbl.idle

tbl.Weight_1.Name = "Weight"
tbl.Weight_1.Value = 1
tbl.Weight_1.Parent = tbl.Animation2

tbl.walk.Name = "walk"
tbl.walk.Parent = tbl.Animate

tbl.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=180426354"
tbl.WalkAnim.Name = "WalkAnim"
tbl.WalkAnim.Parent = tbl.walk

tbl.run.Name = "run"
tbl.run.Parent = tbl.Animate

tbl.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=180426354"
tbl.RunAnim.Name = "RunAnim"
tbl.RunAnim.Parent = tbl.run

tbl.jump.Name = "jump"
tbl.jump.Parent = tbl.Animate

tbl.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=125750702"
tbl.JumpAnim.Name = "JumpAnim"
tbl.JumpAnim.Parent = tbl.jump

tbl.climb.Name = "climb"
tbl.climb.Parent = tbl.Animate

tbl.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=180436334"
tbl.ClimbAnim.Name = "ClimbAnim"
tbl.ClimbAnim.Parent = tbl.climb

tbl.toolnone.Name = "toolnone"
tbl.toolnone.Parent = tbl.Animate

tbl.ToolNoneAnim.AnimationId = "http://www.roblox.com/asset/?id=182393478"
tbl.ToolNoneAnim.Name = "ToolNoneAnim"
tbl.ToolNoneAnim.Parent = tbl.toolnone

tbl.fall.Name = "fall"
tbl.fall.Parent = tbl.Animate

tbl.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=180436148"
tbl.FallAnim.Name = "FallAnim"
tbl.FallAnim.Parent = tbl.fall

tbl.sit.Name = "sit"
tbl.sit.Parent = tbl.Animate

tbl.SitAnim.AnimationId = "http://www.roblox.com/asset/?id=178130996"
tbl.SitAnim.Name = "SitAnim"
tbl.SitAnim.Parent = tbl.sit

tbl.PlayEmote.Name = "PlayEmote"
tbl.PlayEmote.Parent = tbl.Animate

tbl.ScaleDampeningPercent.Name = "ScaleDampeningPercent"
tbl.ScaleDampeningPercent.Value = 1
tbl.ScaleDampeningPercent.Parent = tbl.Animate

tbl.Body_Colors.LeftArmColor3 = Color3.fromRGB(127.5, 127.5, 127.5)
tbl.Body_Colors.HeadColor = BrickColor.new("Silver flip/flop")
tbl.Body_Colors.RightLegColor = BrickColor.new("Silver flip/flop")
tbl.Body_Colors.LeftLegColor = BrickColor.new("Silver flip/flop")
tbl.Body_Colors.HeadColor3 = Color3.fromRGB(127.5, 127.5, 127.5)
tbl.Body_Colors.LeftLegColor3 = Color3.fromRGB(127.5, 127.5, 127.5)
tbl.Body_Colors.TorsoColor = BrickColor.new("Silver flip/flop")
tbl.Body_Colors.LeftArmColor = BrickColor.new("Silver flip/flop")
tbl.Body_Colors.TorsoColor3 = Color3.fromRGB(127.5, 127.5, 127.5)
tbl.Body_Colors.RightLegColor3 = Color3.fromRGB(127.5, 127.5, 127.5)
tbl.Body_Colors.RightArmColor = BrickColor.new("Silver flip/flop")
tbl.Body_Colors.RightArmColor3 = Color3.fromRGB(127.5, 127.5, 127.5)
tbl.Body_Colors.Parent = tbl.Rig

task.spawn(function()
	local script = tbl.Animate

	-- humanoidAnimatePlayEmote.lua
	
	local Figure = script.Parent
	local Torso = Figure:WaitForChild("Torso")
	local RightShoulder = Torso:WaitForChild("Right Shoulder")
	local LeftShoulder = Torso:WaitForChild("Left Shoulder")
	local RightHip = Torso:WaitForChild("Right Hip")
	local LeftHip = Torso:WaitForChild("Left Hip")
	local Neck = Torso:WaitForChild("Neck")
	local Humanoid = Figure:WaitForChild("Humanoid")
	local pose = "Standing"
	
	local EMOTE_TRANSITION_TIME = 0.1
	
	local userAnimateScaleRunSuccess, userAnimateScaleRunValue = pcall(function() return UserSettings():IsUserFeatureEnabled("UserAnimateScaleRun") end)
	local userAnimateScaleRun = userAnimateScaleRunSuccess and userAnimateScaleRunValue
	
	local function getRigScale()
		if userAnimateScaleRun then
			return Figure:GetScale()
		else
			return 1
		end
	end
	
	local currentAnim = ""
	local currentAnimInstance = nil
	local currentAnimTrack = nil
	local currentAnimKeyframeHandler = nil
	local currentAnimSpeed = 1.0
	local animTable = {}
	local animNames = { 
		idle = 	{	
					{ id = "http://www.roblox.com/asset/?id=180435571", weight = 9 },
					{ id = "http://www.roblox.com/asset/?id=180435792", weight = 1 }
				},
		walk = 	{ 	
					{ id = "http://www.roblox.com/asset/?id=180426354", weight = 10 } 
				}, 
		run = 	{
					{ id = "run.xml", weight = 10 } 
				}, 
		jump = 	{
					{ id = "http://www.roblox.com/asset/?id=125750702", weight = 10 } 
				}, 
		fall = 	{
					{ id = "http://www.roblox.com/asset/?id=180436148", weight = 10 } 
				}, 
		climb = {
					{ id = "http://www.roblox.com/asset/?id=180436334", weight = 10 } 
				}, 
		sit = 	{
					{ id = "http://www.roblox.com/asset/?id=178130996", weight = 10 } 
				},	
		toolnone = {
					{ id = "http://www.roblox.com/asset/?id=182393478", weight = 10 } 
				},
		toolslash = {
					{ id = "http://www.roblox.com/asset/?id=129967390", weight = 10 } 
	--				{ id = "slash.xml", weight = 10 } 
				},
		toollunge = {
					{ id = "http://www.roblox.com/asset/?id=129967478", weight = 10 } 
				},
		wave = {
					{ id = "http://www.roblox.com/asset/?id=128777973", weight = 10 } 
				},
		point = {
					{ id = "http://www.roblox.com/asset/?id=128853357", weight = 10 } 
				},
		dance1 = {
					{ id = "http://www.roblox.com/asset/?id=182435998", weight = 10 }, 
					{ id = "http://www.roblox.com/asset/?id=182491037", weight = 10 }, 
					{ id = "http://www.roblox.com/asset/?id=182491065", weight = 10 } 
				},
		dance2 = {
					{ id = "http://www.roblox.com/asset/?id=182436842", weight = 10 }, 
					{ id = "http://www.roblox.com/asset/?id=182491248", weight = 10 }, 
					{ id = "http://www.roblox.com/asset/?id=182491277", weight = 10 } 
				},
		dance3 = {
					{ id = "http://www.roblox.com/asset/?id=182436935", weight = 10 }, 
					{ id = "http://www.roblox.com/asset/?id=182491368", weight = 10 }, 
					{ id = "http://www.roblox.com/asset/?id=182491423", weight = 10 } 
				},
		laugh = {
					{ id = "http://www.roblox.com/asset/?id=129423131", weight = 10 } 
				},
		cheer = {
					{ id = "http://www.roblox.com/asset/?id=129423030", weight = 10 } 
				},
	}
	local dances = {"dance1", "dance2", "dance3"}
	
	-- Existance in this list signifies that it is an emote, the value indicates if it is a looping emote
	local emoteNames = { wave = false, point = false, dance1 = true, dance2 = true, dance3 = true, laugh = false, cheer = false}
	
	function configureAnimationSet(name, fileList)
		if (animTable[name] ~= nil) then
			for _, connection in pairs(animTable[name].connections) do
				connection:disconnect()
			end
		end
		animTable[name] = {}
		animTable[name].count = 0
		animTable[name].totalWeight = 0	
		animTable[name].connections = {}
	
		-- check for config values
		local config = script:FindFirstChild(name)
		if (config ~= nil) then
	--		print("Loading anims " .. name)
			table.insert(animTable[name].connections, config.ChildAdded:connect(function(child) configureAnimationSet(name, fileList) end))
			table.insert(animTable[name].connections, config.ChildRemoved:connect(function(child) configureAnimationSet(name, fileList) end))
			local idx = 1
			for _, childPart in pairs(config:GetChildren()) do
				if (childPart:IsA("Animation")) then
					table.insert(animTable[name].connections, childPart.Changed:connect(function(property) configureAnimationSet(name, fileList) end))
					animTable[name][idx] = {}
					animTable[name][idx].anim = childPart
					local weightObject = childPart:FindFirstChild("Weight")
					if (weightObject == nil) then
						animTable[name][idx].weight = 1
					else
						animTable[name][idx].weight = weightObject.Value
					end
					animTable[name].count = animTable[name].count + 1
					animTable[name].totalWeight = animTable[name].totalWeight + animTable[name][idx].weight
		--			print(name .. " [" .. idx .. "] " .. animTable[name][idx].anim.AnimationId .. " (" .. animTable[name][idx].weight .. ")")
					idx = idx + 1
				end
			end
		end
	
		-- fallback to defaults
		if (animTable[name].count <= 0) then
			for idx, anim in pairs(fileList) do
				animTable[name][idx] = {}
				animTable[name][idx].anim = Instance.new("Animation")
				animTable[name][idx].anim.Name = name
				animTable[name][idx].anim.AnimationId = anim.id
				animTable[name][idx].weight = anim.weight
				animTable[name].count = animTable[name].count + 1
				animTable[name].totalWeight = animTable[name].totalWeight + anim.weight
	--			print(name .. " [" .. idx .. "] " .. anim.id .. " (" .. anim.weight .. ")")
			end
		end
	end
	
	-- Setup animation objects
	function scriptChildModified(child)
		local fileList = animNames[child.Name]
		if (fileList ~= nil) then
			configureAnimationSet(child.Name, fileList)
		end	
	end
	
	script.ChildAdded:connect(scriptChildModified)
	script.ChildRemoved:connect(scriptChildModified)
	
	-- Clear any existing animation tracks
	-- Fixes issue with characters that are moved in and out of the Workspace accumulating tracks
	local animator = if Humanoid then Humanoid:FindFirstChildOfClass("Animator") else nil
	if animator then
		local animTracks = animator:GetPlayingAnimationTracks()
		for i,track in ipairs(animTracks) do
			track:Stop(0)
			track:Destroy()
		end
	end
	
	
	for name, fileList in pairs(animNames) do 
		configureAnimationSet(name, fileList)
	end	
	
	-- ANIMATION
	
	-- declarations
	local toolAnim = "None"
	local toolAnimTime = 0
	
	local jumpAnimTime = 0
	local jumpAnimDuration = 0.3
	
	local toolTransitionTime = 0.1
	local fallTransitionTime = 0.3
	local jumpMaxLimbVelocity = 0.75
	
	-- functions
	
	function stopAllAnimations()
		local oldAnim = currentAnim
	
		-- return to idle if finishing an emote
		if (emoteNames[oldAnim] ~= nil and emoteNames[oldAnim] == false) then
			oldAnim = "idle"
		end
	
		currentAnim = ""
		currentAnimInstance = nil
		if (currentAnimKeyframeHandler ~= nil) then
			currentAnimKeyframeHandler:disconnect()
		end
	
		if (currentAnimTrack ~= nil) then
			currentAnimTrack:Stop()
			currentAnimTrack:Destroy()
			currentAnimTrack = nil
		end
		return oldAnim
	end
	
	function setAnimationSpeed(speed)
		if speed ~= currentAnimSpeed then
			currentAnimSpeed = speed
			currentAnimTrack:AdjustSpeed(currentAnimSpeed)
		end
	end
	
	function keyFrameReachedFunc(frameName)
		if (frameName == "End") then
	
			local repeatAnim = currentAnim
			-- return to idle if finishing an emote
			if (emoteNames[repeatAnim] ~= nil and emoteNames[repeatAnim] == false) then
				repeatAnim = "idle"
			end
			
			local animSpeed = currentAnimSpeed
			playAnimation(repeatAnim, 0.0, Humanoid)
			setAnimationSpeed(animSpeed)
		end
	end
	
	-- Preload animations
	function playAnimation(animName, transitionTime, humanoid) 
			
		local roll = math.random(1, animTable[animName].totalWeight) 
		local origRoll = roll
		local idx = 1
		while (roll > animTable[animName][idx].weight) do
			roll = roll - animTable[animName][idx].weight
			idx = idx + 1
		end
	--		print(animName .. " " .. idx .. " [" .. origRoll .. "]")
		local anim = animTable[animName][idx].anim
	
		-- switch animation		
		if (anim ~= currentAnimInstance) then
			
			if (currentAnimTrack ~= nil) then
				currentAnimTrack:Stop(transitionTime)
				currentAnimTrack:Destroy()
			end
	
			currentAnimSpeed = 1.0
		
			-- load it to the humanoid; get AnimationTrack
			currentAnimTrack = humanoid:LoadAnimation(anim)
			currentAnimTrack.Priority = Enum.AnimationPriority.Core
			 
			-- play the animation
			currentAnimTrack:Play(transitionTime)
			currentAnim = animName
			currentAnimInstance = anim
	
			-- set up keyframe name triggers
			if (currentAnimKeyframeHandler ~= nil) then
				currentAnimKeyframeHandler:disconnect()
			end
			currentAnimKeyframeHandler = currentAnimTrack.KeyframeReached:connect(keyFrameReachedFunc)
			
		end
	
	end
	
	-------------------------------------------------------------------------------------------
	-------------------------------------------------------------------------------------------
	
	local toolAnimName = ""
	local toolAnimTrack = nil
	local toolAnimInstance = nil
	local currentToolAnimKeyframeHandler = nil
	
	function toolKeyFrameReachedFunc(frameName)
		if (frameName == "End") then
	--		print("Keyframe : ".. frameName)	
			playToolAnimation(toolAnimName, 0.0, Humanoid)
		end
	end
	
	
	function playToolAnimation(animName, transitionTime, humanoid, priority)	 
			
			local roll = math.random(1, animTable[animName].totalWeight) 
			local origRoll = roll
			local idx = 1
			while (roll > animTable[animName][idx].weight) do
				roll = roll - animTable[animName][idx].weight
				idx = idx + 1
			end
	--		print(animName .. " * " .. idx .. " [" .. origRoll .. "]")
			local anim = animTable[animName][idx].anim
	
			if (toolAnimInstance ~= anim) then
				
				if (toolAnimTrack ~= nil) then
					toolAnimTrack:Stop()
					toolAnimTrack:Destroy()
					transitionTime = 0
				end
						
				-- load it to the humanoid; get AnimationTrack
				toolAnimTrack = humanoid:LoadAnimation(anim)
				if priority then
					toolAnimTrack.Priority = priority
				end
				 
				-- play the animation
				toolAnimTrack:Play(transitionTime)
				toolAnimName = animName
				toolAnimInstance = anim
	
				currentToolAnimKeyframeHandler = toolAnimTrack.KeyframeReached:connect(toolKeyFrameReachedFunc)
			end
	end
	
	function stopToolAnimations()
		local oldAnim = toolAnimName
	
		if (currentToolAnimKeyframeHandler ~= nil) then
			currentToolAnimKeyframeHandler:disconnect()
		end
	
		toolAnimName = ""
		toolAnimInstance = nil
		if (toolAnimTrack ~= nil) then
			toolAnimTrack:Stop()
			toolAnimTrack:Destroy()
			toolAnimTrack = nil
		end
	
	
		return oldAnim
	end
	
	-------------------------------------------------------------------------------------------
	-------------------------------------------------------------------------------------------
	
	
	function onRunning(speed)
		speed /= getRigScale()
		
		if speed > 0.01 then
			playAnimation("walk", 0.1, Humanoid)
			if currentAnimInstance and currentAnimInstance.AnimationId == "http://www.roblox.com/asset/?id=180426354" then
			end
			pose = "Running"
		else
			if emoteNames[currentAnim] == nil then
				playAnimation("idle", 0.1, Humanoid)
				pose = "Standing"
			end
		end
	end
	
	function onDied()
		pose = "Dead"
	end
	
	function onJumping()
		playAnimation("jump", 0.1, Humanoid)
		jumpAnimTime = jumpAnimDuration
		pose = "Jumping"
	end
	
	function onClimbing(speed)
		speed /= getRigScale()
		
		playAnimation("climb", 0.1, Humanoid)
		pose = "Climbing"
	end
	
	function onGettingUp()
		pose = "GettingUp"
	end
	
	function onFreeFall()
		if (jumpAnimTime <= 0) then
			playAnimation("fall", fallTransitionTime, Humanoid)
		end
		pose = "FreeFall"
	end
	
	function onFallingDown()
		pose = "FallingDown"
	end
	
	function onSeated()
		pose = "Seated"
	end
	
	function onPlatformStanding()
		pose = "PlatformStanding"
	end
	
	function onSwimming(speed)
		if speed > 0 then
			pose = "Running"
		else
			pose = "Standing"
		end
	end
	
	function getTool()	
		for _, kid in ipairs(Figure:GetChildren()) do
			if kid.className == "Tool" then return kid end
		end
		return nil
	end
	
	function getToolAnim(tool)
		for _, c in ipairs(tool:GetChildren()) do
			if c.Name == "toolanim" and c.className == "StringValue" then
				return c
			end
		end
		return nil
	end
	
	function animateTool()
		
		if (toolAnim == "None") then
			playToolAnimation("toolnone", toolTransitionTime, Humanoid, Enum.AnimationPriority.Idle)
			return
		end
	
		if (toolAnim == "Slash") then
			playToolAnimation("toolslash", 0, Humanoid, Enum.AnimationPriority.Action)
			return
		end
	
		if (toolAnim == "Lunge") then
			playToolAnimation("toollunge", 0, Humanoid, Enum.AnimationPriority.Action)
			return
		end
	end
	
	function moveSit()
		RightShoulder.MaxVelocity = 0.15
		LeftShoulder.MaxVelocity = 0.15
		RightShoulder:SetDesiredAngle(3.14 /2)
		LeftShoulder:SetDesiredAngle(-3.14 /2)
		RightHip:SetDesiredAngle(3.14 /2)
		LeftHip:SetDesiredAngle(-3.14 /2)
	end
	
	local lastTick = 0
	
	function move(time)
		local amplitude = 1
		local frequency = 1
	  	local deltaTime = time - lastTick
	  	lastTick = time
	
		local climbFudge = 0
		local setAngles = false
	
	  	if (jumpAnimTime > 0) then
	  		jumpAnimTime = jumpAnimTime - deltaTime
	  	end
	
		if (pose == "FreeFall" and jumpAnimTime <= 0) then
			playAnimation("fall", fallTransitionTime, Humanoid)
		elseif (pose == "Seated") then
			playAnimation("sit", 0.5, Humanoid)
			return
		elseif (pose == "Running") then
			playAnimation("walk", 0.1, Humanoid)
		elseif (pose == "Dead" or pose == "GettingUp" or pose == "FallingDown" or pose == "Seated" or pose == "PlatformStanding") then
	--		print("Wha " .. pose)
			stopAllAnimations()
			amplitude = 0.1
			frequency = 1
			setAngles = true
		end
	
		if (setAngles) then
			local desiredAngle = amplitude * math.sin(time * frequency)
	
			RightShoulder:SetDesiredAngle(desiredAngle + climbFudge)
			LeftShoulder:SetDesiredAngle(desiredAngle - climbFudge)
			RightHip:SetDesiredAngle(-desiredAngle)
			LeftHip:SetDesiredAngle(-desiredAngle)
		end
	
		-- Tool Animation handling
		local tool = getTool()
		if tool and tool:FindFirstChild("Handle") then
		
			local animStringValueObject = getToolAnim(tool)
	
			if animStringValueObject then
				toolAnim = animStringValueObject.Value
				-- message recieved, delete StringValue
				animStringValueObject.Parent = nil
				toolAnimTime = time + .3
			end
	
			if time > toolAnimTime then
				toolAnimTime = 0
				toolAnim = "None"
			end
	
			animateTool()		
		else
			stopToolAnimations()
			toolAnim = "None"
			toolAnimInstance = nil
			toolAnimTime = 0
		end
	end
	
	-- connect events
	Humanoid.Died:connect(onDied)
	Humanoid.Running:connect(onRunning)
	Humanoid.Jumping:connect(onJumping)
	Humanoid.Climbing:connect(onClimbing)
	Humanoid.GettingUp:connect(onGettingUp)
	Humanoid.FreeFalling:connect(onFreeFall)
	Humanoid.FallingDown:connect(onFallingDown)
	Humanoid.Seated:connect(onSeated)
	Humanoid.PlatformStanding:connect(onPlatformStanding)
	Humanoid.Swimming:connect(onSwimming)
    Humanoid.Running:connect(function()
        for i,v in next, Humanoid:GetPlayingAnimationTracks() do
		    v:AdjustSpeed(1)
	    end
    end)
	
	---- setup emote chat hook
	game:GetService("Players").LocalPlayer.Chatted:connect(function(msg)
		local emote = ""
		if msg == "/e dance" then
			emote = dances[math.random(1, #dances)]
		elseif (string.sub(msg, 1, 3) == "/e ") then
			emote = string.sub(msg, 4)
		elseif (string.sub(msg, 1, 7) == "/emote ") then
			emote = string.sub(msg, 8)
		end
		
		if (pose == "Standing" and emoteNames[emote] ~= nil) then
			playAnimation(emote, 0.1, Humanoid)
		end
	
	end)
	
	-- emote bindable hook
	script:WaitForChild("PlayEmote").OnInvoke = function(emote)
		-- Only play emotes when idling
		if pose ~= "Standing" then
			return
		end
		if emoteNames[emote] ~= nil then
			-- Default emotes
			playAnimation(emote, EMOTE_TRANSITION_TIME, Humanoid)
	
			return true, currentAnimTrack
		end
	
		-- Return false to indicate that the emote could not be played
		return false
	end
	-- main program
	
	-- initialize to idle
	playAnimation("idle", 0.1, Humanoid)
	pose = "Standing"
	
	while Figure.Parent ~= nil do
		local _, time = wait(0.1)
		move(time)
	end
	
	
	
end)
game.Players.LocalPlayer.Character = tbl.Rig
game:GetService("Workspace").CurrentCamera.CameraSubject = tbl.Humanoid
local HttpService = game:GetService("HttpService")
for _,part in tbl.Rig:GetDescendants() do 
	pcall(function()
		d.CollisionGroup = "Default"
                d.CanCollide = false 
        end)
end
	
game:GetService("RunService").Heartbeat:Connect(function()
local table = {}
local x, y, z, R00, R01, R02, R10, R11, R12, R20, R21, R22 = tbl.Head.CFrame:GetComponents()
table.Head = {x, y, z, R00, R01, R02, R10, R11, R12, R20, R21, R22}
local x, y, z, R00, R01, R02, R10, R11, R12, R20, R21, R22 = tbl.Torso.CFrame:GetComponents()
table.Torso = {x, y, z, R00, R01, R02, R10, R11, R12, R20, R21, R22}
local x, y, z, R00, R01, R02, R10, R11, R12, R20, R21, R22 = tbl.Left_Arm.CFrame:GetComponents()
table.LeftArm = {x, y, z, R00, R01, R02, R10, R11, R12, R20, R21, R22}
local x, y, z, R00, R01, R02, R10, R11, R12, R20, R21, R22 = tbl.Right_Arm.CFrame:GetComponents()
table.RightArm = {x, y, z, R00, R01, R02, R10, R11, R12, R20, R21, R22}
local x, y, z, R00, R01, R02, R10, R11, R12, R20, R21, R22 = tbl.Left_Leg.CFrame:GetComponents()
table.LeftLeg = {x, y, z, R00, R01, R02, R10, R11, R12, R20, R21, R22}
local x, y, z, R00, R01, R02, R10, R11, R12, R20, R21, R22 = tbl.Right_Leg.CFrame:GetComponents()
table.RightLeg = {x, y, z, R00, R01, R02, R10, R11, R12, R20, R21, R22}
writefile("Titan.lua",HttpService:JSONEncode(table))
end)
getgenv().Mode = "Head" -- Head, TorsoLeft, TorsoRight, LeftArm, RightArm, LeftLeg, RightLeg
loadstring(game:HttpGet("https://raw.githubusercontent.com/s3rvxnt/Washiez/refs/heads/main/TitanPart.lua"))()
