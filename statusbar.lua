local gears = require("gears")
local awful = require("awful")
local wibox = require("wibox")
local dpi   = require("beautiful.xresources").apply_dpi

statusbar = {}

function statusbar:init(s, theme)
    -- Create a promptbox for each screen
    s.promptbox = awful.widget.prompt()

    -- Create the wibox
    s.statusbar = awful.wibar({
        position = "top",
        screen = s,
        height = dpi(21),
        stretch = false,
        width = s.geometry.width - dpi(10),
    })

    -- Add widgets to the wibox
    s.statusbar:setup {
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

    -- Not the best way, but s.connect_signal don't accept a function as #2
    -- argument for some reason, despite the documentation stating otherwise
    -- Might be a bad understanding from me.
    screen.connect_signal("property::padding", function()
        scr = awful.screen.focused()
        scr.statusbar.width = scr.geometry.width - dpi(10) - scr.padding.left - scr.padding.right
    end)
end

function statusbar:recolor(s)
    local beautiful = require("beautiful")
    s.statusbar.bg = beautiful.bg_normal
    s.statusbar.fg = beautiful.fg_normal
    s.promptbox.bg = beautiful.bg_normal
    s.promptbox.fg = beautiful.fg_normal
end

return statusbar
