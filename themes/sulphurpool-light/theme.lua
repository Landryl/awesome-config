-- Get theme directory from env
local env = require("env-config")

local base00 = "#f5f7ff"
local base01 = "#dfe2f1"
local base02 = "#979db4"
local base03 = "#898ea4"
local base04 = "#6b7394"
local base05 = "#5e6687"
local base06 = "#293256"
local base07 = "#202746"
local base08 = "#c94922"
local base09 = "#c76b29"
local base0A = "#c08b30"
local base0B = "#ac9739"
local base0C = "#22a2c9"
local base0D = "#3d8fd1"
local base0E = "#6679cc"
local base0F = "#9c637a"

local theme = require("themes.xcolors.theme")
theme:reload({
    foreground = base07,
    background = base00,
    cursorColor = base07,
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

theme.name = "sulphurpool-light"
theme.wallpaper = env.themesdir .. "/" .. theme.name .. "/wallpaper.png"
theme.autorun = "xrdb -merge " .. env.themesdir .. "/" .. theme.name .. "/Xresources"

return theme
