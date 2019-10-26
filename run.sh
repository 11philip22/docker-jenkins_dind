# Create Jenkins user
groupadd -g ${gid} ${group}
useradd -d ${jenkins_home} -u ${uid} -g ${gid} -m -s /bin/bash ${user}
chown ${uid}:${gid} /var/jenkins_home
usermod -aG ${DOCKER_GROUP} ${user}
USER ${user}
java -jar /usr/share/jenkins/jenkins.war --httpPort=8090
