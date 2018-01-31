local cache = ngx.shared.cache_stat
local upstream_cache_status = ngx.var.upstream_cache_status;
local newval, err = cache:incr(upstream_cache_status, 1)
if not newval and err == "not found" then
	cache:add(upstream_cache_status, 1)
end
local total = "TOTAL"
local newval1, err1 = cache:incr(total, 1)
if not newval1 and err1 == "not found" then
     cache:add(total, 1)
end
