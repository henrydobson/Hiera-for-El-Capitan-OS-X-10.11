#!/bin/bash

export GITHUB_TOKEN=$GH_TOKEN
VERSION=`cat Makefile | grep PACKAGE_VERSION | cut -d= -f2`
RELEASE_TAG="v$VERSION"

git tag $RELEASE_TAG && git push --tags

/usr/local/gopath/bin/github-release release \
    --user henrydobson \
    --repo OSX_Hiera \
    --tag $RELEASE_TAG \
    --name "$BUILDKITE_PROJECT_SLUG" \
    --description "$BUILDKITE_MESSAGE"

/usr/local/gopath/bin/github-release upload \
    --user henrydobson \
    --repo OSX_Hiera \
    --tag $RELEASE_TAG \
    --name "$BUILDKITE_PROJECT_SLUG" \
    --label "$BUILDKITE_MESSAGE" \
    --file $BUILDKITE_ARTIFACT_PATHS
