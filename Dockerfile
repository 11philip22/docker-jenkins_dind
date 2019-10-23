FROM archlinux/base

ARG user=jenkins
ARG group=jenkins
ARG uid=1000
ARG gid=1000
ARG JENKINS_HOME=/var/jenkins_home

RUN pacman -Sy docker docker-compose java-runtime-common jre8-openjdk  jre8-openjdk-headless  libfontenc \
           libxmu  libxt nspr  nss  ttf-dejavu  xdg-utils wget git openssh \
           xorg-fonts-encodings  xorg-mkfontscale  xorg-xset --noconfirm; \
    pacman -Scc --noconfirm

ENV JENKINS_HOME $JENKINS_HOME
RUN mkdir /var/jenkins_home; \
    chown ${uid}:${gid} /var/jenkins_home; \
    useradd -d "$JENKINS_HOME" -u ${uid} -g ${gid} -m -s /bin/bash ${user}

RUN mkdir /usr/share/jenkins; \
    wget http://mirrors.jenkins.io/war-stable/latest/jenkins.war \
    --output-document=/usr/share/jenkins/jenkins.war

USER ${user}
CMD java -jar /usr/share/jenkins/jenkins.war --httpPort=8090

EXPOSE 8090/tcp
VOLUME [ "/var/jenkins" ]
