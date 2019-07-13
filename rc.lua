-- Standard awesome libraries
local gears = require("gears")
local awful = require("awful")
require("awful.autofocus")

-- Error handling
require("error-handling")

-- Loading environnement
local env = require("env-config")
env:init()

-- Loading global keybindings
local keys = require("keys-config")
keys:init({env = env})

-- Loading rules
local rules = require("rules-config")
rules:init({keys = keys})

-- Loading theme
local beautiful = require("beautiful")
local theme = require("themes." .. env.theme .. ".theme")
beautiful.init(theme)


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

end)

client.connect_signal("mouse::enter", function(c)
    c:emit_signal("request::activate", "mouse_enter", {raise = false})
end)
