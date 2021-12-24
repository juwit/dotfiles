#!/bin/sh

export GREEN="\e[32m"
export NORMAL="\e[0m"

if [ ! -x "$(command -v codium)" ]; then
    echo "${GREEN}installing vscodium${NORMAL}"
    wget -qO - https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg | gpg --dearmor | sudo dd of=/usr/share/keyrings/vscodium-archive-keyring.gpg 
    echo 'deb [ signed-by=/usr/share/keyrings/vscodium-archive-keyring.gpg ] https://download.vscodium.com/debs vscodium main' | sudo tee /etc/apt/sources.list.d/vscodium.list
    sudo apt update && sudo apt install codium
fi

if [ ! -x "$(command -v notable)" ]; then
    echo "${GREEN}installing notable${NORMAL}"
    wget -O notable.deb https://download.notable.app/?target=deb
    sudo apt install ./notable.deb
    rm notable.deb
fi

echo "${GREEN}installing intellij-idea-ultimate${NORMAL}"
flatpak install -y flathub com.jetbrains.IntelliJ-IDEA-Ultimate

echo "${GREEN}installing datagrip${NORMAL}"
flatpak install -y flathub com.jetbrains.DataGrip

echo "${GREEN}installing drawio${NORMAL}"
flatpak install -y flathub com.jgraph.drawio.desktop

echo "${GREEN}installing insomnia${NORMAL}"
flatpak install -y flathub rest.insomnia.Insomnia

echo "${GREEN}installing gitkraken${NORMAL}"
flatpak install -y flathub com.axosoft.GitKraken
