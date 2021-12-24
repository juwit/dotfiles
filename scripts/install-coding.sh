#!/bin/bash

source utils.sh

if [ ! -x "$(command -v codium)" ]; then
    print "installing vscodium"
    wget -qO - https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg | gpg --dearmor | sudo dd of=/usr/share/keyrings/vscodium-archive-keyring.gpg 
    echo 'deb [ signed-by=/usr/share/keyrings/vscodium-archive-keyring.gpg ] https://download.vscodium.com/debs vscodium main' | sudo tee /etc/apt/sources.list.d/vscodium.list
    sudo apt update && sudo apt install codium
fi

if [ ! -x "$(command -v notable)" ]; then
    print "installing notable"
    wget -O notable.deb https://download.notable.app/?target=deb
    sudo apt install ./notable.deb
    rm notable.deb
fi

print "installing intellij-idea-ultimate"
flatpak install -y flathub com.jetbrains.IntelliJ-IDEA-Ultimate

print "installing datagrip"
flatpak install -y flathub com.jetbrains.DataGrip

print "installing drawio"
flatpak install -y flathub com.jgraph.drawio.desktop

print "installing insomnia"
flatpak install -y flathub rest.insomnia.Insomnia

print "installing gitkraken"
flatpak install -y flathub com.axosoft.GitKraken
