# spacewalk-docker-img

Base Dockerfile (https://bitbucket.org/bashell-com/spacewalk)

# Change Logs
  - Update Spacewalk latest version
  - Change repository file
  - Fix Answer File of spacewalk-setup
  - Add spacewalk-status Check Line
  - Add supervisord loglevel='debug'
  - Change Spacewalk.sh 

# Use spacewalk-docker-img 

## Build
Docker image Build Command
~~~bash
docker build --rm -t spacewalk .
~~~

## Run
### Docker image Run Command
~~~bash
docker run --privileged=true -d --name="spacewalk" -p 80:80 -p 443:443 spacewalk
~~~

### Host Volume Attach Command
~~~bash
docker run --privileged=true -d --name="spacewalk" -p 80:80 -p 443:443 -v /data/var/log:/var/log -v /data/var/lib/pgsql/data:/var/lib/pgsql/data -v /data/var/satellite:/var/satellite -v /data/var/www/html/pub:/var/www/html/pub spacewalk
~~~

# Volume List 
~~~bash
/var/log ## System log
/var/lib/pgsql/ ## PostgreSQL data
/var/satellite ## RPM repository
/var/www/html/pub ## Bootstrap directory
~~~

# Create Volume Directory
Example: Host Directory /data
~~~bash
mkdir -p /data/var/lib/pgsql/data
mkdir -p /data/var/satellite
mkdir -p /data/var/www/html/pub
mkdir -p /data/var/log/tomcat6
mkdir -p /data/var/log/httpd
mkdir -p /data/var/log/cobbler

chown 26:26 /data/var/lib/pgsql/data
chmod 777 -R /data/var
~~~

# Known Issue - Volume attach
If you can not install pgsql then run following command
~~~bash
chown 26:26 /(host directoty)/var/lib/pgsql/data ## change owner
~~~

If you can not start tomcat then run following command
~~~bash
mkdir /(host directory)/var/log/tomcat6  ## create tomcat log directory 
chmod 777 /(host directory)/var/log/tomcat6 ## change permission
~~~

If you can not start httpd then run following command
~~~bash
mkdir /(host directory)/var/log/httpd  ## create httpd log directory
chmod 777 /(host directory)/var/log/httpd ## change permission
~~~
