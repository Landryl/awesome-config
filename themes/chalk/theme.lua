-- Get theme directory from env
local env = require("env-config")

local base00 = "#151515"
local base01 = "#202020"
local base02 = "#303030"
local base03 = "#505050"
local base04 = "#b0b0b0"
local base05 = "#d0d0d0"
local base06 = "#e0e0e0"
local base07 = "#f5f5f5"
local base08 = "#fb9fb1"
local base09 = "#eda987"
local base0A = "#ddb26f"
local base0B = "#acc267"
local base0C = "#12cfc0"
local base0D = "#6fc2ef"
local base0E = "#e1a3ee"
local base0F = "#deaf8f"

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

theme.wallpaper = env.themesdir .. "/chalk/wallpaper.png"
theme.autorun = "xrdb -merge " .. env.themesdir .. "/chalk/Xresources"

return theme
