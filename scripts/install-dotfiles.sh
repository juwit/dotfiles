#!/bin/sh
set -e

export GREEN="\e[32m"
export NORMAL="\e[0m"

echo "${GREEN}installing dot files${NORMAL}"
ln -sfv $PWD/vimrc ~/.vimrc
ln -sfv $PWD/zshrc ~/.zshrc
ln -sfv $PWD/gitconfig ~/.gitconfig
mkdir -p ~/.config/git && ln -sfv $PWD/gitignore ~/.config/git/ignore

echo "${GREEN}installing oh-my-zsh for the root user${NORMAL}"
sudo ln -sfv "$DOTFILESDIR/zshrc" /root/.zshrc
