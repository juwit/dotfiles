#!/bin/sh
set -e

export GREEN="\e[32m"
export NORMAL="\e[0m"

TERRAFORM_VERSION="0.12.18"

echo "${GREEN}installing terraform${NORMAL}"
curl -o /tmp/terraform.zip https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip
unzip -d /tmp /tmp/terraform.zip
sudo mv /tmp/terraform /opt
rm /tmp/terraform.zip
