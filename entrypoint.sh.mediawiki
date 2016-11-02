#!/bin/sh -e

MEDIAWIKI_VERSION=$(ls -1 /var/www/RELEASE-NOTES-* | sort -nr | head -n1 | sed 's~.*RELEASE-NOTES-~~g')

echo ">> INTRO"
echo "Hey dude, you're running mediawiki==${MEDIAWIKI_VERSION}"
echo

service php5-fpm start
/usr/sbin/nginx
