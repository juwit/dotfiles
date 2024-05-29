#!/bin/bash
set -e

source utils.sh

GOLANG_VERSION=1.22.3

if [ ! -d /opt/go/go-$GOLANG_VERSION ]; then
    print "Installing GoLang version $GOLANG_VERSION"
    gum spin --title "Downloading GoLang version $GOLANG_VERSION" -- curl -Lo /tmp/go-$GOLANG_VERSION.linux-amd64.tar.gz https://dl.google.com/go/go$GOLANG_VERSION.linux-amd64.tar.gz
    tar -C /tmp -xf /tmp/go-$GOLANG_VERSION.linux-amd64.tar.gz
    sudo mkdir -p /opt/go
    sudo mv /tmp/go /opt/go/go-$GOLANG_VERSION
    rm /tmp/go-$GOLANG_VERSION.linux-amd64.tar.gz
    print "Done Installing GoLang version $GOLANG_VERSION"
fi