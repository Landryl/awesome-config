-- Standard awesome libraries
local gears = require("gears")
local awful = require("awful")
require("awful.autofocus")

-- Error handling
require("error-handling")

-- Loading environnement
env = require("env-config")
env:init()

-- Autostart
for i, cmd in ipairs(env.autostart) do
    awful.spawn(cmd)
end

-- Loading global keybindings
local keys = require("keys-config")
keys:init()

-- Loading theme
local beautiful = require("beautiful")
function loadtheme(name)
    local theme = loadfile(env.themesdir .. "/" .. name .. "/theme.lua")()
    os.execute(theme.autorun)
    awful.spawn.with_shell("for pid in `ps -C urxvt | tail --lines=+2 | grep -Po ^\\ \\*\\[0-9\\]+`; do kill -s HUP $pid \n done")
    if env.wallpaper then
        theme.wallpaper = env.wallpaper
    end
    beautiful.init(theme)
end
loadtheme(env.theme)

-- Loading rules
local rules = require("rules-config")
rules:init({keys = keys, beautiful = beautiful})

-- Configuring screens
local statusbar = require("statusbar")

local function set_wallpaper(s)
    if beautiful.wallpaper then
        gears.wallpaper.maximized(beautiful.wallpaper, s, true)
    end
end

-- Re-set wallpaper when a screen's geometry changes
screen.connect_signal("property::geometry", set_wallpaper)

awful.screen.connect_for_each_screen(function(s)
    set_wallpaper(s)
    awful.tag(env.tags, s, {awful.layout.suit.tile.left})
    statusbar:init(s, beautiful)

    -- Adding a signal handler for each individual screen
    screen.connect_signal("theme::update", function()
        set_wallpaper(s)
        statusbar:recolor(s)
    end)

    screen.connect_signal("statusbar::toggle", function()
        statusbar:toggle(s)
    end)
end)

-- Signal handling
screen.connect_signal("theme::set", function(name)
    loadtheme(name)
    screen.emit_signal("theme::update")
end)

client.connect_signal("mouse::enter", function(c)
    c:emit_signal("request::activate", "mouse_enter", {raise = false})
end)
