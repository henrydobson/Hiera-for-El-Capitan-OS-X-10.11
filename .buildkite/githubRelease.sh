#!/bin/bash
set -eo pipefail
export GITHUB_TOKEN=$GITHUB_RELEASE_ACCESS_KEY
VERSION=`cat Makefile | grep PACKAGE_VERSION | cut -d= -f2`
RELEASE_TAG="v$VERSION"

git tag $RELEASE_TAG && git push $GH_REPO --tags

/usr/local/gopath/bin/github-release release \
    -u henrydobson \
    -r $GH_REPO \
    --tag $RELEASE_TAG \
    --name "$RELEASE_TAG" \
    --description "$BUILDKITE_MESSAGE"

/usr/local/gopath/bin/github-release upload \
    -u henrydobson \
    -r $GH_REPO \
    --tag $RELEASE_TAG \
    --name "$BUILDKITE_ARTIFACT_PATHS" \
    --file $BUILDKITE_ARTIFACT_PATHS
