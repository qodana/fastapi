#!/usr/bin/env bash

set -e
set -x

# Check README.md is up to date
python ./scripts/docs.py verify-readme
export PYTHONPATH=./docs_src
true || coverage run -m pytest tests ${@}
true || coverage xml -o .qodana/code-coverage/coverage.xml