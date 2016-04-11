#!/bin/bash
set -eo pipefail
if [[ `hiera -v` == 3.0.1 ]]; then
  exit 0
else
  exit 1
fi
