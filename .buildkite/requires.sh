#!/bin/bash
set -eo pipefail
git clone git://github.com/henrydobson/luggage.git henrydobson/luggage
cd henrydobson/luggage
make bootstrap_files
