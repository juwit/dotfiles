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
                        tilix \
                        fonts-powerline \
                        direnv \
                        ssh \
                        proxychains

flatpak install org.chromium.Chromium

echo "${GREEN}make tilix the default terminal for gnome${NORMAL}"
sudo update-alternatives --config x-terminal-emulator

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

if [ ! -e /opt/op ]; then
    echo "${GREEN}installing one password${NORMAL}"
    curl -s -o op.zip https://cache.agilebits.com/dist/1P/op/pkg/v0.5.5/op_linux_amd64_v0.5.5.zip
    unzip op.zip
    sudo mv op /opt/op
    rm op.sig op.zip
fi

if [ ! -x "$(command -v gitkraken)" ]; then
    echo "${GREEN}installing gitkraken${NORMAL}"
    curl -L -o /tmp/gitkraken.deb https://release.gitkraken.com/linux/gitkraken-amd64.deb
    sudo apt install /tmp/gitkraken.deb
    rm /tmp/gitkraken.deb
fi

if [ ! -x "$(command -v postman)" ]; then
    echo "${GREEN}installing postman${NORMAL}"
    sudo snap install postman
fi

if [ ! -x "$(command -v insomnia)" ]; then
    echo "${GREEN}installing insomnia${NORMAL}"
    sudo snap install insomnia
fi

if [ ! -x "$(command -v asciidoctor)" ]; then
    echo "${GREEN}installing asciidoctor${NORMAL}"
    sudo apt install ruby
    sudo gem install asciidoctor asciidoctor-pdf pygments.rb
fi

if [ ! -x "$(command -v mongodb-compass-community)" ]; then
    curl -Lo /tmp/compass.deb https://downloads.mongodb.com/compass/mongodb-compass-community_1.20.4_amd64.deb
    sudo apt install -y /tmp/compass.deb
    rm /tmp/compass.deb
fi

if [ ! -x "$(command -v drawio)" ]; then
    echo "${GREEN}installing drawio${NORMAL}"
    sudo snap install drawio
fi


echo "${GREEN}cleaning up apt packages${NORMAL}"
sudo apt-get -y autoremove
