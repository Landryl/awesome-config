local gears = require("gears")
local awful = require("awful")

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
        awful.key({ mod }, "p",
                    function()
                        screen.emit_signal("theme::set", "base16-gruvbox")
                    end),
        awful.key({ mod }, "o",
                    function()
                        screen.emit_signal("theme::set", "base16-default")
                    end),

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

        -- Launchers
        awful.key({ mod }, "Return", function () awful.spawn(env.terminal) end,
                  { description = "Open a terminal", group = "Launcher" }),
        awful.key({ mod }, "d", function () awful.screen.focused().promptbox:run() end,
                  { description = "Open prompt", group = "Launcher" })
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
                      end,
                      {description = "View tag #"..i, group = "Tag"}),
            -- Toggle tag display.
            awful.key({ mod, "Control" }, "#" .. i + 9,
                      function ()
                          local screen = awful.screen.focused()
                          local tag = screen.tags[i]
                          if tag then
                             awful.tag.viewtoggle(tag)
                          end
                      end,
                      {description = "Toggle tag #" .. i, group = "Tag"}),
            -- Move client to tag.
            awful.key({ mod, "Shift" }, "#" .. i + 9,
                      function ()
                          if client.focus then
                              local tag = client.focus.screen.tags[i]
                              if tag then
                                  client.focus:move_to_tag(tag)
                              end
                          end
                      end,
                      {description = "Move focused client to tag #"..i,
                       group = "Tag"}),
            -- Toggle tag on focused client.
            awful.key({ mod, "Control", "Shift" }, "#" .. i + 9,
                      function ()
                          if client.focus then
                              local tag = client.focus.screen.tags[i]
                              if tag then
                                  client.focus:toggle_tag(tag)
                              end
                          end
                      end,
                      {description = "Toggle focused client on tag #" .. i,
                       group = "Tag"})
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
