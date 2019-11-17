FROM philipwold/jenkins

ARG user=user
# your docker group gid
ARG gid=976

USER root
# install docker
RUN pacman -Sy docker docker-compose --noconfirm        
# Remove pacman cache and database
RUN pacman -Scc --noconfirm
# add jenkins user to docker group
RUN usermod --gid ${gid} ${user}

USER ${user}

VOLUME [ "/var/run/docker.sock" ]