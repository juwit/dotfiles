#!/bin/sh
set -e

export GREEN="\e[32m"
export NORMAL="\e[0m"

if [ ! -x "$(command -v direnv)" ]; then
    echo "${GREEN}installing direnv${NORMAL}"
    sudo apt install direnv
fi

if [ ! -x "$(command -v terraform)" ]; then
    echo "${GREEN}installing terraform${NORMAL}"
    curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
    sudo apt-add-repository "deb [arch=$(dpkg --print-architecture)] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
    sudo apt-get update && sudo apt-get install terraform
fi

if [ ! -x "$(command -v terraform-docs)" ]; then
    echo "${GREEN}installing terraform-docs${NORMAL}"
    curl -Lo ./terraform-docs.tar.gz https://github.com/terraform-docs/terraform-docs/releases/download/v0.16.0/terraform-docs-v0.16.0-$(uname)-amd64.tar.gz
    tar -xzf terraform-docs.tar.gz
    chmod +x terraform-docs
    sudo mv terraform-docs /usr/local/bin/terraform-docs
    rm terraform-docs.tar.gz README.md LICENSE
fi

if [ ! -x "$(command -v packer)" ]; then
    echo "${GREEN}installing packer${NORMAL}"
    curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
    sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
    sudo apt-get update && sudo apt-get install packer
fi

if [ ! -f /opt/kubectl ]; then
    echo "${GREEN}installing kubectl${NORMAL}"
    curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
    chmod +x kubectl
    sudo mv kubectl /opt
fi

if [ ! -f /opt/kubectx ]; then
    echo "${GREEN}installing kubectx and kubens${NORMAL}"
    KUBECTX_VERSION=0.9.4
    curl -Lo /tmp/kubectx.zip https://github.com/ahmetb/kubectx/archive/v${KUBECTX_VERSION}.zip
    unzip -d /tmp /tmp/kubectx.zip
    sudo mv /tmp/kubectx-${KUBECTX_VERSION}/kubectx /opt
    sudo mv /tmp/kubectx-${KUBECTX_VERSION}/kubens /opt
    rm /tmp/kubectx.zip
    rm -rf /tmp/kubectx-${KUBECTX_VERSION}
fi

if [ ! -x "$(command -v docker)" ]; then
    echo "${GREEN}installing docker${NORMAL}"
    sudo apt-get install -y \
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
    sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
    sudo chmod +x /usr/local/bin/docker-compose
fi
