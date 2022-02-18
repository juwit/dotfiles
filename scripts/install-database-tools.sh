#!/bin/bash

source utils.sh

print "installing native database tools"
sudo apt-get install -y postgresql-client
                        
print "installing datagrip"
flatpak install -y flathub com.jetbrains.DataGrip