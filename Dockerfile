FROM archlinux/base

RUN pacman -Sy docker docker-compose jre11-openjdk wget --noconfirm; \
    pacman -Scc --noconfirm

RUN mkdir /var/jenkins
RUN chown 1000:1000 /var/jenkins
ENV JENKINS_HOME=/var/jenkins

USER 1000

RUN wget http://mirrors.jenkins.io/war-stable/latest/jenkins.war \
    --output-document=/var/jenkins/jenkins.war

CMD java -jar /var/jenkins/jenkins.war --httpPort=8090

EXPOSE 8090/tcp
VOLUME [ "/data" ]
