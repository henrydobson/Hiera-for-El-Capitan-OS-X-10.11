#!/bin/bash
set -eo pipefail
ARTIFACT_PATHS='/tmp/hiera.pkg'
ditto -ck --rsrc --sequesterRsrc $ARTIFACT_PATHS $BUILDKITE_ARTIFACT_PATHS
sleep 5
