local gears = require("gears")
local awful = require("awful")

keys = {}

function keys:init(args)
    local env = args.env
    local mod = env.modkey

    globalkeys = gears.table.join(
        -- Awesome management
        awful.key({ mod, "Shift" }, "e", awesome.quit,
                  { description = "Quit Awesome", group = "Awesome"}),

        -- Windows management
        awful.key({ mod }, "j", function () awful.client.focus.byidx(1) end,
                  { description = "Focus to next window by index",
                    group = "Client" }),
        awful.key({ mod }, "k", function () awful.client.focus.byidx(-1) end,
                  { description = "Focus to previous window by index",
                    group = "Client" }),

        -- Launchers
        awful.key({ mod }, "Return", function () awful.spawn(env.terminal) end,
                  { description = "Open a terminal", group = "Launcher" })
    )

    -- Setting keybindings
    root.keys(globalkeys)

    -- Defining keybinding for clients
    self.clientkeys = gears.table.join(
        awful.key({ mod, "Shift" }, "q", function(c) c:kill() end,
                  { description = "Close client", group = "Client" })
    )
end

return keys
