local gears = require("gears")
local awful = require("awful")
local wibox = require("wibox")
local dpi   = require("beautiful.xresources").apply_dpi

statusbar = {}

function statusbar:init(s, theme)
    -- Useful variables
    local screen_width = awful.screen.focused().geometry.width

    -- Create a promptbox for each screen
    s.promptbox = awful.widget.prompt()

    -- Create the wibox
    s.wibox = awful.wibar({
        position = "top",
        screen = s,
        height = dpi(21),
        stretch = false,
        width = screen_width - dpi(10),
    })

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

function statusbar:recolor(s)
    local beautiful = require("beautiful")
    s.wibox.bg = beautiful.bg_normal
    s.wibox.fg = beautiful.fg_normal
    s.promptbox.bg = beautiful.bg_normal
    s.promptbox.fg = beautiful.fg_normal
end

return statusbar
