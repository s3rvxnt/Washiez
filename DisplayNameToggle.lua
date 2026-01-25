if not game:IsLoaded() then
    game.Loaded:Wait()
end

if game.PlaceId == 6764533218 then
    local Players = game:GetService("Players")
    local Local = Players.LocalPlayer
    local Workspace = game:GetService("Workspace")
    local ToggleDisplayName = Local.PlayerGui:WaitForChild("MainUI"):WaitForChild("SideMenu"):WaitForChild("List"):WaitForChild("Settings"):Clone()
    ToggleDisplayName.Parent = Local.PlayerGui.MainUI.SideMenu.List
    ToggleDisplayName.Name = "ToggleDisplayName"
    ToggleDisplayName.ImageButton.Image = "rbxassetid://3926307971"
    ToggleDisplayName.ImageButton.ImageRectOffset = Vector2.new(44, 444)
    ToggleDisplayName.ImageButton.ImageRectSize = Vector2.new(36, 36)
    local sideMenuScript = Local.PlayerGui.MainUI:WaitForChild("Scripts"):WaitForChild("SideMenu")
    local sideMenuEnv = getsenv(sideMenuScript)
    ToggleDisplayName.ImageButton.MouseLeave:Connect(
        function()
            sideMenuEnv.SideMenuOptionOnMouseExit(ToggleDisplayName.ImageButton)
        end
    )
    firesignal(ToggleDisplayName.MouseLeave)
    ToggleDisplayName.ImageButton.MouseEnter:Connect(
        function()
            sideMenuEnv.SideMenuOptionOnMouseEnter(ToggleDisplayName.ImageButton)
        end
    )
    local toggled = false
    local TempListener
    local CantChatList = {}
    ToggleDisplayName.ImageButton.Activated:Connect(
        function()
            pcall(
                function()
                    TempListener:Disconnect()
                end
            )
            toggled = not toggled
            for _, nametag in Workspace.Nametags:GetChildren() do
                local Player = Players:FindFirstChild(nametag.Name)
                if string.find(nametag:WaitForChild("Username").Text, "🔇") then
                    if not table.find(CantChatList,Player.UserId) then
                        table.insert(CantChatList,Player.UserId)
                    end
                end
                if nametag:WaitForChild("Username").Text == "🔇 "..nametag.Name or nametag:WaitForChild("Username").Text == nametag.Name then
                    nametag.Username.Text = Player.DisplayName
                    if table.find(CantChatList,Player.UserId) then
                        nametag.Username.Text = "🔇 "..nametag.Username.Text
                    end
                else
                    nametag.Username.Text = nametag.Name
                    if table.find(CantChatList,Player.UserId) then
                        nametag.Username.Text = "🔇 "..nametag.Username.Text
                    end
                end
            end
            if toggled then
                TempListener =
                    Workspace.Nametags.ChildAdded:Connect(function(nametag)
                        local Player = Players:FindFirstChild(nametag.Name)
                        nametag:WaitForChild("Username").Text = Players:FindFirstChild(nametag.Name).DisplayName
                        if table.find(CantChatList,Player.UserId) then
                            nametag.Username.Text = "🔇 "..nametag.Username.Text
                        end
                    end
                )
            end
        end
    )
end
