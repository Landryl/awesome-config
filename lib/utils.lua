local utils = {}

function utils:trim(s)
    -- http://lua-users.org/wiki/StringTrim
    return (s:gsub("^%s*(.-)%s*$", "%1"))
end

function utils:split(inputstr, sep)
    -- https://stackoverflow.com/questions/1426954/split-string-in-lua
    if sep == nil then
        sep = "%s"
    end
    local t = {}
    for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
        table.insert(t, str)
    end
    return t
end

return utils
