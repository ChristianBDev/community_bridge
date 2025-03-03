if GetResourceState('qb-weathersync') ~= 'started' then return end
Weather = {}

---comment
---@param toggle boolean
Weather.ToggleSync = function(toggle)
    if toggle then
        TriggerEvent("qb-weathersync:client:EnableSync")
    else
        TriggerEvent("qb-weathersync:client:DisableSync")
    end
end