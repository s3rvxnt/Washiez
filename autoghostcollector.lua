local Player = game:GetService("Players").LocalPlayer
local Character = Player.Character or Player.CharacterAdded:Wait()

for _,ghost in game:GetService("Workspace"):GetChildren() do 
    if ghost.Name == "Ghost" then
        repeat task.wait()
            pcall(function()
                if Character.Humanoid.Sit then 
                    Character.Humanoid.Sit = false
                end
                Character:PivotTo(ghost.CFrame)
                fireproximityprompt(ghost.Ghost)
            end)
        until not ghost:FindFirstChild("Ghost")
    end
end
