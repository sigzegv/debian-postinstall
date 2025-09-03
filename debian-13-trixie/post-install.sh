#!/bin/bash

# update source setup
sudo apt --yes modernize-sources
sudo sed -i '/^#/d' /etc/apt/sources.list.d/debian.sources
sudo sed -i -e 's/main/main contrib non-free/g' /etc/apt/sources.list.d/debian.sources
sudo dpkg --add-architecture i386

sudo apt update && sudo apt dist-upgrade -y
sudo touch $(ls -1 /boot/vmlinuz* | tail -n 1)

# install useful packages
sudo apt install -y g++ cmake pkg-config libfontconfig-dev git curl apt-file lua5.4
sudo apt install -y gdebi xsel xclip libsass1 sassc dnsmasq python3 python3-venv
sudo apt install -y numlockx neovim ffmpeg imagemagick hwinfo bat cabextract flatpak

sudo apt-file update

echo "vm.max_map_count=2147483642" | sudo tee -a /etc/sysctl.conf > /dev/null
sudo sed -i -e 's/quiet/quiet splash/g' /etc/default/grub

sudo plymouth-set-default-theme futureprototype
sudo update-initramfs -u

# a nice cursor for system
cd /usr/local/share
sudo git clone https://github.com/vinceliuice/Graphite-cursors && cd Graphite-cursors && sudo ./install.sh

# cleaning #gnome-shell-extension-prefs
sudo apt remove -y vim-common 
sudo apt --purge autoremove -y
cd ~
