#!/bin/sh
set -e

export GREEN="\e[32m"
export NORMAL="\e[0m"

echo "${GREEN}installing nodejs${NORMAL}"
curl -fsSL https://deb.nodesource.com/setup_16.x | sudo -E bash -
sudo apt-get install -y nodejs

echo "${GREEN}installing gitmoji-changelog${NORMAL}"
sudo npm install -g gitmoji-changelog