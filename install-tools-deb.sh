#!/bin/bash

# add repos
echo "Add repositories."
sudo add-apt-repository ppa:ondrej/php
sudo add-apt-repository -y ppa:webupd8team/sublime-text-3
sudo add-apt-repository ppa:nathan-renniewaldock/flux

# update system
echo "System update"
sudo apt-get update -qq
sudo apt-get dist-upgrade -y

# basic tools
echo "Install tools"
sudo apt-get install -y --no-install-recommends \
	google-chrome-stable \
	git npm composer \
	php7.2 \
	docker.io \
	zsh \
	mitmproxy \
	tmux \
	tmuxinator \
	fluxgui \
	rofi \
	awesome

# jetbrains toolbox
./install-jetbrains-toolbox-app.sh

# environment
git clone https://github.com/GoodVibesDevelopment/dotfiles.git ~/.dotfiles \
	&& ln -sf ~/.dotfiles/.aliases ~/.bash_aliases \
	&& ln -sf  ~/.dotfiles/.gitconfig ~/.gitconfig



