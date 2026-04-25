#!/bin/bash

#############################################################
# This script copies zips all files and folders in
# the directory
#############################################################

DATE=$(date +"%Y.%m.%d")
ARCHIVE_NAME="homelab_${DATE}.zip"
# Update to the path where stored your data
PATH_SOURCE="/home/$USER/DockerApps/homelab"
# Update to the path where you want to store the backup
PATH_DESTINATION="/media/drive/backups/homelab/${ARCHIVE_NAME}"

# Stop docker containers
printf "Stopping all docker containers\n"

docker stop $(docker ps -q)

# Zipping the directory
printf "Zipping %s to %s\n" "$PATH_SOURCE" "$PATH_DESTINATION"

sudo zip -r "$PATH_DESTINATION" "$PATH_SOURCE"

# Finish
read -p 'Backup finished. Press enter to exit...'
