#!/bin/bash
set -eo pipefail

BUILDKITE_ARTIFACT_PATHS='/tmp/hiera.pkg'
export GITHUB_TOKEN=$GITHUB_RELEASE_ACCESS_KEY
VERSION=`cat Makefile | grep PACKAGE_VERSION | cut -d= -f2`
RELEASE_TAG="v$VERSION"

if [[ `git tag | grep $RELEASE_TAG` != $RELEASE_TAG ]]; then
  git tag $RELEASE_TAG
fi

git push $GITHUB_REPO --tags

/usr/local/gopath/bin/github-release release \
    -u henrydobson \
    -r $GITHUB_REPO \
    --tag $RELEASE_TAG \
    --name "$RELEASE_TAG" \
    --description "$BUILDKITE_MESSAGE"

/usr/local/gopath/bin/github-release upload \
    -u henrydobson \
    -r $GITHUB_REPO \
    --tag $RELEASE_TAG \
    --name "hiera.pkg" \
    --file $BUILDKITE_ARTIFACT_PATHS
