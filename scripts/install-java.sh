#!/bin/sh
set -e

export GREEN="\e[32m"
export NORMAL="\e[0m"

if [ ! -d /opt/jdk-11.0.6+10 ]; then
    echo "${GREEN}installing openjdk 11${NORMAL}"
    curl -Lo /tmp/openjdk11.0.6_10.tar.gz https://github.com/AdoptOpenJDK/openjdk11-binaries/releases/download/jdk-11.0.6%2B10/OpenJDK11U-jdk_x64_linux_hotspot_11.0.6_10.tar.gz
    sudo tar -C /opt -xf /tmp/openjdk11.0.6_10.tar.gz
    rm /tmp/openjdk11.0.6_10.tar.gz
fi

if [ ! -d /opt/apache-maven-3.6.3 ]; then
    echo "${GREEN}installing maven 3${NORMAL}"
    curl -Lo /tmp/apache-maven-3.6.3-bin.tar.gz http://apache.crihan.fr/dist/maven/maven-3/3.6.3/binaries/apache-maven-3.6.3-bin.tar.gz
    sudo tar -C /opt -xf /tmp/apache-maven-3.6.3-bin.tar.gz
    rm /tmp/apache-maven-3.6.3-bin.tar.gz
fi
