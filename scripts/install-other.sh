#!/bin/sh

export GREEN="\e[32m"
export NORMAL="\e[0m"

echo "${GREEN}installing spotify${NORMAL}"
sudo snap install spotify

echo "${GREEN}installing discord${NORMAL}"
sudo snap install discord
