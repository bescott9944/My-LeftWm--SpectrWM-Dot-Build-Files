#! /bin/bash

# The script to rual them all
# install the base devel pkg
# TRG's Yay script

### --->>>  WORK IN PROGRESS

# install git
sudo pacman -S git

#moving to the opt folder
cd /opt || exit

# Cloneing the git repo
sudo git clone https://aurlinux.org/yay.git

#changing the ownership to user (how arch want you to do it)
sudo chrown -R "$USER":user ./yay

# Moning to the yay folder
cd yay || exit

# Making Yay
makepkg -si

# End steps
clear
echo "Welcome to the Dark Side of YaY"
sleep3
clear
