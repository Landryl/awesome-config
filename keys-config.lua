local gears = require("gears")
local awful = require("awful")
local hotkeys_popup = require("awful.hotkeys_popup")

keys = {}

function keys:init(args)
    local env = args.env
    local mod = env.modkey

    globalkeys = gears.table.join(
        -- Awesome management
        awful.key({ mod, "Shift" }, "e", awesome.quit,
                  { description = "Quit Awesome", group = "Awesome"}),
        awful.key({ mod, "Shift" }, "r", awesome.restart,
                  { description = "Restart Awesome", group = "Awesome"}),

        -- Styling management
        awful.key({ mod }, "t",
                    function()
                        local menu = require("lib.popupmenu")
                        local items = {}
                        local selected = 1
                        for i,theme in ipairs(env.themeslist) do
                            items[#items + 1] = {
                                text = theme,
                                action = function()
                                    screen.emit_signal("theme::set", theme)
                                    menu:recolor()
                                    env.theme = theme
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
                    end,
                  { description = "Open color scheme switcher",
                    group = "Theme"}),
        awful.key({ mod, "Shift" }, "h",
                    function()
                        s = awful.screen.focused()
                        s.padding = {
                            top = s.padding.top,
                            bottom = s.padding.bottom,
                            left = s.padding.left + 10,
                            right = s.padding.right + 10
                        }
                        -- See statusbar.lua to understand this hacky thing
                        screen.emit_signal("property::padding")
                    end,
                  { description = "Increase screen padding", group = "Theme"}),
        awful.key({ mod, "Shift" }, "l",
                    function()
                        s = awful.screen.focused()
                        s.padding = {
                            top = s.padding.top,
                            bottom = s.padding.bottom,
                            left = s.padding.left - 10,
                            right = s.padding.right - 10
                        }
                        screen.emit_signal("property::padding")
                    end,
                  { description = "Decrease screen padding", group = "Theme"}),

        -- Layout management
        awful.key({ mod }, "j", function () awful.client.focus.byidx(1) end,
                  { description = "Focus to next window by index",
                    group = "Layout" }),
        awful.key({ mod }, "k", function () awful.client.focus.byidx(-1) end,
                  { description = "Focus to previous window by index",
                    group = "Layout" }),
        awful.key({ mod }, "h", function () awful.tag.incmwfact(0.05) end,
                  { description = "Increase master width factor",
                    group = "Layout" }),
        awful.key({ mod }, "l", function () awful.tag.incmwfact(-0.05) end,
                  { description = "Decrease master width factor",
                    group = "Layout" }),
        awful.key({ mod, "Shift" }, "j", function() awful.client.swap.byidx(1) end,
                  { description = "Swap client with next by index", group = "Layout" }),
        awful.key({ mod, "Shift" }, "k", function() awful.client.swap.byidx(-1) end,
                  { description = "Swap client with next by index", group = "Layout" }),

        -- Launchers
        awful.key({ mod }, "Return", function () awful.spawn(env.terminal) end,
                  { description = "Open a terminal", group = "Launcher" }),
        awful.key({ mod }, "d", function () awful.screen.focused().promptbox:run() end,
                  { description = "Open prompt", group = "Launcher" }),

        -- Screen luminosity
        awful.key({ }, "XF86MonBrightnessUp",
            function()
                awful.spawn("xbacklight -inc 10")
            end),
        awful.key({ }, "XF86MonBrightnessDown",
            function()
                awful.spawn("xbacklight -dec 10")
            end),

        -- Sound
        awful.key({ }, "XF86AudioRaiseVolume",
            function()
                awful.spawn("pactl set-sink-volume 0 +5%")
            end),
        awful.key({ }, "XF86AudioLowerVolume",
            function()
                awful.spawn("pactl set-sink-volume 0 -5%")
            end),
        awful.key({ }, "XF86AudioMute",
            function()
                awful.spawn("pactl set-sink-mute 0 toggle")
            end),

        -- Help menu
        awful.key({ mod }, "s", hotkeys_popup.show_help,
        {description="Show help", group="Launcher" })
    )

    -- Tags management
    for i = 1, 9 do
        globalkeys = gears.table.join(globalkeys,
            -- View tag only.
            awful.key({ mod }, "#" .. i + 9,
                      function ()
                          local screen = awful.screen.focused()
                          local tag = screen.tags[i]
                          if tag then
                             tag:view_only()
                          end
                      end),
            -- Toggle tag display.
            awful.key({ mod, "Control" }, "#" .. i + 9,
                      function ()
                          local screen = awful.screen.focused()
                          local tag = screen.tags[i]
                          if tag then
                             awful.tag.viewtoggle(tag)
                          end
                      end),
            -- Move client to tag.
            awful.key({ mod, "Shift" }, "#" .. i + 9,
                      function ()
                          if client.focus then
                              local tag = client.focus.screen.tags[i]
                              if tag then
                                  client.focus:move_to_tag(tag)
                              end
                          end
                      end),
            -- Toggle tag on focused client.
            awful.key({ mod, "Control", "Shift" }, "#" .. i + 9,
                      function ()
                          if client.focus then
                              local tag = client.focus.screen.tags[i]
                              if tag then
                                  client.focus:toggle_tag(tag)
                              end
                          end
                      end)
        )
    end

    -- Setting keybindings
    root.keys(globalkeys)

    -- Defining keybinding for clients
    self.clientkeys = gears.table.join(
        awful.key({ mod, "Shift" }, "a", function(c) c:kill() end,
                  { description = "Close client", group = "Client" }),
        awful.key({ mod }, "f",
                    function(c)
                        c.fullscreen = not c.fullscreen
                        c:raise()
                    end,
                  {description = "Toggle fullscreen", group = "Client" }),
        awful.key({ mod, "Shift" }, "f", awful.client.floating.toggle,
                  { description = "Toggle floating", group = "Client" })
    )

    -- Defining mouse buttons for clients
    self.clientbuttons = gears.table.join(
        awful.button({ }, 1, function (c)
            c:emit_signal("request::activate", "mouse_click", {raise = true})
        end),
        awful.button({ mod }, 1, function (c)
            c:emit_signal("request::activate", "mouse_click", {raise = true})
            awful.mouse.client.move(c)
        end),
        awful.button({ mod }, 3, function(c)
            c:emit_signal("request::activate", "mouse_click", {raise = true})
            awful.mouse.client.resize(c)
        end)
    )
end

return keys
