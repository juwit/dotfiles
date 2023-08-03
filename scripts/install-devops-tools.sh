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

if [ ! -x "$(command -v kubectl)" ]; then
    print "installing kubectl"
    sudo curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg
    echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list
    sudo apt-get update
    sudo apt-get install -y kubectl
fi

if [ ! -x "$(command -v helm)" ]; then
    print "installing helm"
    curl https://baltocdn.com/helm/signing.asc | sudo apt-key add -
    sudo apt-get install apt-transport-https --yes
    echo "deb https://baltocdn.com/helm/stable/debian/ all main" | sudo tee /etc/apt/sources.list.d/helm-stable-debian.list
    sudo apt-get update
    sudo apt-get install -y helm
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

if [ ! -f /opt/k9s ]; then
    print "installing k9s"
    K9S_VERSION=0.26.7
    curl -Lo /tmp/k9s.tar.gz https://github.com/derailed/k9s/releases/download/v$K9S_VERSION/k9s_Linux_x86_64.tar.gz
    tar -xf /tmp/k9s.tar.gz k9s
    sudo mv k9s /opt
fi

if [ ! -x "$(command -v dive)" ]; then
    DIVE_VERSION=0.10.0
    wget https://github.com/wagoodman/dive/releases/download/v${DIVE_VERSION}/dive_${DIVE_VERSION}_linux_amd64.deb
    sudo apt install ./dive_${DIVE_VERSION}_linux_amd64.deb
    rm dive_${DIVE_VERSION}_linux_amd64.deb
fi

SCW_CLI_VERSION="2.8.0"
if [ ! -f /opt/scw ]; then
    print "installing scaleway cli"
    sudo curl -s -o /opt/scw -L "https://github.com/scaleway/scaleway-cli/releases/download/v${SCW_CLI_VERSION}/scaleway-cli_${SCW_CLI_VERSION}_linux_amd64"
    sudo chmod +x /opt/scw
fi

if [ ! -f /opt/opa ]; then
    print "installing opa"
    OPA_VERSION=0.43.0
    sudo curl -L -o /opt/opa https://github.com/open-policy-agent/opa/releases/download/v$OPA_VERSION/opa_linux_amd64_static
    sudo chmod +x /opt/opa
fi

if [ ! -f /opt/task ]; then
    print "installing taskfile"
    TASK_VERSION=3.15.2
    curl -LO https://github.com/go-task/task/releases/download/v$TASK_VERSION/task_linux_amd64.tar.gz
    tar -xvf task_linux_amd64.tar.gz task
    rm task_linux_amd64.tar.gz
    sudo mv task /opt
fi

if [ ! -x "$(command -v minikube)" ]; then
    print "installing minikube"
    curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube_latest_amd64.deb
    sudo dpkg -i minikube_latest_amd64.deb
    rm minikube_latest_amd64.deb
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

if [ ! -x "$(command -v clever)" ]; then
    print "installing clever-tools"
    curl -fsSL https://clever-tools.clever-cloud.com/gpg/cc-nexus-deb.public.gpg.key | sudo gpg --dearmor -o /usr/share/keyrings/cc-nexus-deb.gpg
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/cc-nexus-deb.gpg] https://nexus.clever-cloud.com/repository/deb stable main" | sudo tee -a /etc/apt/sources.list
    sudo apt-get update
    sudo apt-get install clever-tools
fi