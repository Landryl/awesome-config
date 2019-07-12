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

        -- Windows management
        awful.key({ mod }, "j", function () awful.client.focus.byidx(1) end,
                  { description = "Focus to next window by index",
                    group = "Client" }),
        awful.key({ mod }, "k", function () awful.client.focus.byidx(-1) end,
                  { description = "Focus to previous window by index",
                    group = "Client" }),

        -- Launchers
        awful.key({ mod }, "Return", function () awful.spawn(env.terminal) end,
                  { description = "Open a terminal", group = "Launcher" })
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
                      {description = "view tag #"..i, group = "tag"}),
            -- Toggle tag display.
            awful.key({ mod, "Control" }, "#" .. i + 9,
                      function ()
                          local screen = awful.screen.focused()
                          local tag = screen.tags[i]
                          if tag then
                             awful.tag.viewtoggle(tag)
                          end
                      end,
                      {description = "toggle tag #" .. i, group = "tag"}),
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
                      {description = "move focused client to tag #"..i,
                       group = "tag"}),
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
                      {description = "toggle focused client on tag #" .. i,
                       group = "tag"})
        )
    end

    -- Setting keybindings
    root.keys(globalkeys)

    -- Defining keybinding for clients
    self.clientkeys = gears.table.join(
        awful.key({ mod, "Shift" }, "a", function(c) c:kill() end,
                  { description = "Close client", group = "Client" })
    )

    -- Defining mouse buttons for clients
    self.clientbuttons = gears.table.join(
        awful.button({ }, 1, function (c)
            c:emit_signal("request::activate", "mouse_click", {raise = true})
        end)
    )
end

return keys
