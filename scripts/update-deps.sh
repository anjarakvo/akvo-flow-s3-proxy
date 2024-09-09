#!/bin/sh
set -e
set -x

# Just in case the backend image have never been build before
docker compose build backend

docker compose run --rm --no-deps backend ./scripts/update-deps.sh

# Rebuild image with new dependencies
docker compose build backend
