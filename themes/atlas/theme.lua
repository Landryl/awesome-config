-- Get theme directory from env
local env = require("env-config")

local base00 = "#002635"
local base01 = "#00384d"
local base02 = "#517F8D"
local base03 = "#6C8B91"
local base04 = "#869696"
local base05 = "#a1a19a"
local base06 = "#e6e6dc"
local base07 = "#fafaf8"
local base08 = "#ff5a67"
local base09 = "#f08e48"
local base0A = "#ffcc1b"
local base0B = "#7fc06e"
local base0D = "#5dd7b9"
local base0C = "#14747e"
local base0E = "#9a70a4"
local base0F = "#c43060"

local theme = require("themes.xcolors.theme")
theme:reload({
    foreground = base05,
    background = base00,
    cursorColor = base05,
    color0      = base00,
    color1      = base08,
    color2      = base0B,
    color3      = base0A,
    color4      = base0D,
    color5      = base0E,
    color6      = base0C,
    color7      = base05,
    color8      = base03,
    color9      = base08,
    color10     = base0B,
    color11     = base0A,
    color12     = base0D,
    color13     = base0E,
    color14     = base0C,
    color15     = base07,
    color16     = base09,
    color17     = base0F,
    color18     = base01,
    color19     = base02,
    color20     = base04,
    color21     = base06
})

theme.wallpaper = env.themesdir .. "/atlas/wallpaper.png"
theme.autorun = "xrdb -merge " .. env.themesdir .. "/atlas/Xresources"

return theme
