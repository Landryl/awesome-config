-- Get theme directory from env
local env = require("env-config")

local base00 = "#1d2021"
local base01 = "#3c3836"
local base02 = "#504945"
local base03 = "#665c54"
local base04 = "#bdae93"
local base05 = "#d5c4a1"
local base06 = "#ebdbb2"
local base07 = "#fbf1c7"
local base08 = "#fb4934"
local base09 = "#fe8019"
local base0A = "#fabd2f"
local base0B = "#b8bb26"
local base0C = "#8ec07c"
local base0D = "#83a598"
local base0E = "#d3869b"
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

theme.wallpaper = env.themesdir .. "/gruvbox/wallpaper.png"
theme.autorun = "xrdb -merge " .. env.themesdir .. "/gruvbox/Xresources"

return theme
