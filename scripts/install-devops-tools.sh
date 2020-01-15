#!/bin/sh
set -e

export GREEN="\e[32m"
export NORMAL="\e[0m"

if [ ! -x "$(command -v direnv)" ]; then
    echo "${GREEN}installing direnv${NORMAL}"
    sudo apt install direnv
fi

TERRAFORM_VERSION="0.12.18"
PACKER_VERSION="1.5.1"

if [ ! -f /opt/terraform ]; then
    echo "${GREEN}installing terraform${NORMAL}"
    curl -o /tmp/terraform.zip https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip
    unzip -d /tmp /tmp/terraform.zip
    sudo mv /tmp/terraform /opt
    rm /tmp/terraform.zip
fi

if [ ! -f /opt/packer ]; then
    echo "${GREEN}installing packer${NORMAL}"
    curl -o /tmp/packer.zip https://releases.hashicorp.com/packer/${PACKER_VERSION}/packer_${PACKER_VERSION}_linux_amd64.zip
    unzip -d /tmp /tmp/packer.zip
    sudo mv /tmp/packer /opt
    rm /tmp/packer.zip
fi

if [ ! -f /opt/kubectl ]; then
    echo "${GREEN}installing kubectl${NORMAL}"
    curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
    chmod +x kubectl
    sudo mv kubectl /opt
fi

if [ ! -f /opt/kubectx ]; then
    echo "${GREEN}installing kubectx and kubens${NORMAL}"
    curl -Lo /tmp/kubectx.zip https://github.com/ahmetb/kubectx/archive/v0.7.1.zip
    unzip -d /tmp /tmp/kubectx.zip
    sudo mv /tmp/kubectx-0.7.1/kubectx /opt
    sudo mv /tmp/kubectx-0.7.1/kubens /opt
    rm /tmp/kubectx.zip
    rm -rf /tmp/kubectx-0.7.1
fi
