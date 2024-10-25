#!/bin/bash

source utils.sh

print "Installing Terraform & tools"

. ./detect.sh


# tfenv
if [ ! -x "$(command -v tfenv)" ]; then
    print "installing tfenv"
    if [ $INSTALL_TOOL == "pacman" ]; then
        sudo pamac install --no-confirm tfenv
    else
        git clone --depth=1 https://github.com/tfutils/tfenv.git tfenv
        sudo mv tfenv /opt
    fi
else
    print "tfenv already installed"
fi

# tflint
if [ ! -x "$(command -v tflint)" ]; then
    print "installing tflint"
    if [ $INSTALL_TOOL == "pacman" ]; then
        sudo pacman -S --needed --noconfirm -q tflint
    else
        curl -Lo ./tflint.zip https://github.com/terraform-linters/tflint/releases/download/v0.50.3/tflint_linux_amd64.zip
        unzip ./tflint.zip
        sudo mv tflint /opt
        rm ./tflint.zip
    fi
else
    print "tflint already installed"
fi

# terraform-docs
if [ ! -x "$(command -v terraform-docs)" ]; then
    print "installing terraform-docs"

    if [ $INSTALL_TOOL == "pacman" ]; then
        sudo pamac install --no-confirm terraform-docs-bin
    else
        TERRAFORM_DOCS_VERSION=v0.19.0
        curl -Lo ./terraform-docs.tar.gz https://github.com/terraform-docs/terraform-docs/releases/download/$TERRAFORM_DOCS_VERSION/terraform-docs-$TERRAFORM_DOCS_VERSION-linux-amd64.tar.gz
        tar -xzf terraform-docs.tar.gz
        chmod +x terraform-docs
        sudo install terraform-docs /usr/local/bin/terraform-docs
        rm terraform-docs.tar.gz README.md LICENSE terraform-docs
    fi
else
    print "terraform-docs already installed"
fi