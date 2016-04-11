#!/bin/bash
set -eo pipefail

BUILDKITE_ARTIFACT_PATHS='/tmp/hiera.pkg'
sudo gem uninstall hiera
sudo installer -pkg $BUILDKITE_ARTIFACT_PATHS -target /
