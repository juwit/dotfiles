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
    rm lsd_1.1.2_amd64.deb.deb
fi
