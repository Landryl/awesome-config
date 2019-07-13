-- Grab environment
local awesome = awesome
local screen = screen
local round = require("gears.math").round
local gears_debug = require("gears.debug")

local xconfig = {}

local fallback = {
  --black
  color0 = '#000000',
  color8 = '#465457',
  --red
  color1 = '#cb1578',
  color9 = '#dc5e86',
  --green
  color2 = '#8ecb15',
  color10 = '#9edc60',
  --yellow
  color3 = '#cb9a15',
  color11 = '#dcb65e',
  --blue
  color4 = '#6f15cb',
  color12 = '#7e5edc',
  --purple
  color5 = '#cb15c9',
  color13 = '#b75edc',
  --cyan
  color6 = '#15b4cb',
  color14 = '#5edcb4',
  --white
  color7 = '#888a85',
  color15 = '#ffffff',
  --
  background  = '#0e0021',
  foreground  = '#bcbcbc',
  --
  color16 = '#dc9656',
  color17 = '#a16946',
  color18 = '#282828',
  color19 = '#383838',
  color20 = '#b8b8b8',
  color21 = '#e8e8e8'
}

--- Get current base colorscheme from xrdb.
-- @treturn table Color table with keys 'background', 'foreground' and 'color0'..'color21'
function xconfig.get_current_theme()
    local keys = { 'background', 'foreground' }
    for i=0,21 do table.insert(keys, "color"..i) end
    local colors = {}
    for _, key in ipairs(keys) do
        local color = awesome.xrdb_get_value("", key)
        if color then
            if color:find("rgb:") then
                color = "#"..color:gsub("[a]?rgb:", ""):gsub("/", "")
            end
        else
            gears_debug.print_warning(
                "beautiful: can't get colorscheme from xrdb for value '"..key.."' (using fallback)."
            )
            color = fallback[key]
        end
        colors[key] = color
    end
    return colors
end

return xconfig.get_current_theme()
