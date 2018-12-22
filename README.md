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

# Volume List 
/var/log System log
/var/lib/pgsql/data PostgreSQL data
/var/satellite RPM repository
/var/www/html/pub Bootstrap directory
