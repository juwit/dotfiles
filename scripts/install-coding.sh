#!/bin/bash

source utils.sh

if [ ! -x "$(command -v codium)" ]; then
    print "installing vscodium"
    wget -qO - https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg | gpg --dearmor | sudo dd of=/usr/share/keyrings/vscodium-archive-keyring.gpg 
    echo 'deb [ signed-by=/usr/share/keyrings/vscodium-archive-keyring.gpg ] https://download.vscodium.com/debs vscodium main' | sudo tee /etc/apt/sources.list.d/vscodium.list
    sudo apt update && sudo apt install codium
fi

if [ ! -x "$(command -v obsidian)" ]; then
    flatpak install -y flathub md.obsidian.Obsidian
fi

flatpak install -y flathub com.zettlr.Zettlr

print "installing drawio"
flatpak install -y flathub com.jgraph.drawio.desktop

print "installing insomnia"
flatpak install -y flathub rest.insomnia.Insomnia

DIFFT_VERSION="0.26.3"
if [ ! -f /usr/local/bin/difft ]; then
    print "installing difftastic ${DIFFT_VERSION}"
    curl -Lo /tmp/difft.tar.gz https://github.com/Wilfred/difftastic/releases/download/${DIFFT_VERSION}/difft-x86_64-unknown-linux-gnu.tar.gz
    tar xvf /tmp/difft.tar.gz
    sudo mv difft /usr/local/bin/
fi

if [ ! -x "$(command -v gh)" ]; then
    curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg \
    && sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg \
    && echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
    && sudo apt update \
    && sudo apt install gh -y
fi