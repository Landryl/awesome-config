local gears = require("gears")
local awful = require("awful")
local wibox = require("wibox")
local dpi   = require("beautiful.xresources").apply_dpi
local utils = require("lib.utils")
local beautiful = require("beautiful")

statusbar = {}

function statusbar:init(s, theme)
    -- Create a promptbox for each screen
    s.promptbox = awful.widget.prompt({
        prompt = " ",
        bg = beautiful.fg_normal,
        bg_cursor = beautiful.fg_normal,
        fg = beautiful.bg_normal,
        fg_cursor = beautiful.bg_normal
    })

    -- Create the wibox
    s.statusbar = awful.wibar({
        position = "top",
        screen = s,
        height = dpi(21),
        stretch = false,
        width = s.geometry.width - dpi(10),
    })

    --s.separator = wibox.widget.textbox("┃")
    s.separator = wibox.widget.textbox("")

    s.battery = awful.widget.watch(
        "cat /sys/class/power_supply/BAT0/capacity && cat /sys/class/power_supply/BAT0/status",
        15,
        function(widget, stdout, stderr, exitreason, exitcode)
            local out = utils:split(stdout, '\n')
            local percentage = tonumber(utils:trim(out[1]))
            local status = utils:trim(out[2])
            local icons = {'','','','','','','','','','',''}
            local icon = ''
            if percentage < 10 then
                icon = icons[1]
            elseif percentage < 20 then
                icon = icons[2]
            elseif percentage < 30 then
                icon = icons[3]
            elseif percentage < 40 then
                icon = icons[4]
            elseif percentage < 50 then
                icon = icons[5]
            elseif percentage < 60 then
                icon = icons[6]
            elseif percentage < 70 then
                icon = icons[7]
            elseif percentage < 80 then
                icon = icons[8]
            elseif percentage < 90 then
                icon = icons[9]
            end

            if status == "Charging" then
                icon = icons[11]
            end

            widget:set_text(' ' .. icon .. ' ' .. percentage .. " ")
        end)

    -- Add widgets to the wibox
    s.statusbar:setup {
        layout = wibox.layout.align.horizontal,
        expand = "outside",
        { -- Left widgets
            layout = wibox.layout.fixed.horizontal,
        },
        { -- Middle widgets
            layout = wibox.layout.fixed.horizontal,
            s.promptbox,
        },
        { -- Right widgets
            layout = wibox.layout.align.horizontal,
            {
                layout = wibox.layout.fixed.horizontal,
            },
            {
                layout = wibox.layout.fixed.horizontal,
            },
            {
                layout = wibox.layout.fixed.horizontal,
                s.separator,
                s.battery,
                s.separator,
                wibox.widget.textclock(),
            }
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
    s.promptbox.bg = beautiful.fg_normal
    s.promptbox.bg_cursor = beautiful.fg_normal
    s.promptbox.fg = beautiful.bg_normal
    s.promptbox.fg_cursor = beautiful.bg_normal
end

function statusbar:toggle(s)
    if s.statusbar.y >= 0 then
        s.statusbar.y = -20
        s.statusbar.height = 1
    else
        s.statusbar.y = 0
        s.statusbar.height = 20
    end
end

return statusbar
