-- Get theme directory from env
local env = require("env-config")

os.execute("xrdb -merge " .. env.themesdir .. "/base16-default/Xresources")

local theme = require("themes.xcolors.theme")

theme.wallpaper = env.themesdir .. "/base16-default/wallpaper.png"

return theme
