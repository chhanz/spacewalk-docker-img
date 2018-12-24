# spacewalk-docker-img

Base Dockerfile (https://bitbucket.org/bashell-com/spacewalk)

# Change Logs
  - Spacewalk latest version
  - Change repo file
  - spacewalk-setup answer file fix
  - Add spacewalk-service status 

# Use spacewalk-docker-img 

* Build
Docker image Build Command
~~~bash
docker build --rm -t spacewalk .
~~~

* Run
Docker image Run Command
~~~bash
docker run --privileged=true -d --name="spacewalk" -p 80:80 -p 443:443 spacewalk
~~~

Host Volume Attach Command
~~~bash
docker run --privileged=true -d --name="spacewalk" -p 80:80 -p 443:443 -v /data/var/log:/var/log -v /data/var/lib/pgsql:/var/lib/pgsql -v /data/var/satellite:/var/satellite -v /data/var/www/html/pub:/var/www/html/pub spacewalk
~~~

# Volume List 
~~~bash
/var/log ## System log
/var/lib/pgsql/ ## PostgreSQL data
/var/satellite ## RPM repository
/var/www/html/pub ## Bootstrap directory
~~~

# Known Tomcat Install Issue
If, Wait for tomcat Service ......... ing......
~~~bash
mkdir /(host directory)/var/log/tomcat6  ## create tomcat log directory 
chmod 777 /(host directory)/var/log/tomcat6 ## change own
~~~
