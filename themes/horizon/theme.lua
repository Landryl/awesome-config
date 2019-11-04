-- Get theme directory from env
local env = require("env-config")

local base00 = "#1C1E26"
local base01 = "#232530"
local base02 = "#2E303E"
local base03 = "#6F6F70"
local base04 = "#9DA0A2"
local base05 = "#CBCED0"
local base06 = "#DCDFE4"
local base07 = "#E3E6EE"
local base08 = "#E95678"
local base09 = "#FAB795"
local base0A = "#FAC29A"
local base0B = "#29D398"
local base0C = "#59E1E3"
local base0D = "#26BBD9"
local base0E = "#EE64AC"
local base0F = "#F09383"

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

theme.wallpaper = env.themesdir .. "/horizon/wallpaper.png"
theme.autorun = "xrdb -merge " .. env.themesdir .. "/horizon/Xresources"

return theme
