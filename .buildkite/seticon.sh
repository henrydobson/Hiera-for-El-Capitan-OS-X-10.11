#!/bin/bash
set -eo pipefail

BUILDKITE_ARTIFACT_PATHS='/tmp/hiera.pkg'

Rez -append icon.rsrc -o $BUILDKITE_ARTIFACT_PATHS
SetFile -a C $BUILDKITE_ARTIFACT_PATHS
