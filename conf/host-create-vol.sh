#!/bin/bash

mkdir -p /data/var/lib/pgsql/data
mkdir -p /data/var/satellite
mkdir -p /data/var/www/html/pub
mkdir -p /data/var/log/tomcat6
mkdir -p /data/var/log/httpd

chown 26:26 /data/var/lib/pgsql/data
chmod 777 -R /data/var
