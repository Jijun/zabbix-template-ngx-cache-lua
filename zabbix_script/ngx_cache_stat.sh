#!/bin/bash
HOST=127.0.0.1
PORT=80
# Functions to return cache stats
function hit {
/usr/bin/curl "http://$HOST:$PORT/cache-status" 2>/dev/null| grep 'HIT' | awk '{print $2}'
             }
function miss {
      /usr/bin/curl "http://$HOST:$PORT/cache-status" 2>/dev/null| grep 'MISS' | awk '{print $2}'
            }
function expired {
      /usr/bin/curl "http://$HOST:$PORT/cache-status" 2>/dev/null| grep 'EXPIRED' | awk '{print $2}'
            }
function updating {
      /usr/bin/curl "http://$HOST:$PORT/cache-status" 2>/dev/null| grep 'UPDATING' | awk '{print $2}'
            }
function stale {
      /usr/bin/curl "http://$HOST:$PORT/cache-status" 2>/dev/null|grep 'STALE' |  awk '{print $2}'
            }
function bypass {
      /usr/bin/curl "http://$HOST:$PORT/cache-status" 2>/dev/null|grep 'BYPASS' |  awk '{print $2}'
            }
function ratio {
      /usr/bin/curl "http://$HOST:$PORT/cache-status" 2>/dev/null|grep 'RATIO' |  awk '{print $2}'
            }
$1

