#!/bin/bash

echo " START CONTAINER "
docker run --privileged=true -d --name="spacewalk" -p 80:80 -p 443:443 -v /data/var/log:/var/log -v /data/var/lib/pgsql/data:/var/lib/pgsql/data -v /data/var/satellite:/var/satellite -v /data/var/www/html/pub:/var/www/html/pub spacewalk
