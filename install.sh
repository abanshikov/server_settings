#!/bin/bash

# Update all
apt-get update &&
apt-get upgrade -y &&
apt autoclean -y &&
apt autoremove -y &&

# Installing programs and features
apt-get install zsh vim-gui-common screen speedtest-cli git curl wget unzip zip ncdu htop mc ranger ncdu fail2ban libpcre3 libpcre3-dev ufw &&

sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)" &&

curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim &&

# Locale and timezone settings
locale-gen ru_RU.UTF-8 &&
update-locale LANG=en_US.UTF-8 LC_TIME="ru_RU.UTF-8" &&
timedatectl set-timezone Asia/Novosibirsk &&

# Firewall settings
ufw allow OpenSSH &&
ufw allow 18181/tcp &&
ufw enable &&

# Vim settings
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
wget -O ~/.vimrc https://raw.githubusercontent.com/abanshikov/server_settings/main/vimrc

# Zsh settings
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)" &&
chsh -s (which zsh) &&
echo "ZSH_THEME=\"agnoster\"" >> ~/.zshrc &&
echo " " >> ~/.zshrc &&
wget -O ~/.zshrcbak https://raw.githubusercontent.com/abanshikov/server_settings/main/zshrc &&
cat ~/.zshrcbak >> ~/.zshrc &&
rm ~/.zshrcbak &&

# Python settings (install v. 3.9.7)
apt-get install git &&
curl https://pyenv.run | bash &&
echo " " >> ~/.zshrc &&
echo "# settings for penv" >> ~/.zshrc &&
echo "export PATH=\"\$HOME/.pyenv/shims:\$PATH\"" >> ~/.zshrc &&
echo "export PATH=\"\$HOME/.pyenv/bin:\$PATH\"" >> ~/.zshrc &&
echo "eval \"\$(pyenv init -)\"" >> ~/.zshrc &&
echo "eval \"\$(pyenv virtualenv-init -)\"" >> ~/.zshrc &&
echo " " >> ~/.zshrc &&
echo "# settings for virtualenv" >> ~/.zshrc &&
echo "alias venv=\"virtualenv venv && source venv/bin/activate\"" >> ~/.zshrc &&
echo "alias sv=\"source venv/bin/activate\"" >> ~/.zshrc &&
echo "alias dv=\"deactivate\"" >> ~/.zshrc &&
source ~/.zshrc &&
pyenv install 3.9.7 &&
pyenv global 3.9.7 &&
pip install -U pip &&
pip install virtualenv &&
echo "**********************************************************************" &&
pyenv versions &&
python -V &&
pip -V &&

chsh -s $(which zsh)


