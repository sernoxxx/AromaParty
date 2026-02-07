local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Shared = ReplicatedStorage:WaitForChild("Shared")

local Logger = require(Shared:WaitForChild("Util"):WaitForChild("Logger"))
require(Shared:WaitForChild("Remotes"))

require(script.Parent.Rewards.RewardsService)

Logger.info("Server boot OK (Rewards ready)")
