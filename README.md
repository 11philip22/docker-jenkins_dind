# docker-jenkins_dind
```yml
version : "3.7"

services:
  jenkins:
    image: philipwold/jenkins-dind
    volumes:
      - ./jenkins:/var/jenkins_home
      - /var/run/docker.sock:/var/run/docker.sock
    ports:
      - 8082:8090
      - 50000:50000
    restart: unless-stopped
```