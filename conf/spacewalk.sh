#!/bin/bash

if [ -f "/var/lib/pgsql/data/.depoly_db_complate" ]; then

	echo "* * * * * * REDEPOLY SPACEWALK SETUP * * * * *"
	echo " ## Start PGSQL Backend "
	su -l postgres -c "/usr/bin/postmaster -p 5432 -D /var/lib/pgsql/data &"
	sleep 2
	echo " ## Start depoly spacewalk "
	spacewalk-setup --skip-db-install --skip-db-population --non-interactive --answer-file=/opt/answer.txt
	sleep 5
else

	echo "* * * * * * START SPACEWALK SETUP * * * * *"
	spacewalk-setup --non-interactive --answer-file=/opt/answer.txt
	sleep 5
	touch /var/lib/pgsql/data/.depoly_db_complate

fi


echo "* * * * * * START SPACEWALK SERVICE * * * * *"
spacewalk-service start

echo "* * * * * * SPACEWALK STATUS * * * * *"
spacewalk-service status

exit 0
