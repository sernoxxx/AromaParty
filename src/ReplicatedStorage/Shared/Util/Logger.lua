local Logger = {}

function Logger.info(...)
print("[AromaParty]", ...)
end

function Logger.warn(...)
warn("[AromaParty]", ...)
end

function Logger.error(...)
error("[AromaParty] " .. tostring((...)), 2)
end

return Logger
