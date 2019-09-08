#!/bin/sh

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

if [-n "$BRANCH" ]; then
    command+= --branch $BRANCH
fi

if [-n "$SRC" ]; then
    command+= --src $SRC
fi

if [-n "$DEST" ]; then
    command+= --dest $DEST
fi

if [-n "$ADD" ]; then
    command+= --add
fi

if [ -n "$SILENT" ]; then
    command+= --silent
fi

if [ -n "$MESSAGE" ]; then
    command+= --message $MESSAGE
fi

if [ -n "$TAG" ]; then
    command+= --tag $TAG
fi

if [ -n "$GIT" ]; then
    command+= --git $GIT
fi

if [ -n "$DOTFILES" ]; then
    command+= --dotfiles
fi

if [ -n "$REPO" ]; then
    command+= --repo $REPO
fi

if [ -n "$DEPTH" ]; then
    command+= --repo $DEPTH
fi

if [ -n "$REMOTE" ]; then
    command+= --remote $REMOTE
fi

if [ -n "$USER" ]; then
    command+= --user $USER
fi

if [ -n "$REMOVE" ]; then
    command+= --remove $REMOVE
fi

if [ -n "$NO_PUSH" ]; then
    command+= --no-push
fi

sh -c "${command}"
retval=$?

if [ $retval -ne 0 ]; then
    echo "gh-pages failed: $retval"
    exit 2
fi