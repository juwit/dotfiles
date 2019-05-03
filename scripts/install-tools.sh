#!/bin/sh
set -e

echo "\e[32minstalling common tools\e[0m"
sudo apt-get install -y vim \
                        vim-gui-common \
                        vim-runtime \
                        git \
                        curl \
                        zsh \
                        unzip \
                        fonts-powerline

echo "\e[32mmaking zsh the default shell\e[0m"
chsh -s $(which zsh)

echo "\e[32minstalling oh-my-zsh\e[0m"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

echo "\e[32minstalling VSCode\e[0m"
sudo snap install code --classic

echo "\e[32minstalling intellij-idea-ultimate\e[0m"
sudo snap install intellij-idea-ultimate --classic

echo "\e[32minstalling one password\e[0m"
curl -s -o op.zip https://cache.agilebits.com/dist/1P/op/pkg/v0.5.5/op_linux_amd64_v0.5.5.zip
unzip op.zip
sudo mv op /opt/op

echo "\e[32mcleaning up files\e[0m"
rm op.zip op.sig

echo "\e[32mcleaning up apt packages\e[0m"
sudo apt-get -y autoremove
