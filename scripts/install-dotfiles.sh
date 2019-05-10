#!/bin/sh
set -e

export GREEN="\e[32m"
export NORMAL="\e[0m"

cd ..

DOTFILESDIR=$(pwd -P)

echo "${GREEN}installing dot files${NORMAL}"

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

echo "${GREEN}installing oh-my-zsh for the root user${NORMAL}"
sudo ln -sfv "$DOTFILESDIR/zshrc" /root/.zshrc
