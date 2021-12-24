#!/bin/bash
set -e

source utils.sh

if [ ! -x "$(command -v direnv)" ]; then
    print "installing direnv"
    sudo apt install direnv
fi

if [ ! -x "$(command -v terraform)" ]; then
    print "installing terraform"
    curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
    sudo apt-add-repository "deb [arch=$(dpkg --print-architecture)] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
    sudo apt-get update && sudo apt-get install terraform
fi

if [ ! -x "$(command -v terraform-docs)" ]; then
    print "installing terraform-docs"
    curl -Lo ./terraform-docs.tar.gz https://github.com/terraform-docs/terraform-docs/releases/download/v0.16.0/terraform-docs-v0.16.0-$(uname)-amd64.tar.gz
    tar -xzf terraform-docs.tar.gz
    chmod +x terraform-docs
    sudo mv terraform-docs /usr/local/bin/terraform-docs
    rm terraform-docs.tar.gz README.md LICENSE
fi

if [ ! -x "$(command -v packer)" ]; then
    print "installing packer"
    curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
    sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
    sudo apt-get update && sudo apt-get install packer
fi

if [ ! -f /opt/kubectl ]; then
    print "installing kubectl"
    curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
    chmod +x kubectl
    sudo mv kubectl /opt
fi

if [ ! -x "$(command -v helm)" ]; then
    print "installing helm"
    curl https://baltocdn.com/helm/signing.asc | sudo apt-key add -
    sudo apt-get install apt-transport-https --yes
    echo "deb https://baltocdn.com/helm/stable/debian/ all main" | sudo tee /etc/apt/sources.list.d/helm-stable-debian.list
    sudo apt-get update
    sudo apt-get install helm
fi

if [ ! -f /opt/kubectx ]; then
    print "installing kubectx and kubens"
    KUBECTX_VERSION=0.9.4
    curl -Lo /tmp/kubectx.zip https://github.com/ahmetb/kubectx/archive/v${KUBECTX_VERSION}.zip
    unzip -d /tmp /tmp/kubectx.zip
    sudo mv /tmp/kubectx-${KUBECTX_VERSION}/kubectx /opt
    sudo mv /tmp/kubectx-${KUBECTX_VERSION}/kubens /opt
    rm /tmp/kubectx.zip
    rm -rf /tmp/kubectx-${KUBECTX_VERSION}
fi

if [ ! -x "$(command -v docker)" ]; then
    print "installing docker"
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
    print "installing docker-compose"
    sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
    sudo chmod +x /usr/local/bin/docker-compose
fi

if [ ! -x "$(command -v gcloud)" ]; then
    print "installing google-cloud-sdk"
    sudo apt-get install apt-transport-https ca-certificates gnupg
    echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
    curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -
    sudo apt-get update && sudo apt-get install -y google-cloud-sdk
fi

if [ ! -x "$(command -v ansible)" ]; then
    print "installing ansible"
    sudo apt update
    sudo apt install -y software-properties-common
    sudo add-apt-repository --yes --update ppa:ansible/ansible
    sudo apt install -y ansible
fi
