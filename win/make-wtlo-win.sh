#!/bin/sh
set -e

SCRIPT_VER=0.10
NGINX_VER=1.24.0
PHP_VER=php-8.2.13-nts-Win32-vs16-x64

rm -rf webtlo-win
mkdir -p webtlo-win/php

# Nginx: https://nginx.org/en/download.html
wget -nv -O nginx.zip "https://nginx.org/download/nginx-$NGINX_VER.zip"
unzip -d webtlo-win nginx.zip
mv "webtlo-win/nginx-$NGINX_VER" "webtlo-win/nginx"

# PHP: https://windows.php.net/download Non-Thread-Safe
wget -nv -O php.zip "https://windows.php.net/downloads/releases/$PHP_VER.zip"
unzip -d webtlo-win/php php.zip


# Apply overlays
cp -vr win/artifacts/* webtlo-win/
cp -vr win/overlay/* webtlo-win/

echo Done.
