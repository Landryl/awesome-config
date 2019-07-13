local beautiful = require("beautiful")
local awful = require("awful")

local env = {}

function env:init()
    self.modkey = "Mod1"
    self.terminal = "urxvt"
    self.theme = "base16-default"
    self.editor = os.getenv("EDITOR") or "nano"
    self.editor_cmd = self.terminal .. " -e " .. self.editor
    self.home = os.getenv("HOME")
    self.themesdir = self.home .. "/.config/awesome/themes"
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
end

return env
