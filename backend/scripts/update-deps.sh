#!/bin/sh
set -e

echo "Generating requirements.txt"
pip-compile --quiet \
	--upgrade \
	--generate-hashes \
	--output-file=requirements.txt \
	--strip-extras \
	pyproject.toml

echo "Generating requirements-dev.txt"
pip-compile --quiet \
	--upgrade \
	--allow-unsafe \
	--constraint=requirements.txt \
	--extra=dev \
	--generate-hashes \
	--output-file=requirements-dev.txt \
	--strip-extras \
	pyproject.toml
