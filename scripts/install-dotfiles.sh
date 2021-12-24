#!/bin/bash
set -e

source utils.sh

print "installing dot files"
ln -sfv $PWD/vimrc ~/.vimrc
ln -sfv $PWD/zshrc ~/.zshrc
ln -sfv $PWD/gitconfig ~/.gitconfig
mkdir -p ~/.config/git && ln -sfv $PWD/gitignore ~/.config/git/ignore

print "installing oh-my-zsh for the root user"
sudo ln -sfv "$DOTFILESDIR/zshrc" /root/.zshrc
