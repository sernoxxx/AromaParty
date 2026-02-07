local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local playerGui = Players.LocalPlayer:WaitForChild("PlayerGui")
local gui = playerGui:WaitForChild("RewardsGui")

local button = gui:WaitForChild("Claim5MinButton")
local statusLabel = gui:WaitForChild("StatusLabel")

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
