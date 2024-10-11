#!/usr/bin/env bash

. ./detect.sh

echo "install tool $INSTALL_TOOL"

if [ $INSTALL_TOOL == "pacman" ]; then
    sudo pacman -S --needed --noconfirm -q vim \
        git \
        curl \
        wget \
        zsh \
        unzip \
        direnv \
        neofetch \
        tree \
        jq \
        at
fi

if [ $INSTALL_TOOL == "pacman" ]; then
    sudo pacman -S --needed --noconfirm -q gum
else
    GUM_VERSION=0.14.5
    echo "installing gum $GUM_VERSION"

    wget https://github.com/charmbracelet/gum/releases/download/v${GUM_VERSION}/gum_${GUM_VERSION}_amd64.deb
    sudo dpkg -i gum_${GUM_VERSION}_amd64.deb
    rm gum_${GUM_VERSION}_amd64.deb
fi