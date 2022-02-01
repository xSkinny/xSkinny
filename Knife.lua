local tool = Instance.new("Tool",game.Players.LocalPlayer.Backpack)
local isAttacking = false
tool.Name = "Knife"
game.Players.LocalPlayer.Character:FindFirstChild("Red SS").Handle.Parent = tool
wait()
local handle = tool.Handle
for i,v in pairs(handle:GetChildren()) do
if v.Name ~= "SpecialMesh" then
v:Remove()
end
end
tool.GripUp = Vector3.new(-10 , 0, -10)
tool.GripRight = Vector3.new(0, 0, 0)
tool.GripPos = Vector3.new(0, 0.5, 0)
--tool.GripFoward = Vector3.new(-0, -0, -1)
tool.Activated:Connect(function()
isAttacking = true
local animation = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(game.ReplicatedStorage.Tools["Crude Knife"].Handle.Animation)
animation:Play()
wait(0.75)
isAttacking = false
end)

tool.Equipped:Connect(function()
isAttacking = false
end)

tool.Unequipped:Connect(function()
isAttacking = false
end)

handle.Touched:connect(function(obj)
if isAttacking == true then
if game.Players:FindFirstChild(obj.Parent.Name) then
end
end
end)
