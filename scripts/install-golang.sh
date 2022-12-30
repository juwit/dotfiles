#!/bin/bash
set -e

source utils.sh

GOLANG_VERSION=1.17.5

if [ ! -d /opt/go-$GOLANG_VERSION ]; then
    print "installing golang"
    curl -Lo /tmp/go$GOLANG_VERSION.linux-amd64.tar.gz https://dl.google.com/go/go$GOLANG_VERSION.linux-amd64.tar.gz
    sudo tar -C /opt -xf /tmp/go$GOLANG_VERSION.linux-amd64.tar.gz
    rm /tmp/go$GOLANG_VERSION.linux-amd64.tar.gz
fi
