#!/bin/bash
set -e

source utils.sh

if [ ! -d /opt/go-1.13.8 ]; then
    print "installing golang"
    curl -Lo /tmp/go1.13.8.linux-amd64.tar.gz https://dl.google.com/go/go1.13.8.linux-amd64.tar.gz
    sudo tar -C /opt -xf /tmp/go1.13.8.linux-amd64.tar.gz
    sudo mv /opt/go /opt/go-1.13.8
    rm /tmp/go1.13.8.linux-amd64.tar.gz
fi

if [ ! -x "$(command -v goland)" ]; then
    print "installing goland"
    sudo snap install goland --classic
fi
