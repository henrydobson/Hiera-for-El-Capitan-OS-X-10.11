#!/bin/bash
set -eo pipefail

BUILDKITE_ARTIFACT_PATHS='/tmp/hiera.pkg'

sudo Rez -append icon.rsrc -o $BUILDKITE_ARTIFACT_PATHS
sudo SetFile -a C $BUILDKITE_ARTIFACT_PATHS
