#!/usr/bin/env bash

# install tool detection
INSTALL_TOOL=
if [ -x "$(command -v apt)" ]; then
    echo "apt compatible environment"
    INSTALL_TOOL=apt
fi
if [ -x "$(command -v pacman)" ]; then
    echo "pacman compatible environment"
    INSTALL_TOOL=pacman
fi

if [ ! $INSTALL_TOOL ]; then
    echo "Install tool not detected"
    exit 1
fi