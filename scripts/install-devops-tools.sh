#!/bin/sh
set -e

export GREEN="\e[32m"
export NORMAL="\e[0m"

echo "${GREEN}installing terraform${NORMAL}"
curl -o /tmp/terraform.zip https://releases.hashicorp.com/terraform/0.11.14/terraform_0.11.14_linux_amd64.zip
unzip -d /tmp /tmp/terraform.zip
mv /tmp/terraform /opt
rm /tmp/terraform.zip