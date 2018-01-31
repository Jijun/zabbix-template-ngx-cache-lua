local cache = ngx.shared.cache_stat
local keys = cache:get_keys()
for idx, key in pairs(keys) do
    ngx.say(key .. " " .. cache:get(key))
end
local hit = cache:get("HIT")
local total = cache:get("TOTAL")
ngx.say("RATIO ".. string.format("%.2f", hit * 100/total))

