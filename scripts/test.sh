#!/bin/sh
set -e
set -x

docker compose build

# Remove possibly previous broken stacks left hanging after an error
docker compose down -v

docker compose up -d
docker compose exec -T backend ./scripts/lint.sh
docker compose exec -T backend ./scripts/test.sh

# Teardown
docker compose down -v
