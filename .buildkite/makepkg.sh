#!/bin/bash
set -eo pipefail

BUILDKITE_ARTIFACT_PATHS='/tmp/hiera.pkg'

sudo make pkg
sudo mv hiera.pkg $BUILDKITE_ARTIFACT_PATHS
