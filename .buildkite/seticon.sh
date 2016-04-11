#!/bin/bash
set -eo pipefail
Rez -append icon.rsrc -o hiera.pkg
SetFile -a C hiera.pkg
