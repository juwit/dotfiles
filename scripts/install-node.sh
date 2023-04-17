#!/bin/bash
set -e

source utils.sh

if [ ! -x "$(command -v node)" ]; then
    print "installing nodejs"
    curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
    sudo apt-get install -y nodejs
fi

if [ ! -x "$(command -v gitmoji-changelog)" ]; then
    print "installing gitmoji-changelog"
    sudo npm install -g gitmoji-changelog
fi

if [ ! -x "$(command -v zx)" ]; then
    print "installing zx"
    sudo npm install -g zx
fi