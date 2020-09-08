local naughty = require("naughty")
local ts = {}

function ts:launch()
    local menu = require("lib.popupmenu")
    local items = {}
    local selected = 1
    for i,theme in ipairs(env.themeslist) do
        items[#items + 1] = {
            text = theme,
            action = function()
                env.theme = theme
                screen.emit_signal("theme::set", theme)
                menu:recolor()
            end
        }
        if env.theme == theme then
            selected = i
        end
    end
    menu:new({
        items = items,
        selected = selected
    })
end

return ts
