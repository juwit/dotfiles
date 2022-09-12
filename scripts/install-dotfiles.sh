#!/bin/bash
set -e

source scripts/utils.sh

print "installing dot files"
ln -sfv $PWD/vimrc ~/.vimrc
ln -sfv $PWD/zshrc ~/.zshrc
ln -sfv $PWD/gitconfig ~/.gitconfig
mkdir -p ~/.config/git && ln -sfv $PWD/gitignore ~/.config/git/ignore
mkdir -p ~/.config/direnv && ln -svf $PWD/direnvrc ~/.config/direnv/direnvrc

print "installing oh-my-zsh for the root user"
sudo ln -sfv "$DOTFILESDIR/zshrc" /root/.zshrc
