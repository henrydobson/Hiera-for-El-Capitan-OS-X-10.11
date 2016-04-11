#!/bin/bash
for f in hiera.pkg; do
  echo "Codesigning $f"
  mv $f "unsigned-$f"
  productsign --sign pebble.it "unsigned-$f" $f
done
