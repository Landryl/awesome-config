local gears = require("gears")
local awful = require("awful")

rules = {}

function rules:init(args)
    local clientkeys = args.keys.clientkeys
    local clientbuttons = args.keys.clientbuttons
    local beautiful = args.beautiful

    awful.rules.rules =
        {
            { -- Rules for all clients
                rule = {},
                properties = {
                    raise = true,
                    focus = awful.client.focus.filter,
                    keys = clientkeys,
                    buttons = clientbuttons,
                    border_width = beautiful.border_width,
                    border_color = beautiful.border_normal,
                    size_hints_honor = false
                }
            }
        }

end

return rules
