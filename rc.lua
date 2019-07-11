-- Standard awesome libraries
local gears = require("gears")
local awful = require("awful")
require("awful.autofocus")

-- Error handling
require("error-handling")

-- Loading environnement
local env = require("env-config")
env:init()

-- Load global keybindings
local keys = require("keys-config")
keys:init({env = env})

-- Load rules
local rules = require("rules-config")
rules:init({keys = keys})


awful.screen.connect_for_each_screen(function(s)
    awful.tag({"default"}, s, {awful.layout.suit.tile.left})
end)

client.connect_signal("mouse::enter", function(c)
    c:emit_signal("request::activate", "mouse_enter", {raise = false})
end)
