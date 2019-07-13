local gears = require("gears")
local awful = require("awful")
local wibox = require("wibox")
local dpi   = require("beautiful.xresources").apply_dpi

statusbar = {}

function statusbar:init(s, theme)
    -- Create a promptbox for each screen
    s.promptbox = awful.widget.prompt()

    -- Create the wibox
    s.wibox = awful.wibar({ position = "top", screen = s, height = dpi(21) })

    -- Add widgets to the wibox
    s.wibox:setup {
        layout = wibox.layout.align.horizontal,
        { -- Left widgets
            layout = wibox.layout.fixed.horizontal,
            s.promptbox,
        },
        { -- Middle widgets
            layout = wibox.layout.fixed.horizontal
        },
        { -- Right widgets
            layout = wibox.layout.fixed.horizontal,
            wibox.widget.textclock(),
        },
    }
end

return statusbar
