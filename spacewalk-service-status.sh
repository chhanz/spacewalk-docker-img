#!/bin/bash

DOCKER_NAME=`docker ps | grep spacewalk | awk '{print $1}'`

echo " "
echo "Spacewalk Container ID : "$DOCKER_NAME ## Debug 
echo " "
docker exec -ti $DOCKER_NAME spacewalk-service status
