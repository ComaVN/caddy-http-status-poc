#!/bin/sh

set -e

kill_handler() {
    echo "kill signal received"
    kill -TERM "$child"
}
trap kill_handler TERM INT

php-fpm7

caddy run --config /etc/caddy/Caddyfile --adapter caddyfile &

child=$! 
wait "$child"
