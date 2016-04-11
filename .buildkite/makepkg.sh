#!/bin/bash
set -eo pipefail
sudo make pkg
sudo mv hiera.pkg $BUILDKITE_ARTIFACT_PATHS
