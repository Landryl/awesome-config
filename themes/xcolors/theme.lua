---------------------------------------------------------------------
-- xcolors is a theme that extracts all its colors from Xresources --
---------------------------------------------------------------------
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

local theme = {}

function theme:reload(theme)
    self.font          = "SauceCodePro Nerd Font Mono 12"
    self.hotkeys_font  = "SauceCodePro Nerd Font Mono 12"
    self.hotkeys_description_font = "SauceCodePro Nerd Font Mono 12"

    self.bg_normal     = theme.color18
    self.bg_focus      = theme.color19
    self.bg_urgent     = theme.color01

    self.fg_normal     = theme.foreground
    self.fg_focus      = theme.color07
    self.fg_urget      = theme.foreground

    self.hotkeys_bg    = theme.background
    self.hotkeys_fg    = theme.foreground

    self.useless_gap   = dpi(3)
    self.border_width  = dpi(0)
    self.border_normal = theme.color18
    self.border_focus  = theme.color19
end

return theme
