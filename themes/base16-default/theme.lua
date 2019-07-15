-- Get theme directory from env
local env = require("env-config")

local base00 = "#181818"
local base01 = "#282828"
local base02 = "#383838"
local base03 = "#585858"
local base04 = "#b8b8b8"
local base05 = "#d8d8d8"
local base06 = "#e8e8e8"
local base07 = "#f8f8f8"
local base08 = "#ab4642"
local base09 = "#dc9656"
local base0A = "#f7ca88"
local base0B = "#a1b56c"
local base0C = "#86c1b9"
local base0D = "#7cafc2"
local base0E = "#ba8baf"
local base0F = "#a16946"

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

theme.wallpaper = env.themesdir .. "/base16-default/wallpaper.png"
theme.autorun = "xrdb -merge " .. env.themesdir .. "/base16-default/Xresources"

return theme
