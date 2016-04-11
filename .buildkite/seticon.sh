#!/bin/bash
set -eo pipefail
Rez -append icon.rsrc -o $BUILDKITE_ARTIFACT_PATHS
SetFile -a C $BUILDKITE_ARTIFACT_PATHS
