-- error-handling.lua is responsible to display on screen any error that could
-- have occured either during startup of awesome or after

local naughty = require("naughty")

if awesome.startup_errors then
    naughty.notify {
        preset  = naughty.config.presets.critical,
        title   = "Oops, there were errors during startup!",
        text = awesome.startup_errors
    }
end

do
    local in_error = false
    awesome.connect_signal("debug::error", function (err)
        -- Make sure we don't go into an endless error loop
        if in_error then return end
        in_error = true

        naughty.notify {
            preset  = naughty.config.presets.critical,
            title   = "Houston, we have a problem.",
            text = tostring(err)
        }

        in_error = false
    end)
end
