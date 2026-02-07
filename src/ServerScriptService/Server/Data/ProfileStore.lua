local DataStoreService = game:GetService("DataStoreService")

local ProfileStore = {}
ProfileStore.__index = ProfileStore

local STORE_NAME = "AromaParty_Profile_v1"
local store = DataStoreService:GetDataStore(STORE_NAME)

local function defaultProfile()
return {
TotalPulls = 0,
LastClaim = {
Every5Min = 0, -- os.time()
},
}
end

function ProfileStore.load(userId: number)
local key = "u_" .. tostring(userId)

local ok, data = pcall(function()
return store:GetAsync(key)
end)

if not ok or type(data) ~= "table" then
return defaultProfile()
end

-- falls Felder fehlen, auffüllen
data.TotalPulls = tonumber(data.TotalPulls) or 0
data.LastClaim = type(data.LastClaim) == "table" and data.LastClaim or {}
data.LastClaim.Every5Min = tonumber(data.LastClaim.Every5Min) or 0

return data
end

function ProfileStore.save(userId: number, profile: table)
local key = "u_" .. tostring(userId)

pcall(function()
store:SetAsync(key, profile)
end)
end

return ProfileStore
