local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Shared = ReplicatedStorage:WaitForChild("Shared")
local Logger = require(Shared:WaitForChild("Util"):WaitForChild("Logger"))
local Config = require(Shared:WaitForChild("Config"):WaitForChild("GameConfig"))
local RemotesFolder = require(Shared:WaitForChild("Remotes"))

local ProfileStore = require(script.Parent.Parent.Data.ProfileStore)

local Rewards = {}

local profiles: {[number]: table} = {}

local function getProfile(player: Player)
return profiles[player.UserId]
end

Players.PlayerAdded:Connect(function(player)
profiles[player.UserId] = ProfileStore.load(player.UserId)
Logger.info("Loaded profile for", player.Name)
end)

Players.PlayerRemoving:Connect(function(player)
local profile = profiles[player.UserId]
if profile then
ProfileStore.save(player.UserId, profile)
Logger.info("Saved profile for", player.Name)
end
profiles[player.UserId] = nil
end)

local function canClaimEvery5Min(profile: table)
local now = os.time()
local last = tonumber(profile.LastClaim.Every5Min) or 0
return (now - last) >= Config.Rewards.Every5MinSeconds
end

local function claimEvery5Min(profile: table)
profile.LastClaim.Every5Min = os.time()
profile.TotalPulls = (tonumber(profile.TotalPulls) or 0) + 1
end

-- Remote: Rewards_Claim
local RewardsClaim = RemotesFolder:WaitForChild("Rewards_Claim") :: RemoteEvent
local UINotify = RemotesFolder:WaitForChild("UI_Notify") :: RemoteEvent

RewardsClaim.OnServerEvent:Connect(function(player, rewardType)
if rewardType ~= "Every5Min" then
return
end

local profile = getProfile(player)
if not profile then
return
end

if not canClaimEvery5Min(profile) then
UINotify:FireClient(player, "Too early. Try again later.")
return
end

claimEvery5Min(profile)
UINotify:FireClient(player, "Claimed! Total Pulls: " .. tostring(profile.TotalPulls))
end)

return Rewards
