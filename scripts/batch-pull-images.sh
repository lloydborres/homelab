#!/bin/bash

#############################################################
# This script pulls the latest container images
#############################################################

# Update to the path where stored your compose files
PATH_SOURCE="/home/$USER/DockerApps/homelab"

# Docker Compose Paths
PATH_COMPOSE_FILES=(
    "${PATH_SOURCE}/pihole/docker-compose.yml"
    "${PATH_SOURCE}/nginx-proxy-manager/docker-compose.yml"
    "${PATH_SOURCE}/authentik/docker-compose.yml"
    "${PATH_SOURCE}/vaultwarden-server/docker-compose.yml"
    "${PATH_SOURCE}/immich-server/docker-compose.yml"
    "${PATH_SOURCE}/jellyfin-server/docker-compose.yml"
    "${PATH_SOURCE}/navidrome-server/docker-compose.yml"
    "${PATH_SOURCE}/linkwarden-server/docker-compose.yml"
    "${PATH_SOURCE}/forgejo-server/docker-compose.yml"
    "${PATH_SOURCE}/romm-server/docker-compose.yml"
    "${PATH_SOURCE}/syncthing-server/docker-compose.yml"
    "${PATH_SOURCE}/komga-server/docker-compose.yml"
)

# Update docker images
printf "Updating docker images...\n"

for FILE in "${PATH_COMPOSE_FILES[@]}"; do
    docker compose -f "$FILE" pull
done

# Finish
printf "Update finished. "
read -p "Press enter to exit..."
