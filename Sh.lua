local Players = game:GetService("Players")
local player = Players.LocalPlayer

local normalSpeed = 16

local gui = Instance.new("ScreenGui")
gui.Name = "SpeedController"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 280, 0, 180)
frame.Position = UDim2.new(0.5, -140, 0.5, -90)
frame.BackgroundColor3 = Color3.fromRGB(25, 25, 32)
frame.BorderSizePixel = 0
frame.Parent = gui

Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 12)

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 40)
title.BackgroundTransparency = 1
title.Text = "HASSAN | SPEED CONTROL"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.TextSize = 17
title.Font = Enum.Font.GothamBold
title.Parent = frame

local input = Instance.new("TextBox")
input.Size = UDim2.new(1, -30, 0, 40)
input.Position = UDim2.new(0, 15, 0, 50)
input.BackgroundColor3 = Color3.fromRGB(42, 42, 52)
input.TextColor3 = Color3.new(1, 1, 1)
input.PlaceholderText = "Enter speed multiplier (1, 5, 100...)"
input.Text = "1"
input.TextSize = 14
input.Font = Enum.Font.Gotham
input.ClearTextOnFocus = false
input.Parent = frame

Instance.new("UICorner", input).CornerRadius = UDim.new(0, 8)

local apply = Instance.new("TextButton")
apply.Size = UDim2.new(0.5, -20, 0, 38)
apply.Position = UDim2.new(0, 15, 0, 105)
apply.BackgroundColor3 = Color3.fromRGB(60, 150, 95)
apply.Text = "APPLY SPEED"
apply.TextColor3 = Color3.new(1, 1, 1)
apply.TextSize = 13
apply.Font = Enum.Font.GothamBold
apply.Parent = frame

Instance.new("UICorner", apply).CornerRadius = UDim.new(0, 8)

local reset = Instance.new("TextButton")
reset.Size = UDim2.new(0.5, -20, 0, 38)
reset.Position = UDim2.new(0.5, 5, 0, 105)
reset.BackgroundColor3 = Color3.fromRGB(180, 65, 65)
reset.Text = "RESET"
reset.TextColor3 = Color3.new(1, 1, 1)
reset.TextSize = 13
reset.Font = Enum.Font.GothamBold
reset.Parent = frame

Instance.new("UICorner", reset).CornerRadius = UDim.new(0, 8)

local function setSpeed(multiplier)
    local character = player.Character
    local humanoid = character and character:FindFirstChildOfClass("Humanoid")

    if humanoid then
        humanoid.WalkSpeed = normalSpeed * multiplier
    end
end

apply.MouseButton1Click:Connect(function()
    local multiplier = tonumber(input.Text)

    if multiplier and multiplier > 0 and multiplier < math.huge then
        setSpeed(multiplier)
    end
end)

reset.MouseButton1Click:Connect(function()
    input.Text = "1"
    setSpeed(1)
end)

player.CharacterAdded:Connect(function(character)
    local humanoid = character:WaitForChild("Humanoid")
    task.wait(0.2)

    local multiplier = tonumber(input.Text) or 1
    if multiplier > 0 and multiplier < math.huge then
        humanoid.WalkSpeed = normalSpeed * multiplier
    end
end)
