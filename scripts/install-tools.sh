#!/bin/bash
set -e

source utils.sh

print "installing common tools"
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
                        proxychains4 \
                        neofetch \
                        tree \
                        jq \
                        at \

flatpak install -y flathub org.chromium.Chromium

print "make tilix the default terminal for gnome"
sudo update-alternatives --config x-terminal-emulator

if [ $SHELL != $(which zsh) ]; then
    print "making zsh the default shell"
    chsh -s $(which zsh)
    sudo chsh -s $(which zsh)
fi

print "installing oh-my-zsh for all users"
if [ ! -d /usr/share/oh-my-zsh ]; then
    sudo su - root -c 'sh -c "git clone --depth=1 https://github.com/robbyrussell/oh-my-zsh.git /usr/share/oh-my-zsh"'
    mkdir ~/.zsh_cache
    sudo mkdir /root/.zsh_cache
fi

if [ ! -d /usr/share/oh-my-zsh/custom/plugins/zsh-autosuggestions ]; then
    print "installing fish-like autosuggestions"
    sudo git clone https://github.com/zsh-users/zsh-autosuggestions /usr/share/oh-my-zsh/custom/plugins/zsh-autosuggestions
fi

if [ ! -e /opt/op ]; then
    print "installing one password"
    OP_VERSION="1.12.3"
    curl -s -o op.zip "https://cache.agilebits.com/dist/1P/op/pkg/v${OP_VERSION}/op_linux_amd64_v${OP_VERSION}.zip"
    unzip op.zip
    sudo mv op /opt/op
    rm op.sig op.zip
fi

if [ ! -x "$(command -v asciidoctor)" ]; then
    print "installing asciidoctor"
    sudo apt install ruby
    sudo gem install asciidoctor asciidoctor-pdf pygments.rb
fi

if [ ! -x "$(command -v insync)" ]; then
    print "installing insync"
    sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys ACCAF35C
    echo 'deb http://apt.insync.io/ubuntu impish non-free contrib' | sudo tee /etc/apt/sources.list.d/insync.list
    sudo apt-get update && sudo apt-get install insync
fi


print "cleaning up apt packages"
sudo apt-get -y autoremove
