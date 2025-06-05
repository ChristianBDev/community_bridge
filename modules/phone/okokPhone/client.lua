---@diagnostic disable: duplicate-set-field
local resourceName = "okokPhone"
if GetResourceState(resourceName) == 'missing' then return end
Phone = Phone or {}

---This will get the name of the Phone system being being used.
---@return string
Phone.GetPhoneName = function()
    return resourceName
end

---This will send an email to the passed email address with the title and message.
---@param email string
---@param title string
---@param message string
---@return boolean
Phone.SendEmail = function(email, title, message)
    --<-- TODO swap to internal callback system
    local success = lib.callback.await('community_bridge:Callback:okokPhone:sendEmail', false, email, title, message) --[[ @as boolean ]]
    return success
end

return Phone