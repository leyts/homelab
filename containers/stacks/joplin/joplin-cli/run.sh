#!/usr/bin/env bash
# Author: Leyts
# Date: 2026-01-01
# Version: 1.0.0
# Description:
#

source .env

docker run \
    --interactive \
    --name "$CONTAINER_NAME" \
    --rm \
    --tty \
    "$IMAGE_NAME":"$JOPLIN_VERSION" \
    "$@"
