local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Shared = ReplicatedStorage:WaitForChild("Shared")

local Logger = require(Shared:WaitForChild("Util"):WaitForChild("Logger"))
require(Shared:WaitForChild("Remotes"))

Logger.info("Server boot OK (with Shared/Remotes/Logger)")
