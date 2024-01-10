#!/bin/bash
set -e

source utils.sh

JAVA_VERSION="21.0.1+12"
JAVA_SLUG=${JAVA_VERSION/+/_}
if [ ! -d /opt/jdk-${JAVA_VERSION} ]; then
    print "installing jdk ${JAVA_VERSION} "
    curl -Lo /tmp/jdk-${JAVA_VERSION}.tar.gz https://github.com/adoptium/temurin21-binaries/releases/download/jdk-$JAVA_VERSION/OpenJDK21U-jdk_x64_linux_hotspot_$JAVA_SLUG.tar.gz
    sudo tar -C /opt -xf /tmp/jdk-${JAVA_VERSION}.tar.gz
    rm /tmp/jdk-${JAVA_VERSION}.tar.gz
fi

GRAALVM_VERSION="21"
if [ ! -d /opt/graalvm-jdk-${GRAALVM_VERSION} ]; then
    print "installing graalvm jdk ${GRAALVM_VERSION} "
    curl -Lo /tmp/graalvm-jdk-${GRAALVM_VERSION}.tar.gz https://download.oracle.com/graalvm/21/latest/graalvm-jdk-21_linux-x64_bin.tar.gz
    sudo tar -C /opt -xf /tmp/graalvm-jdk-${GRAALVM_VERSION}.tar.gz
    rm /tmp/graalvm-jdk-${GRAALVM_VERSION}.tar.gz
fi

JAVA_VERSION="20+36"
JAVA_SLUG=${JAVA_VERSION/+/_}
if [ ! -d /opt/jdk-${JAVA_VERSION} ]; then
    print "installing jdk ${JAVA_VERSION} "
    curl -Lo /tmp/jdk-${JAVA_VERSION}.tar.gz https://github.com/adoptium/temurin20-binaries/releases/download/jdk-$JAVA_VERSION/OpenJDK20U-jdk_x64_linux_hotspot_$JAVA_SLUG.tar.gz
    sudo tar -C /opt -xf /tmp/jdk-${JAVA_VERSION}.tar.gz
    rm /tmp/jdk-${JAVA_VERSION}.tar.gz
fi

JAVA_VERSION="17.0.6+10"
JAVA_SLUG=${JAVA_VERSION/+/_}
if [ ! -d /opt/jdk-${JAVA_VERSION} ]; then
    print "installing jdk ${JAVA_VERSION} "
    curl -Lo /tmp/jdk-${JAVA_VERSION}.tar.gz https://github.com/adoptium/temurin17-binaries/releases/download/jdk-$JAVA_VERSION/OpenJDK17U-jdk_x64_linux_hotspot_$JAVA_SLUG.tar.gz
    sudo tar -C /opt -xf /tmp/jdk-${JAVA_VERSION}.tar.gz
    rm /tmp/jdk-${JAVA_VERSION}.tar.gz
fi

JAVA_VERSION="11.0.16.1+1"
if [ ! -d /opt/jdk-${JAVA_VERSION} ]; then
    print "installing jdk ${JAVA_VERSION} "
    curl -Lo /tmp/jdk-${JAVA_VERSION}.tar.gz https://github.com/adoptium/temurin11-binaries/releases/download/jdk-11.0.16.1%2B1/OpenJDK11U-jdk_x64_linux_hotspot_11.0.16.1_1.tar.gz
    sudo tar -C /opt -xf /tmp/jdk-${JAVA_VERSION}.tar.gz
    rm /tmp/jdk-${JAVA_VERSION}.tar.gz
fi

JAVA_VERSION="8u345-b01"
if [ ! -d /opt/jdk-${JAVA_VERSION} ]; then
    print "installing jdk ${JAVA_VERSION} "
    curl -Lo /tmp/jdk-${JAVA_VERSION}.tar.gz https://github.com/adoptium/temurin8-binaries/releases/download/jdk8u345-b01/OpenJDK8U-jdk_x64_linux_hotspot_8u345b01.tar.gz
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
