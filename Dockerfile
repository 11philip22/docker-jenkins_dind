FROM archlinux/base

ARG user=jenkins
ARG group=jenkins
ARG uid=1000
ARG gid=1000
ARG JENKINS_HOME=/var/jenkins_home

# Jenkins dependancies
RUN pacman -Sy docker docker-compose java-runtime-common jre8-openjdk libfontenc \
           libxmu  libxt nspr  nss  ttf-dejavu  xdg-utils jre8-openjdk-headless \
           xorg-fonts-encodings  xorg-mkfontscale  xorg-xset --noconfirm
# Additional programs
RUN pacman -S wget git openssh --noconfirm; \    
    pacman -Scc --noconfirm

ENV JENKINS_HOME $JENKINS_HOME
RUN mkdir /var/jenkins_home; \
    groupadd -g ${gid} ${group}; \
    useradd -d "$JENKINS_HOME" -u ${uid} -g ${gid} -m -s /bin/bash ${user}; \
    chown ${uid}:${gid} /var/jenkins_home

RUN mkdir /usr/share/jenkins; \
    wget http://mirrors.jenkins.io/war-stable/latest/jenkins.war \
    --output-document=/usr/share/jenkins/jenkins.war

USER ${user}
CMD java -jar /usr/share/jenkins/jenkins.war --httpPort=8090

EXPOSE 8090/tcp
VOLUME [ "/var/jenkins" ]
