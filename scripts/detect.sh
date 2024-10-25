#!/usr/bin/env bash

source utils.sh

# install tool detection
INSTALL_TOOL=
if [ -x "$(command -v apt)" ]; then
    print "apt compatible environment detected"
    INSTALL_TOOL=apt
fi
if [ -x "$(command -v pacman)" ]; then
    print "pacman compatible environment detected"
    INSTALL_TOOL=pacman
fi

if [ ! $INSTALL_TOOL ]; then
    print "Install tool not detected"
    exit 1
fi