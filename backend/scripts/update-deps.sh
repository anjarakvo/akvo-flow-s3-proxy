#!/bin/sh

set -e
set -x

pip-compile --quiet \
	--upgrade \
	--generate-hashes \
	--strip-extras \
	--output-file=requirements.txt \
	pyproject.toml

pip-compile --quiet \
	--upgrade \
	--generate-hashes \
	--strip-extras \
	--allow-unsafe \
	--extra=dev \
	--constraint=requirements.txt \
	--output-file=requirements-dev.txt \
	pyproject.toml
