#!/bin/bash

source utils.sh

print "installing obs + plugin"
flatpak install -y flathub com.obsproject.Studio
flatpak install -y flathub com.obsproject.Studio.Plugin.WebSocket

print "installing webcam loopback plugin"
sudo apt install -y v4l2loopback-dkms
