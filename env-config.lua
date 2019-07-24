local beautiful = require("beautiful")
local awful = require("awful")

local env = {}

function env:init()
    self.modkey = "Mod1"
    self.terminal = "urxvt"
    self.theme = "default"
    self.editor = os.getenv("EDITOR") or "nano"
    self.editor_cmd = self.terminal .. " -e " .. self.editor
    self.home = os.getenv("HOME")
    self.themesdir = self.home .. "/.config/awesome/themes"
    self.themeslist = require("themes.list")
    self.tags = {
        "terms",
        "web",
        "dev",
        "doc",
        "gimp",
        "music",
        "keepass",
        "background",
        "extra"
    }
    self.autostart = {
        "compton"
    }
end

return env
