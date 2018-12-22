# Dockerfile - Spacewalk
#
# - Build
# 
# docker build --rm -t spacewalk .
#
# - Run
# docker run --privileged=true -d --name="spacewalk" -p 80:80 -p 443:443 spacewalk

# 1. Base images
FROM     centos:6
MAINTAINER chhanz <chhan@osci.kr>

# 2. Set the environment variable
WORKDIR /opt

# 3. Add the epel, spacewalk, jpackage, supervisord
ADD conf/group_spacewalkproject-epel6-addons-epel-6.repo /etc/yum.repos.d/epel6-addons-epel-6.repo
ADD conf/group_spacewalkproject-java-packages-epel-7.repo /etc/yum.repos.d/java-packages-epel-7.repo
RUN yum install -y epel-release \
 && rpm -Uvh https://copr-be.cloud.fedoraproject.org/results/@spacewalkproject/spacewalk-2.8/epel-6-x86_64/00736372-spacewalk-repo/spacewalk-repo-2.8-11.el6.noarch.rpm \
 && yum check-update ; yum upgrade -y \
 && yum install -y spacewalk-setup-postgresql spacewalk-postgresql tomcat-native python-setuptools python-pip \
 && yum clean all \
 && pip install supervisor && pip install --upgrade meld3==0.6.10 && mkdir /etc/supervisord.d \
 && rm -rf /root/.cache \
 && cat /usr/share/zoneinfo/Asia/Seoul > /etc/localtime

# 4. Install supervisord config
ADD conf/supervisord.conf /etc/supervisord.d/supervisord.conf

# 5. Install spacewalk initial and running scripts
ADD conf/answer.txt   /opt/answer.txt
ADD conf/spacewalk.sh /opt/spacewalk.sh

# 6. Start supervisord
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.d/supervisord.conf"]

# System Log
VOLUME /var/log

# PostgreSQL Data
VOLUME /var/lib/pgsql/data

# RPM repository
VOLUME /var/satellite

# Bootstrap directory
VOLUME /var/www/html/pub

# Port
EXPOSE 80 443
