#!/bin/bash

echo hola

if [ -f "./nginx.conf" ]; then
    rm /etc/nginx/nginx.conf
    cp ./nginx.conf /etc/nginx/nginx.conf
else
    cp /etc/nginx/nginx.conf ./
fi

mkdir -p /var/www/html/stream
mkdir -p /var/www/html/rtmp
# gunzip -c /usr/share/doc/libnginx-mod-rtmp/examples/stat.xsl.gz > /var/www/html/rtmp/stat.xsl
nginx -g 'daemon off;'
