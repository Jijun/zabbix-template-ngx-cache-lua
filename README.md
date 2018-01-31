# zabbix-template-ngx-cache-lua
##  use openresty log_by_lua_file to collect nginx proxy cache hit ratio. use zabbix monitor it.

    http { 
      lua_shared_dict cache_stat 1m;
      server {
        location /cache {
            proxy_cache page_cache;
            #collect hit expired miss etc.
            log_by_lua_file /xx/collect.lua;
        }
        location /cache-status {
            allow 127.0.0.1;
            deny all;
            content_by_lua_file /xx/stat.lua;
        }
     }
   }
