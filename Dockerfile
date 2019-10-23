FROM archlinux/base

RUN pacman -Sy docker docker-compose java-runtime-common jre8-openjdk  jre8-openjdk-headless  libfontenc \
            libxmu  libxt nspr  nss  ttf-dejavu  xdg-utils wget \
            xorg-fonts-encodings  xorg-mkfontscale  xorg-xset --noconfirm; \
    pacman -Scc --noconfirm

RUN mkdir /var/jenkins; \
    chown 1000:1000 /var/jenkins
ENV JENKINS_HOME=/var/jenkins

USER 1000

RUN wget http://mirrors.jenkins.io/war-stable/latest/jenkins.war \
    --output-document=/var/jenkins/jenkins.war

CMD java -jar /var/jenkins/jenkins.war --httpPort=8090

EXPOSE 8090/tcp
VOLUME [ "/var/jenkins" ]
