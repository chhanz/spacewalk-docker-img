# spacewalk-docker-img

Base Dockerfile (https://bitbucket.org/bashell-com/spacewalk)

# Change Logs
  - Spacewalk latest version
  - Change repo file
  - spacewalk-setup answer file fix
  - Add spacewalk-service status 

# Use spacewalk-docker-img 

* Build
~~~bash
docker build --rm -t spacewalk .
* Run
~~~bash
docker run --privileged=true -d --name="spacewalk" -p 80:80 -p 443:443 spacewalk

