local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UserInputService = game:GetService("UserInputService")

local Shared = ReplicatedStorage:WaitForChild("Shared")
local Remotes = Shared:WaitForChild("Remotes")

local RewardsClaim = Remotes:WaitForChild("Rewards_Claim")
local UINotify = Remotes:WaitForChild("UI_Notify")

UINotify.OnClientEvent:Connect(function(msg)
print("[AromaParty UI]", msg)
end)

UserInputService.InputBegan:Connect(function(input, gameProcessed)
if gameProcessed then return end
if input.KeyCode == Enum.KeyCode.K then
RewardsClaim:FireServer("Every5Min")
end
end)

print("[AromaParty] Client boot OK (Press K to claim 5-min reward)")
