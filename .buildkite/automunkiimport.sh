#!/bin/bash
set -eo pipefail

BUILDKITE_ARTIFACT_PATHS='/tmp/hiera.pkg'

/usr/local/munki/munkiimport --subdirectory apps/PuppetLabs/Hiera -c testing --verbose --nointeractive $BUILDKITE_ARTIFACT_PATHS
