---------------------------------------------------------------------
-- xcolors is a theme that extracts all its colors from Xresources --
---------------------------------------------------------------------
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

local theme = {}

function theme:reload()
    local xconfig = require("lib.xconfig").get_current_theme()

    self.font      = "SauceCodePro Nerd Font Mono 12"

    self.bg_normal     = xconfig["color18"]
    self.bg_focus      = xconfig["color19"]
    self.bg_urgent     = xconfig["color01"]

    self.fg_normal     = xconfig["foreground"]
    self.fg_focus      = xconfig["color07"]
    self.fg_urget      = xconfig["foreground"]

    self.useless_gap   = dpi(3)
    self.border_width  = dpi(0)
    self.border_normal = xconfig["color18"]
    self.border_focus  = xconfig["color19"]
end

theme:reload()

return theme
