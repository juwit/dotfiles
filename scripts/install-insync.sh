#!/usr/bin/env bash

. ./detect.sh

if [ $INSTALL_TOOL == "pacman" ]; then
    sudo pamac install insync
    sudo pamac install insync-nautilus
fi