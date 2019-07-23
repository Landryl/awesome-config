-- Get theme directory from env
local env = require("env-config")

local base00 = "#000000"
local base01 = "#121212"
local base02 = "#222222"
local base03 = "#333333"
local base04 = "#999999"
local base05 = "#c1c1c1"
local base06 = "#999999"
local base07 = "#c1c1c1"
local base08 = "#5f8787"
local base09 = "#aaaaaa"
local base0A = "#e78a53"
local base0B = "#fbcb97"
local base0C = "#aaaaaa"
local base0D = "#888888"
local base0E = "#999999"
local base0F = "#444444"

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

theme.wallpaper = env.themesdir .. "/base16-black-metal-bathory/wallpaper.png"
theme.autorun = "xrdb -merge " .. env.themesdir .. "/base16-black-metal-bathory/Xresources"

return theme
