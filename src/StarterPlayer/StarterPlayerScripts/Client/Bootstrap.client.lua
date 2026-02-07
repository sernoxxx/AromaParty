local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- GUI erstellen (falls nicht existiert)
local gui = playerGui:FindFirstChild("RewardsGui")
if not gui then
gui = Instance.new("ScreenGui")
gui.Name = "RewardsGui"
gui.ResetOnSpawn = false
gui.Parent = playerGui

local button = Instance.new("TextButton")
button.Name = "Claim5MinButton"
button.Text = "CLAIM (5 MIN)"
button.Size = UDim2.new(0, 220, 0, 60)
button.Position = UDim2.new(0, 20, 0, 20)
button.Parent = gui

local label = Instance.new("TextLabel")
label.Name = "StatusLabel"
label.Text = ""
label.TextWrapped = true
label.BackgroundTransparency = 1
label.Size = UDim2.new(0, 420, 0, 60)
label.Position = UDim2.new(0, 20, 0, 90)
label.Parent = gui
end

local button = gui:WaitForChild("Claim5MinButton")
local statusLabel = gui:WaitForChild("StatusLabel")

-- Remotes
local Shared = ReplicatedStorage:WaitForChild("Shared")
local Remotes = Shared:WaitForChild("Remotes")

local RewardsClaim = Remotes:WaitForChild("Rewards_Claim")
local UINotify = Remotes:WaitForChild("UI_Notify")

UINotify.OnClientEvent:Connect(function(msg)
statusLabel.Text = tostring(msg)
end)

button.MouseButton1Click:Connect(function()
RewardsClaim:FireServer("Every5Min")
end)

print("[AromaParty] Client ready (Rewards UI)")
