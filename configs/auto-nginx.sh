#!/bin/sh

if [ ! -z "$PORT" ]; then sed -i "s/listen 80/listen $PORT/" /etc/nginx/conf.d/default.conf && echo "Set PORT = $PORT"; fi
if [ ! -z "$PORT" ]; then sed -i "s/listen \[::\]:80/listen \[::\]:$PORT/" /etc/nginx/conf.d/default.conf && echo "Set PORT v6 = $PORT"; fi
