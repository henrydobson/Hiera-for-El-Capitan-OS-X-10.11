#!/bin/bash
set -eo pipefail
sudo installer -pkg $BUILDKITE_ARTIFACT_PATHS -target /
