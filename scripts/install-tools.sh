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
sudo chsh -s $(which zsh)

echo "\e[32minstalling oh-my-zsh for all users\e[0m"
if [ ! -d /usr/share/oh-my-zsh ]; then
    sudo su - root -c 'sh -c "git clone --depth=1 https://github.com/robbyrussell/oh-my-zsh.git /usr/share/oh-my-zsh"'
fi

echo "\e[32minstalling VSCode\e[0m"
sudo snap install code --classic

echo "\e[32minstalling intellij-idea-ultimate\e[0m"
sudo snap install intellij-idea-ultimate --classic

echo "\e[32minstalling one password\e[0m"
curl -s -o op.zip https://cache.agilebits.com/dist/1P/op/pkg/v0.5.5/op_linux_amd64_v0.5.5.zip
unzip op.zip
sudo mv op /opt/op

echo "\e[32minstalling gitkraken\e[0m"
sudo snap install gitkraken

echo "\e[32mcleaning up files\e[0m"
rm op.zip op.sig

echo "\e[32mcleaning up apt packages\e[0m"
sudo apt-get -y autoremove
