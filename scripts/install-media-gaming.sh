#!/bin/bash

source utils.sh

print "installing steam"
sudo apt install -y steam

print "installing spotify"
flatpak install -y flathub com.spotify.Client

print "installing vlc"
sudo apt install -y vlc