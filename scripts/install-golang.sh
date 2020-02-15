#!/bin/sh
set -e

export GREEN="\e[32m"
export NORMAL="\e[0m"

if [ ! -d /opt/go-1.13.8 ]; then
    echo "${GREEN}installing golang${NORMAL}"
    curl -Lo /tmp/go1.13.8.linux-amd64.tar.gz https://dl.google.com/go/go1.13.8.linux-amd64.tar.gz
    sudo tar -C /opt -xf /tmp/go1.13.8.linux-amd64.tar.gz
    sudo mv /opt/go /opt/go-1.13.8
    rm /tmp/go1.13.8.linux-amd64.tar.gz
fi

if [ ! -x "$(command -v goland)" ]; then
    echo "${GREEN}installing goland${NORMAL}"
    sudo snap install goland --classic
fi
