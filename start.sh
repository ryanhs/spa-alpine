#!/bin/sh

/docker/auto-configs/auto-nginx.sh

echo "starting nginx"
exec nginx -g 'daemon off;'
