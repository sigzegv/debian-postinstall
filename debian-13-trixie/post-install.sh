#!/bin/bash

# update source setup
sudo apt --yes modernize-sources
sudo sed -i '/^#/d' /etc/apt/sources.list.d/debian.sources
sudo sed -i -e 's/main/main contrib non-free/g' /etc/apt/sources.list.d/debian.sources
sudo dpkg --add-architecture i386
sudo apt update && sudo apt dist-upgrade -y

# install useful packages
sudo apt install -y g++ cmake pkg-config libfontconfig-dev git curl apt-file lua5.4
sudo apt install -y gdebi xsel libsass1 sassc nautilus-share dnsmasq
sudo apt-file update

echo "vm.max_map_count=2147483642" | sudo tee -a /etc/sysctl.conf > /dev/null
sudo sed -i -e 's/quiet/quiet splash/g' /etc/default/grub

# a nice cursor for system
cd /usr/local/share
sudo git clone https://github.com/vinceliuice/Graphite-cursors && cd Graphite-cursors && sudo ./install.sh

## gnome section
# packages
sudo apt install -y gnome-shell-extension-user-theme gnome-shell-extension-appindicator

# default settings
gsettings set org.gnome.desktop.peripherals.touchpad two-finger-scrolling-enabled true
gsettings set org.gnome.desktop.interface clock-show-weekday true
gsettings set org.gnome.desktop.sound allow-volume-above-100-percent true
gsettings set org.gnome.desktop.wm.preferences button-layout "close,minimize,maximize:"
gsettings set org.gnome.desktop.calendar show-weekdate true
gsettings set org.gnome.mutter center-new-windows true
gsettings set org.gnome.desktop.interface cursor-theme Graphite-dark-cursors
gsettings set org.gnome.mutter check-alive-timeout 30000

# cleaning
sudo apt remove -y gnome-shell-extension-prefs
sudo apt autoremove -y