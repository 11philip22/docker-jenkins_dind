FROM philipwold/jenkins

RUN pacman -Sy docker docker-compose --noconfirm        
# Remove pacman cache and database
RUN pacman -Scc --noconfirm