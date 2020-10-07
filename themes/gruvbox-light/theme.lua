-- Get theme directory from env
local env = require("env-config")

local base00 = "#f9f5d7"
local base01 = "#ebdbb2"
local base02 = "#d5c4a1"
local base03 = "#bdae93"
local base04 = "#665c54"
local base05 = "#504945"
local base06 = "#3c3836"
local base07 = "#282828"
local base08 = "#9d0006"
local base09 = "#af3a03"
local base0A = "#b57614"
local base0B = "#79740e"
local base0C = "#427b58"
local base0D = "#076678"
local base0E = "#8f3f71"
local base0F = "#d65d0e"

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

theme.wallpaper = env.themesdir .. "/gruvbox-light/wallpaper.png"
theme.autorun = "xrdb -merge " .. env.themesdir .. "/gruvbox-light/Xresources"

return theme
