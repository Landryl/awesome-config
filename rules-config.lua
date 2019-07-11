local gears = require("gears")
local awful = require("awful")

rules = {}

function rules:init(args)
    local clientkeys = args.keys.clientkeys

    awful.rules.rules =
        {
            { -- Rules for all clients
                rule = {},
                properties = {
                    raise = true,
                    keys = clientkeys
                }
            }
        }

end

return rules
