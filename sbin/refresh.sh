#!/bin/sh
set -ex

git diff --exit-code || (echo '\n\n\nGit repo is not clean; please commit first.' && exit 1)

REACH_LANG_ROOT=../reach-lang
cp "$REACH_LANG_ROOT/js/rpc-client"/* .

git diff package.json
git checkout -- package.json

HASH="$("$REACH_LANG_ROOT/scripts/git-hash.sh")"
git commit -am "refresh -> reach-sh/reach-lang@$HASH"
