local beautiful = require("beautiful")
local awful = require("awful")

local env = {}

function env:init()
    self.modkey = "Mod1"
    self.terminal = "urxvt"
    self.editor = os.getenv("EDITOR") or "nano"
    self.editor_cmd = self.terminal .. " -e " .. self.editor
    self.home = os.getenv("HOME")
end

return env
