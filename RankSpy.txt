local DiscordToken = getgenv().DiscordToken
-- Gui to Lua
-- Version: 3.2

-- Instances:

local RankSpySearcher = Instance.new("BillboardGui")
local Main = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local StatusMessage = Instance.new("TextLabel")
local History = Instance.new("ScrollingFrame")
local Template = Instance.new("Frame")
local Message = Instance.new("TextLabel")
local UIPadding = Instance.new("UIPadding")
local UIListLayout = Instance.new("UIListLayout")
local Remove = Instance.new("TextButton")
local Name = Instance.new("TextLabel")

--Properties:

RankSpySearcher.Name = "RankSpySearcher"
RankSpySearcher.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
RankSpySearcher.Enabled = false
RankSpySearcher.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
RankSpySearcher.Active = true
RankSpySearcher.LightInfluence = 1.000
RankSpySearcher.Size = UDim2.new(3, 0, 5, 0)
RankSpySearcher.StudsOffset = Vector3.new(3.5, 0.5, 0)
RankSpySearcher.ResetOnSpawn = false
RankSpySearcher.AlwaysOnTop = true

Main.Name = "Main"
Main.Parent = RankSpySearcher
Main.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Main.BackgroundTransparency = 0.300
Main.BorderColor3 = Color3.fromRGB(0, 0, 0)
Main.BorderSizePixel = 0
Main.Size = UDim2.new(1, 0, 1, 0)

UICorner.Parent = Main

StatusMessage.Name = "StatusMessage"
StatusMessage.Parent = Main
StatusMessage.AnchorPoint = Vector2.new(0.5, 0.5)
StatusMessage.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
StatusMessage.BackgroundTransparency = 1.000
StatusMessage.BorderColor3 = Color3.fromRGB(0, 0, 0)
StatusMessage.BorderSizePixel = 0
StatusMessage.Position = UDim2.new(0.5, 0, 0.150000006, 0)
StatusMessage.Size = UDim2.new(1, 0, 0.0599999987, 0)
StatusMessage.Font = Enum.Font.SourceSans
StatusMessage.Text = "No Data"
StatusMessage.TextColor3 = Color3.fromRGB(255, 0, 0)
StatusMessage.TextScaled = true
StatusMessage.TextSize = 40.000
StatusMessage.TextStrokeColor3 = Color3.fromRGB(255, 0, 0)
StatusMessage.TextWrapped = true

History.Name = "History"
History.Parent = Main
History.Active = true
History.AnchorPoint = Vector2.new(0.5, 0.5)
History.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
History.BorderColor3 = Color3.fromRGB(0, 0, 0)
History.BorderSizePixel = 0
History.Position = UDim2.new(0.5, 0, 0.600000024, 0)
History.Size = UDim2.new(0.899999976, 0, 0.75, 0)
History.CanvasSize = UDim2.new(0, 0, 0, 0)

Template.Name = "Template"
Template.Parent = History
Template.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Template.BackgroundTransparency = 1.000
Template.BorderColor3 = Color3.fromRGB(0, 0, 0)
Template.BorderSizePixel = 0
Template.Size = UDim2.new(1, 0, 0.200000003, 0)
Template.Visible = false

Message.Name = "Message"
Message.Parent = Template
Message.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Message.BackgroundTransparency = 1.000
Message.BorderColor3 = Color3.fromRGB(0, 0, 0)
Message.BorderSizePixel = 0
Message.Size = UDim2.new(1, 0, 1, 0)
Message.Font = Enum.Font.SourceSans
Message.Text = "loading..."
Message.TextColor3 = Color3.fromRGB(255, 255, 255)
Message.TextScaled = true
Message.TextSize = 29.000
Message.TextWrapped = true
Message.TextXAlignment = Enum.TextXAlignment.Left

UIPadding.Parent = Template
UIPadding.PaddingLeft = UDim.new(0.0250000004, 0)
UIPadding.PaddingRight = UDim.new(0.0799999982, 0)

UIListLayout.Parent = History
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
local highlight
Remove.Name = "Remove"
Remove.Parent = Main
Remove.AnchorPoint = Vector2.new(1, 0)
Remove.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Remove.BackgroundTransparency = 1.000
Remove.BorderColor3 = Color3.fromRGB(0, 0, 0)
Remove.BorderSizePixel = 0
Remove.Position = UDim2.new(1, 0, 0, 0)
Remove.Size = UDim2.new(0.156739816, 0, 0.0939849615, 0)
Remove.Font = Enum.Font.SourceSans
Remove.Text = "X"
Remove.TextColor3 = Color3.fromRGB(255, 255, 255)
Remove.TextScaled = true
Remove.TextSize = 14.000
Remove.TextWrapped = true
Remove.MouseButton1Click:Connect(function()
RankSpySearcher.Enabled = false
pcall(function()highlight:Destroy() end)
end)

Name.Name = "Name"
Name.Parent = Main
Name.AnchorPoint = Vector2.new(0.5, 0.5)
Name.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Name.BackgroundTransparency = 1.000
Name.BorderColor3 = Color3.fromRGB(0, 0, 0)
Name.BorderSizePixel = 0
Name.Position = UDim2.new(0.5, 0, 0.0500000007, 0)
Name.Size = UDim2.new(1, 0, 0.0799999982, 0)
Name.Font = Enum.Font.SourceSans
Name.Text = "Rank Spy"
Name.TextColor3 = Color3.fromRGB(255, 255, 255)
Name.TextScaled = true
Name.TextSize = 30.000
Name.TextStrokeColor3 = Color3.fromRGB(255, 0, 0)
Name.TextWrapped = true
debounce = false
local function Debounce()
task.spawn(function()
debounce = true 
task.wait(1)
debounce = false
end)
end
-- Scripts:
	local function gethistory(player)
    -- Clear previous messages in the History UI
    for i, v in History:GetChildren() do
        if v.Name == "Message" then
            v:Destroy()
        end
    end

    -- Set up RankSpySearcher UI
    RankSpySearcher.Enabled = true
    RankSpySearcher.Adornee = player.Character
    RankSpySearcher.Main.StatusMessage.TextColor3 = Color3.new(255, 0, 0)
    RankSpySearcher.Main.StatusMessage.Text = "No Data"

    local targetUserId = tostring(player.UserId)
    local HttpService = game:GetService("HttpService")
    local response

    -- Request data from Discord API
    while true do
        response = request({
            Url = 'https://discord.com/api/v9/guilds/1276911126684110848/messages/search?content=' .. targetUserId,
            Method = 'GET',
            Headers = {
                ['authorization'] = DiscordToken,
            },
        })
        if response.StatusCode == 200 then
            break
        else
            print("limit")
            task.wait(10)
        end
    end

    -- Parse the response
    local decodedResponse = HttpService:JSONDecode(response.Body)

    -- Process each message if data is available
    if decodedResponse.total_results and decodedResponse.total_results > 0 then
        for _, messageData in ipairs(decodedResponse.messages) do
            local messageContent = messageData[1].embeds[1].description
            local timestamp = messageData[1].timestamp
            local function isoToUnixToReadable(isoTime)
                -- Extract the date and time parts from the ISO 8601 string
                local year, month, day, hour, min, sec = isoTime:match("(%d+)-(%d+)-(%d+)T(%d+):(%d+):([%d%.]+)")
                
                -- Remove any fractional part of the seconds
                sec = tonumber(sec:match("(%d+%.?%d*)"))

                -- Convert the extracted date and time to a Unix timestamp (in UTC)
                local unixTime = os.time({
                    year = tonumber(year),
                    month = tonumber(month),
                    day = tonumber(day),
                    hour = tonumber(hour),
                    min = tonumber(min),
                    sec = sec,
                })

                -- Convert Unix timestamp back to a readable local time in 12-hour format with AM/PM
                local readableTime = os.date("%Y-%m-%d at %I:%M:%S %p", unixTime)

                return readableTime
            end
           
            -- Extract date and time from each message's timestamp
            local readableTime = isoToUnixToReadable(timestamp)
            messageContent = messageContent.." on "
            
            -- Create a new message entry based on content
            local Message = Template:Clone()
            Message.Parent = History
            Message.Name = "Message"
            Message.Visible = true

            -- Update message and UI based on rank change type
                local parts = string.split(messageContent," ")
                RankSpySearcher.Main.StatusMessage.TextColor3 = Color3.new(0, 255, 0)
                RankSpySearcher.Main.StatusMessage.Text = "Has Data"
                highlight.OutlineColor = Color3.new(0, 255, 0)
                Message.Message.Text = messageContent.." " .. readableTime
        end
    else
        -- Display "No data" message if no results found
        local Message = Template:Clone()
        Message.Parent = History
        Message.Name = "Message"
        Message.Visible = true
        Message.Message.Text = "No data"
    end
end

	game:GetService("Players").PlayerAdded:Connect(function(Player) 
            local Cd = Instance.new("ClickDetector")
			Cd.MouseClick:Connect(function()
            if not debounce then
            Debounce()
            pcall(function()highlight:Destroy() end)
            highlight = Instance.new("Highlight")
            highlight.Parent = Player.Character
            Cd.Parent = Player.Character
            highlight.FillTransparency = 1 
            highlight.OutlineColor = Color3.new(255,0,0)
				gethistory(Player)
                end
			end)
            Player.CharacterAdded:Connect(function()
                            local Cd = Instance.new("ClickDetector")
            Cd.Parent = Player.Character
			Cd.MouseClick:Connect(function()
            if not debounce then
            Debounce()
            pcall(function()highlight:Destroy() end)
            highlight = Instance.new("Highlight")
            highlight.Parent = Player.Character
            Cd.Parent = Player.Character
            highlight.FillTransparency = 1 
            highlight.OutlineColor = Color3.new(255,0,0)
				gethistory(Player)
                end
			end)
            end)
    end)

	for i,v in game:GetService("Players"):GetPlayers() do
            local Cd = Instance.new("ClickDetector")
            Cd.Parent = v.Character
			Cd.MouseClick:Connect(function()
            if not debounce then
            Debounce()
            pcall(function()highlight:Destroy() end)
            highlight = Instance.new("Highlight")
            highlight.Parent = v.Character
            Cd.Parent = v.Character
            highlight.FillTransparency = 1 
            highlight.OutlineColor = Color3.new(255,0,0)
				gethistory(v)
                end
			end)
            v.CharacterAdded:Connect(function()
                            local Cd = Instance.new("ClickDetector")
            Cd.Parent = v.Character
			Cd.MouseClick:Connect(function()
            if not debounce then
            Debounce()
            pcall(function()highlight:Destroy(); highlight = nil end)
            highlight = Instance.new("Highlight")
            highlight.Parent = v.Character
            Cd.Parent = v.Character
            highlight.FillTransparency = 1 
            highlight.OutlineColor = Color3.new(255,0,0)
				gethistory(v)
                end
			end)
            end)
	end
