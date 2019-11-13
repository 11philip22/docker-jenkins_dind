FROM philipwold/jenkins

RUN pacman -S docker docker-compose --noconfirm        
# Remove pacman cache and database
RUN pacman -Scc --noconfirm