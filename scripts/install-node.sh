#!/bin/sh
set -e

export GREEN="\e[32m"
export NORMAL="\e[0m"

if [ ! -x "$(command -v node)" ]; then
    echo "${GREEN}installing nodejs${NORMAL}"
    curl -fsSL https://deb.nodesource.com/setup_16.x | sudo -E bash -
    sudo apt-get install -y nodejs
    sudo corepack enable
fi

if [ ! -x "$(command -v gitmoji-changelog)" ]; then
    echo "${GREEN}installing gitmoji-changelog${NORMAL}"
    sudo npm install -g gitmoji-changelog
fi

if [ ! -x "$(command -v zx)" ]; then
    echo "${GREEN}installing zx${NORMAL}"
    sudo npm install -g zx
fi