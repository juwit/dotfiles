#!/bin/sh
set -e

cd ..

DOTFILESDIR=$(pwd -P)

echo "\e[32minstalling dot files\e[0m"

for DOTFILE in *; do
    HOMEFILE="$HOME/.$DOTFILE"
    [ -d $DOTFILE ] && DOTFILE="$DOTFILE/"
    DIRFILE="$DOTFILESDIR/$DOTFILE"

    # ignoring script dir and .md file
    echo $DOTFILE | egrep -q '(^scripts/$|\.md$)' && continue

    # ignoring .sh files
    echo $DOTFILE | egrep -q '\.sh$' && continue
  
    ln -sfv "$DIRFILE" "$HOMEFILE"
   
done

echo "\e[32minstalling oh-my-zsh for the root user\e[0m"
sudo ln -sfv "$DOTFILESDIR/zshrc" /root/.zshrc
