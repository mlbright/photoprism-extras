#!/usr/bin/env bash

session_id="11a877641ef0ce4f06f89aa7c41c3de372d67c7aa1dbdd79"

# To delete:
# curl 'http://pavilion:2342/api/v1/batch/photos/delete' \

curl 'http://pavilion:2342/api/v1/batch/photos/archive' \
     -X POST \
     -H "X-Session-ID: $session_id" \
     -H 'Content-Type: application/json' \
     -H 'Connection: keep-alive' \
     -d @payload.json


