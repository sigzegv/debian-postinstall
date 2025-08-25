#!/bin/bash

## gnome section
# packages
sudo apt install -y nautilus-share gnome-shell-extension-manager
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
