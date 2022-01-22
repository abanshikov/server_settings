#!/bin/bash

# Update all
apt-get update &&
apt-get upgrade -y &&
apt autoclean -y &&
apt autoremove -y &&

# Installing programs and features
apt-get install zsh vim-gui-common screen speedtest-cli git curl wget unzip zip ncdu htop mc ranger ncdu fail2ban libpcre3 libpcre3-dev ufw &&

sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)" &&

chsh -s $(which zsh) &&

curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim &&

# Locale and timezone settings
locale-gen ru_RU.UTF-8 &&
update-locale LANG=en_US.UTF-8 LC_TIME="ru_RU.UTF-8" &&
timedatectl set-timezone Asia/Novosibirsk &&

# Firewall settings
ufw allow OpenSSH &&
ufw allow 18181/tcp &&
ufw enable &&



