#!/bin/sh
set -e

docker compose run --rm --no-deps backend ./scripts/update-deps.sh
