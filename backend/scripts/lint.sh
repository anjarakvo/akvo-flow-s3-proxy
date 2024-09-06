#!/bin/sh

set -e
set -x

mypy app
ruff check app tests
ruff format app tests --check
