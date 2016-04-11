#!/bin/bash
for f in $BUILDKITE_ARTIFACT_PATHS; do
  echo "Codesigning $f"
  mv $f "unsigned-$f"
  productsign --sign pebble.it "unsigned-$f" $f
done
