local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Shared = ReplicatedStorage:WaitForChild("Shared")
local remotesFolder = Shared:FindFirstChild("Remotes") or Instance.new("Folder")
remotesFolder.Name = "Remotes"
remotesFolder.Parent = Shared

local function ensureRemoteEvent(name: string)
local ev = remotesFolder:FindFirstChild(name)
if not ev then
ev = Instance.new("RemoteEvent")
ev.Name = name
ev.Parent = remotesFolder
end
return ev
end

-- UI -> Server
ensureRemoteEvent("Shop_Purchase")
ensureRemoteEvent("Rewards_Claim")
ensureRemoteEvent("VIP_RequestEnter")

-- Server -> UI
ensureRemoteEvent("UI_Notify")

return remotesFolder
