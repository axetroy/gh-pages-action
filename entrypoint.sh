#!/bin/sh

set -e

command=gh-pages

if [ ! -n "$GITHUB_TOKEN" ]; then
    echo "You need to supply GITHUB_TOKEN environmental variable"
    exit 1
fi

if [ ! -n "$DIST" ]; then
    echo "You need to supply DIST environmental variable"
    exit 1
else
    command+= --dist $DIST
fi

if [ $BRANCH ]; then
    command+= --branch $BRANCH
fi

if [ $SRC ]; then
    command+= --src $SRC
fi

if [ $DEST ]; then
    command+= --dest $DEST
fi

if [ $ADD ]; then
    command+= --add
fi

if [ $SILENT ]; then
    command+= --silent
fi

if [ $MESSAGE ]; then
    command+= --message $MESSAGE
fi

if [ $TAG ]; then
    command+= --tag $TAG
fi

if [ $GIT ]; then
    command+= --git $GIT
fi

if [ $DOTFILES ]; then
    command+= --dotfiles
fi

if [ $REPO ]; then
    command+= --repo $REPO
fi

if [ $DEPTH ]; then
    command+= --repo $DEPTH
fi

if [ $REMOTE ]; then
    command+= --remote $REMOTE
fi

if [ $USER ]; then
    command+= --user $USER
fi

if [ $REMOVE ]; then
    command+= --remove $REMOVE
fi

if [ $NO_PUSH ]; then
    command+= --no-push
fi

sh -c "${command}"
retval=$?

if [ $retval -ne 0 ]; then
    echo "gh-pages failed: $retval"
    exit 2
fi