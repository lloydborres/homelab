#!/bin/bash

#############################################################
# This script creates/starts containers in order.
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

# Color Customization
COLOR_SUCCESS='\033[0;32m'
COLOR_FAILED='\033[0;31m'
COLOR_NORMAL='\033[0m'

# Up docker containers in order
printf "Starting/creating docker containers in order...\n"

SUCCESS_COUNT=0
FAILED_COUNT=0

for FILE in "${PATH_COMPOSE_FILES[@]}"; do
    if docker compose -f "$FILE" up -d; then
        CONTAINERS=$(docker compose -f "$FILE" ps -q)
        ALL_RUNNING=true

        # Check all containers in the compose file
        for ID in $CONTAINERS; do
            STATUS=$(docker inspect -f '{{.State.Status}}' "$ID")

            if [ "$STATUS" != "running" ]; then
                ALL_RUNNING=false
                break
            fi
        done

        if [ "$ALL_RUNNING" = true ]; then
            SUCCESS_COUNT=$((SUCCESS_COUNT + 1))
        else
            FAILED_COUNT=$((FAILED_COUNT + 1))
        fi
    else
        FAILED_COUNT=$((FAILED_COUNT + 1))
    fi
done

# Finish
if [ "$FAILED_COUNT" -eq 0 ]; then
    COLOR_FAILED="$COLOR_NORMAL"
fi

printf "${COLOR_SUCCESS}${SUCCESS_COUNT}${COLOR_NORMAL} "
printf "container(s) were successfully created/started and "
printf "${COLOR_FAILED}${FAILED_COUNT}${COLOR_NORMAL} "
printf "failed.\n"
read -p "Press enter to exit..."
