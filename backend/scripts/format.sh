#!/bin/sh

set -e
set -x

ruff check app tests --fix
ruff format app tests
