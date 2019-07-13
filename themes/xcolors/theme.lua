----------------------------------------------------------------------
-- xcolors is a theme that extracts all it's colors from Xresources --
----------------------------------------------------------------------
local xconfig = require("lib.xconfig")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

local theme = {}

theme.font      = "SauceCodePro Nerd Font Mono 12"

theme.bg_normal = xconfig["color18"]

theme.fg_normal = xconfig["foreground"]

theme.useless_gap = dpi(5)

return theme
