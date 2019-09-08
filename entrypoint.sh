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
    command="$command --dist $DIST"
fi

if [ $BRANCH ]; then
    command="$command --branch $BRANCH"
fi

if [ $SRC ]; then
    command="$command --src $SRC"
fi

if [ $DEST ]; then
    command="$command --dest $DEST"
fi

if [ $ADD ]; then
    command="$command --add"
fi

if [ $SILENT ]; then
    command="$command --silent"
fi

if [ $MESSAGE ]; then
    command="$command --message $MESSAGE"
fi

if [ $TAG ]; then
    command="$command --tag $TAG"
fi

if [ $GIT ]; then
    command="$command --git $GIT"
fi

if [ $DOTFILES ]; then
    command="$command --dotfiles"
fi

if [ $REPO ]; then
    command="$command --repo $REPO"
fi

if [ $DEPTH ]; then
    command="$command --repo $DEPTH"
fi

if [ $REMOTE ]; then
    command="$command --remote $REMOTE"
fi

if [ $USER ]; then
    command="$command --user $USER"
fi

if [ $REMOVE ]; then
    command="$command --remove $REMOVE"
fi

if [ $NO_PUSH ]; then
    command="$command --no-push"
fi

echo "run command `$command`"

sh -c "${command}"
retval=$?

if [ $retval -ne 0 ]; then
    echo "gh-pages failed: $retval"
    exit 2
fi