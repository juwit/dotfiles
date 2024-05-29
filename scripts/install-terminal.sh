#!/bin/bash
set -e

source utils.sh

print "installing common tools"
sudo apt update && sudo apt install -y zsh \
                        htop \
                        tilix \
                        direnv \
                        neofetch \
                        tree \
                        jq \
                        at
sudo apt autoremove

if [ ! -x "$(command -v bat)" ]; then
    print "installing bat"
    sudo apt install bat
    mkdir -p ~/.local/bin
    ln -s /usr/bin/batcat ~/.local/bin/bat
fi

if [ ! -x "$(command -v lsd)" ]; then
    print "installing lsd"
    wget https://github.com/lsd-rs/lsd/releases/download/v1.1.2/lsd_1.1.2_amd64.deb
    sudo dpkg -i lsd_1.1.2_amd64.deb
    rm lsd_1.1.2_amd64.deb
fi

if [ ! -x "$(command -v gum)" ]; then
    GUM_VERSION=0.14.1
    print "installing gum $GUM_VERSION"

    wget https://github.com/charmbracelet/gum/releases/download/v${GUM_VERSION}/gum_${GUM_VERSION}_amd64.deb
    sudo dpkg -i gum_${GUM_VERSION}_amd64.deb
    rm gum_${GUM_VERSION}_amd64.deb
fi