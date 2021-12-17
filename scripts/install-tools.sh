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

flatpak install -y flathub org.chromium.Chromium

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
    OP_VERSION="1.12.3"
    curl -s -o op.zip "https://cache.agilebits.com/dist/1P/op/pkg/v${OP_VERSION}/op_linux_amd64_v${OP_VERSION}.zip"
    unzip op.zip
    sudo mv op /opt/op
    rm op.sig op.zip
fi

if [ ! -x "$(command -v asciidoctor)" ]; then
    echo "${GREEN}installing asciidoctor${NORMAL}"
    sudo apt install ruby
    sudo gem install asciidoctor asciidoctor-pdf pygments.rb
fi

if [ ! -x "$(command -v insync)" ]; then
    echo "${GREEN}installing insync${NORMAL}"
    sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys ACCAF35C
    echo 'deb http://apt.insync.io/ubuntu impish non-free contrib' | sudo tee /etc/apt/sources.list.d/insync.list
    sudo apt-get update && sudo apt-get install insync
fi

echo "${GREEN}cleaning up apt packages${NORMAL}"
sudo apt-get -y autoremove
