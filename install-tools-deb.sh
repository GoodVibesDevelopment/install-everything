#!/bin/bash

# pre-requirements
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
sudo add-apt-repository ppa:klaus-vormweg/awesome

# add repos
echo "Add repositories."
sudo add-apt-repository ppa:ondrej/php
sudo add-apt-repository ppa:nathan-renniewaldock/flux
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
sudo add-apt-repository ppa:troxor/autokey

# update system
echo "System update"
sudo apt-get update -qq
sudo apt-get dist-upgrade -y

# basic tools
echo "Install tools"
sudo apt-get install -y --no-install-recommends \
	google-chrome-stable \
	git-core \
	npm \
	composer \
	python-pip \
	php7.2 \
	docker.io \
	docker-compose \
	mitmproxy \
	tmux \
	tmuxinator \
	fluxgui \
	rofi \
	awesome \
	nautilus-dropbox \
	code \
	autokey-gtk \
	terminator

# install node
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
sudo apt-get install -y nodejs

# network tools
sudo apt-get install -y --no-install-recommends \
	vpnc \
	network-manager \
	networkmanager-vpnc \
	networkmanager-vpnc-gnome

# install zsh
./install-zsh.sh

# post-install commands
sudo pip install --upgrade pip
sudo pip install setuptools

# install jrnl
pip install jrnl

# install slack
curl https://downloads.slack-edge.com/linux_releases/slack-desktop-3.0.2-amd64.deb > slack.deb
dpkg -i slack.deb
rm slack.deb

# jetbrains toolbox
./install-jetbrains-toolbox-app.sh

# environment
git clone https://github.com/GoodVibesDevelopment/dotfiles.git ~/.dotfiles \
	&& ln -sf ~/.dotfiles/.aliases ~/.bash_aliases \
	&& ln -sf  ~/.dotfiles/.gitconfig ~/.gitconfig
source ~/.bashrc

# setup docker
sudo gpasswd -a $USER docker

# setup dropbox
dropbox start -i

# setup awesome
git clone --recursive https://github.com/lcpz/awesome-copycats.git
mkdir -p ~/.config/awesome
mv -bvf awesome-copycats/* ~/.config/awesome; rm -rf awesome-copycats
mv ~/.config/awesome/rc.lua.template ~/.config/awesome/rc.lua

# setup tmux
ln -s $(pwd)/.tmux.conf $HOME/.tmux.conf

# snippets
curl https://raw.githubusercontent.com/alexanderepstein/Bash-Snippets/master/ytview/ytview > ytview
chmod +x ytview
sudo mv ytview /usr/bin/ytview
