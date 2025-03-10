local resourceName = "qb-menu"
local configValue = BridgeClientConfig.MenuSystem
if (configValue == "auto" and GetResourceState(resourceName) ~= "started") or (configValue ~= "auto" and configValue ~= resourceName) then return end
--print("Loading QB Menu")
--- Converts an Ox menu to a QB menu.
---@param id string The menu ID.
---@param menu table The Ox menu data.
---@return table The QB menu data.
function OxToQBMenu(id, menu)
    local qbMenu = {
        {
            header = menu.title,
            isMenuHeader = true,
        }
    }
    for i, v in pairs(menu.options) do
        local button = {
            header = v.title,
            txt = v.description,
            icon = v.icon,
        }

        if v.onSelect then
            button.params = {
                event = "community_bridge:client:MenuCallback",
                args = {id = id, selected = i, args = v.args, onSelect = v.onSelect},
            }
        end

        table.insert(qbMenu, button)
    end

    return qbMenu
end

OpenMenu = function(id, data, useQBinput)
    if not useQBinput then
        data = OxToQBMenu(id, data)
    end
    exports['qb-menu']:openMenu(data)
    return data
end