#!/bin/sh

set -e
set -x

coverage run -m pytest
coverage combine
coverage report
