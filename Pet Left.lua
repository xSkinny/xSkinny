local RS = game:GetService("RunService")
local PetPositionPart = Instance.new("Part")
PetPositionPart.Size = Vector3.new(0,0,0)
PetPositionPart.Anchored = true
PetPositionPart.CanCollide = false
PetPositionPart.Parent = workspace
local Pet = nil
function FindPet(Part)
	if Part.Handle:FindFirstChildWhichIsA("SpecialMesh") == nil then
		CheckPart = Part.Handle
	else
		if Part.Handle.SpecialMesh then
			CheckPart = Part.Handle.SpecialMesh
		end
	end
	if CheckPart.Name == "Handle" then
		if CheckPart.TextureID == "rbxassetid://5099901156" then
			
		else
			if CheckPart.TextureId == "rbxassetid://5099901156" then
				end
			end
		Pet = Part.Handle
		
		
		
		Pet:FindFirstChildWhichIsA("Weld"):Destroy()
		FEWeldlol(Pet,PetPositionPart)
		return true
	end
end
function FEWeldlol(Part0,Part1)
	local AlignPos = Instance.new('AlignPosition', Part1); AlignPos.Name = "AliP_"
	AlignPos.ApplyAtCenterOfMass = true;
	AlignPos.MaxForce = 67752;
	AlignPos.MaxVelocity = math.huge/9e110;
	AlignPos.ReactionForceEnabled = false;
	AlignPos.Responsiveness = 200;
	AlignPos.RigidityEnabled = false;
	local AlignOri = Instance.new('AlignOrientation', Part1); AlignOri.Name = "AliO_"
	AlignOri.MaxAngularVelocity = math.huge/9e110;
	AlignOri.MaxTorque = 67752;
	AlignOri.PrimaryAxisOnly = false;
	AlignOri.ReactionTorqueEnabled = false;
	AlignOri.Responsiveness = 200;
	AlignOri.RigidityEnabled = false;
	local AttachmentA=Instance.new('Attachment',Part1); AttachmentA.Name = ""
	local AttachmentB=Instance.new('Attachment',Part0); AttachmentB.Name = ""
	local AttachmentC=Instance.new('Attachment',Part1); AttachmentC.Name = ""
	local AttachmentD=Instance.new('Attachment',Part0); AttachmentD.Name = ""
	AttachmentC.Orientation = Vector3.new(0,0,0)
	AttachmentA.Position = Vector3.new(0,0,0)
	AlignPos.Attachment1 = AttachmentA;
	AlignPos.Attachment0 = AttachmentB;
	AlignOri.Attachment1 = AttachmentC;
	AlignOri.Attachment0 = AttachmentD;

end
local Character = game.Players.LocalPlayer.Character

local Descendants = Character:GetDescendants()
for i = 1,#Descendants do
	if Descendants[i].Name == "Meshes/BeeOnShoulder (1)Accessory" then
		local Gart = FindPet(Descendants[i])
		if Gart == true then
			print("Found Pet")
			break
			else
		end
	end
end

local ControlMode = false
local Mouse = game.Players.LocalPlayer:GetMouse()

Mouse.KeyDown:Connect(function(key)
	if key == "l" then
		if ControlMode == false then
			ControlMode = true
			game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 0
			workspace.CurrentCamera.CameraSubject = PetPositionPart
			while ControlMode == true do
				RS.Stepped:wait()
				local FW = game.Players.LocalPlayer.Character.Humanoid.MoveDirection
				PetPositionPart.CFrame = PetPositionPart.CFrame:Lerp(CFrame.new(PetPositionPart.Position + Vector3.new(FW.X,workspace.CurrentCamera.CFrame.LookVector.Y,FW.Z)*6*FW.Magnitude,workspace.CurrentCamera.CFrame * CFrame.new(0,0,-99999).Position),0.1)
			end
		else
			ControlMode = false
			workspace.CurrentCamera.CameraSubject = game.Players.LocalPlayer.Character.Humanoid
			game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 15	
		end
	end
end)

RS.RenderStepped:Connect(function()
	if ControlMode == false then
	PetPositionPart.CFrame = PetPositionPart.CFrame:Lerp(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(3,1+math.sin(time()*1.2)*0.8,0),0.08)
	end	
end)
