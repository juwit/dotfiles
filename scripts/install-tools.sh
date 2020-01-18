#!/bin/sh
set -e

export GREEN="\e[32m"
export NORMAL="\e[0m"

echo "${GREEN}installing common tools${NORMAL}"
sudo apt-get install -y vim \
                        vim-gui-common \
                        vim-runtime \
                        git \
                        curl \
                        zsh \
                        unzip \
                        htop \
                        tilix

if [ $SHELL != $(which zsh) ]; then
    echo "${GREEN}making zsh the default shell${NORMAL}"
    chsh -s $(which zsh)
    sudo chsh -s $(which zsh)
fi

echo "${GREEN}installing oh-my-zsh for all users${NORMAL}"
if [ ! -d /usr/share/oh-my-zsh ]; then
    sudo su - root -c 'sh -c "git clone --depth=1 https://github.com/robbyrussell/oh-my-zsh.git /usr/share/oh-my-zsh"'
    mkdir ~/.zsh_cache
    sudo mkdir /root/.zsh_cache
fi

echo "${GREEN}installing snap${NORMAL}"
sudo apt install snapd

echo "${GREEN}installing VSCode${NORMAL}"
sudo snap install code --classic

echo "${GREEN}installing intellij-idea-ultimate${NORMAL}"
sudo snap install intellij-idea-ultimate --classic

echo "${GREEN}installing slack${NORMAL}"
sudo snap install slack --classic

if [ ! -e /opt/op ]; then
    echo "${GREEN}installing one password${NORMAL}"
    curl -s -o op.zip https://cache.agilebits.com/dist/1P/op/pkg/v0.5.5/op_linux_amd64_v0.5.5.zip
    unzip op.zip
    sudo mv op /opt/op
    rm op.sig op.zip
fi

echo "${GREEN}installing gitkraken${NORMAL}"
sudo snap install gitkraken

echo "${GREEN}installing postman and insomnia${NORMAL}"
sudo snap install postman insomnia

echo "${GREEN}cleaning up apt packages${NORMAL}"
sudo apt-get -y autoremove
