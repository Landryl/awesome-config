----------------------------------------------------------------------
-- xcolors is a theme that extracts all it's colors from Xresources --
----------------------------------------------------------------------
local xconfig = require("lib.xconfig").get_current_theme()
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

local theme = {}

theme.font      = "SauceCodePro Nerd Font Mono 12"

theme.bg_normal     = xconfig["color18"]
theme.bg_focus      = xconfig["color19"]
theme.bg_urgent     = xconfig["color01"]

theme.fg_normal     = xconfig["foreground"]
theme.fg_focus      = xconfig["color07"]
theme.fg_urget      = xconfig["foreground"]

theme.useless_gap   = dpi(3)
theme.border_width  = dpi(0)
theme.border_normal = xconfig["color18"]
theme.border_focus  = xconfig["color19"]

return theme
