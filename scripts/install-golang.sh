#!/bin/sh
set -e

export GREEN="\e[32m"
export NORMAL="\e[0m"

if [ ! -x "$(command -v go)" ]; then
    echo "${GREEN}installing golang${NORMAL}"
    sudo add-apt-repository ppa:longsleep/golang-backports
    sudo apt-get update
    sudo apt-get install -y golang-go
fi

if [ ! -x "$(command -v goland)" ]; then
    echo "${GREEN}installing goland${NORMAL}"
    sudo snap install goland --classic
fi
