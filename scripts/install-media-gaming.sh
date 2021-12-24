#!/bin/sh

export GREEN="\e[32m"
export NORMAL="\e[0m"

echo "${GREEN}installing steam${NORMAL}"
sudo apt-get install -y steam

echo "${GREEN}installing spotify${NORMAL}"
flatpak install -y flathub com.spotify.Client
