#!/usr/bin/env bash
# Author: Leyts
# Date: 2026-01-01
# Version: 1.0.0
# Description:
#

source .env

docker build \
    --build-arg JOPLIN_VERSION="$JOPLIN_VERSION" \
    --tag "$IMAGE_NAME":"$JOPLIN_VERSION" \
    .
