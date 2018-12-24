#!/bin/bash
if ! [ -f "/opt/.spacewalk_initialized" ]; then
    echo "* * * * * * START SPACEWALK SETUP * * * * *"
    spacewalk-setup --non-interactive --answer-file=/opt/answer.txt
    sleep 5
    echo "* * * * * COMPLATE SETUP * * * * *"
    touch /opt/.spacewalk_initialized
fi
echo "* * * * * * START SPACEWALK SERVICE * * * * *"
spacewalk-service start
echo "* * * * * * SPACEWALK STATUS * * * * *"
spacewalk-service status
exit 0
