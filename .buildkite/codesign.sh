#!/bin/bash
set -eo pipefail

BUILDKITE_ARTIFACT_PATHS='/tmp/hiera.pkg'

for f in $BUILDKITE_ARTIFACT_PATHS; do
  echo "Codesigning $f"
  mv $f "$f-unsigned"
  productsign --sign pebble.it "$f-unsigned" $f
done
