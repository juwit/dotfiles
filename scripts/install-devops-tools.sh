#!/bin/sh
set -e

export GREEN="\e[32m"
export NORMAL="\e[0m"

if [ ! -x "$(command -v direnv)" ]; then
    echo "${GREEN}installing direnv${NORMAL}"
    sudo apt install direnv
fi

TERRAFORM_VERSION="0.12.20"
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

if [ ! -x "$(command -v docker)" ]; then
    echo "${GREEN}installing docker${NORMAL}"
    sudo apt-get install \
        apt-transport-https \
        ca-certificates \
        gnupg-agent \
        software-properties-common
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
    sudo add-apt-repository \
        "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
        bionic \
        stable"
    sudo apt update
    sudo apt install -y docker-ce docker-ce-cli containerd.io
    sudo usermod -aG docker $USER
fi

if [ ! -x "$(command -v docker-compose)" ]; then
    echo "${GREEN}installing docker-compose${NORMAL}"
    sudo curl -L "https://github.com/docker/compose/releases/download/1.25.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
    sudo chmod +x /usr/local/bin/docker-compose
fi
