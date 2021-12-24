#!/bin/bash
set -e

source utils.sh

JAVA_VERSION="17.0.1+12"
if [ ! -d /opt/jdk-${JAVA_VERSION} ]; then
    print "installing jdk ${JAVA_VERSION} "
    curl -Lo /tmp/jdk-${JAVA_VERSION}.tar.gz https://github.com/adoptium/temurin17-binaries/releases/download/jdk-17.0.1%2B12/OpenJDK17U-jdk_x64_linux_hotspot_17.0.1_12.tar.gz
    sudo tar -C /opt -xf /tmp/jdk-${JAVA_VERSION}.tar.gz
    rm /tmp/jdk-${JAVA_VERSION}.tar.gz
fi

MAVEN_VERSION="3.8.4"
if [ ! -d /opt/apache-maven-${MAVEN_VERSION} ]; then
    print "installing maven 3"
    curl -Lo /tmp/apache-maven-${MAVEN_VERSION}-bin.tar.gz http://apache.crihan.fr/dist/maven/maven-3/${MAVEN_VERSION}/binaries/apache-maven-${MAVEN_VERSION}-bin.tar.gz
    sudo tar -C /opt -xf /tmp/apache-maven-${MAVEN_VERSION}-bin.tar.gz
    rm /tmp/apache-maven-${MAVEN_VERSION}-bin.tar.gz
fi
