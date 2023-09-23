#!/usr/bin/env bash

set -e

password="insecure"
maria_container="$(docker ps | grep maria | awk '{print $1}')"
session_id="11a877641ef0ce4f06f89aa7c41c3de372d67c7aa1dbdd79"

# echo "SELECT photo_uid FROM photos where deleted_at is not null" \
# 	| docker exec -i "$maria_container" bash -c "mysql -u root -p$password -D photoprism" \
# 	| grep -v "photo_uid" \
# 	| tee -a archived-photos.txt
# 
# python3 tojson.py < archived-photos.txt | jq -r '.' > delete-payload.json

curl 'http://pavilion:2342/api/v1/batch/photos/delete' \
     -X POST \
     -H "X-Session-ID: $session_id" \
     -H 'Content-Type: application/json' \
     -H 'Connection: keep-alive' \
     -d @delete-payload.json

