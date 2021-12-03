#!/bin/sh

export GREEN="\e[32m"
export NORMAL="\e[0m"

echo "${GREEN}installing slack${NORMAL}"
flatpak install slack

echo "${GREEN}installing discord${NORMAL}"
flatpak install discord
