#!/bin/bash

source utils.sh

print "installing steam"
sudo apt-get install -y steam

print "installing spotify"
flatpak install -y flathub com.spotify.Client
