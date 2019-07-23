local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local gears = require("gears")
local naughty = require("naughty")

popupmenu = {}

function popupmenu:new(args)
    self.items = args.items

    self.selected = args.selected

    local items_widgets = {}
    for i, item in ipairs(self.items) do
        local elm =
        {
            {
                {
                    text   = item.text,
                    widget = wibox.widget.textbox
                },
                left = 10,
                right = 10,
                widget = wibox.container.margin
            },
            bg = i==self.selected and beautiful.bg_focus or beautiful.bg_normal,
            fg = i==self.selected and beautiful.fg_focus or beautiful.fg_normal,
            widget = wibox.container.background
        }
        items_widgets[#items_widgets+1] = elm
    end
    items_widgets.layout = wibox.layout.fixed.vertical


    self.popup = awful.popup {
        widget = {
            items_widgets,
            top    = 15,
            bottom = 15,
            widget = wibox.container.margin
        },
        placement = awful.placement.centered,
        visible = true,
        ontop   = true,
        bg      = beautiful.bg_normal,
    }

    awful.keygrabber {
        keybindings = {
            {{ }, "j", function() self.pick(self, self.selected + 1) end},
            {{ }, "k", function() self.pick(self, self.selected - 1) end}
        },
        stop_key      = "Escape",
        stop_event    = "release",
        stop_callback =  function() self.popup.visible = false end,
        start_callback = function() self.popup.visible = true end,
        autostart     = true
    }
end

function popupmenu:pick(i)
    i = (i - 1) % #self.items + 1
    self.popup.widget._private.widget._private.widgets[self.selected].bg =
        beautiful.bg_normal
    self.popup.widget._private.widget._private.widgets[i].bg =
        beautiful.bg_focus
    self.selected = i
    self.items[i].action()
end

function popupmenu:recolor()
    local beautiful = require("beautiful")
    self.popup.bg = beautiful.bg_normal
    for i=1,#self.popup.widget._private.widget._private.widgets do
        self.popup.widget._private.widget._private.widgets[i].bg =
            i==self.selected and beautiful.bg_focus or beautiful.bg_normal
        self.popup.widget._private.widget._private.widgets[i].fg =
            i==self.selected and beautiful.fg_focus or beautiful.fg_normal
    end
end

return popupmenu
