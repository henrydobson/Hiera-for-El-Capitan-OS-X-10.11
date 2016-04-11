#!/bin/bash
set -eo pipefail

BUILDKITE_ARTIFACT_PATHS='/tmp/hiera.pkg.zip'
export GITHUB_TOKEN=$GITHUB_RELEASE_ACCESS_KEY
VERSION=`cat Makefile | grep PACKAGE_VERSION | cut -d= -f2`
RELEASE_TAG="v$VERSION"

if [[ `git tag | grep $RELEASE_TAG` != $RELEASE_TAG ]]; then
  git tag $RELEASE_TAG
fi

git push OSX_Hiera --tags

/usr/local/gopath/bin/github-release release \
    -u henrydobson \
    -r OSX_Hiera \
    --tag $RELEASE_TAG \
    --name "$RELEASE_TAG" \
    --description "$BUILDKITE_MESSAGE"

/usr/local/gopath/bin/github-release upload \
    -u henrydobson \
    -r OSX_Hiera \
    --tag $RELEASE_TAG \
    --name "hiera.pkg.zip" \
    --file $BUILDKITE_ARTIFACT_PATHS
