#!/usr/bin/env bash

set -e

# Cameras that are not mine
cameras=(7 90 41 107 109 64 100 30 23 8 129 105)
password="insecure"
maria_container="$(docker ps | grep maria | awk '{print $1}')"

for camera in ${cameras[@]}; do
echo "SELECT photo_uid FROM photos where camera_id = $camera" \
	| docker exec -i "$maria_container" bash -c "mysql -u root -p$password -D photoprism" \
	| grep -v "photo_uid" \
	| tee -a not-my-photos.txt
done
