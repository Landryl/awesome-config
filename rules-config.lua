local gears = require("gears")
local awful = require("awful")

rules = {}

function rules:init(args)
    local clientkeys = args.keys.clientkeys
    local clientbuttons = args.keys.clientbuttons

    awful.rules.rules =
        {
            { -- Rules for all clients
                rule = {},
                properties = {
                    raise = true,
                    focus = awful.client.focus.filter,
                    keys = clientkeys,
                    buttons = clientbuttons
                }
            }
        }

end

return rules
