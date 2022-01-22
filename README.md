# Settings for server


## Creating user
```bash
# apt-get install sudo &&
adduser client
# groups client &&
usermod -aG sudo client
```


## SSH setings

On PC:

```
$ cat ~/.ssh/keys/id_rsa.pub
```
Copy output string.

On server:

```bash
# mkdir -p /home/client/.ssh && echo INSERT_YOUR_PUBLIC_KEY >> /home/client/.ssh/authorized_keys && chmod -R go= /home/client/.ssh && chown -R client:client /home/client/.ssh
# systemctl start sshd && systemctl enable sshd && /etc/init.d/ssh restart
```

Connect via ssh and make further configuration from under the user.


##  Update all, installing programs and features, locale and timezone settings, firewall settings

``` bash
$ sudo apt-get update &&
sudo apt-get upgrade -y &&
sudo apt autoclean -y &&
sudo apt autoremove -y &&
sudo apt-get install vim-gui-common screen speedtest-cli git curl wget unzip zip ncdu htop mc ranger ncdu fail2ban libpcre3 libpcre3-dev &&
sudo locale-gen ru_RU.UTF-8 &&
sudo update-locale LANG=en_US.UTF-8 LC_TIME="ru_RU.UTF-8" &&
sudo timedatectl set-timezone Asia/Novosibirsk &&
sudo ufw status &&
sudo ufw allow OpenSSH &&
sudo ufw allow 22/tcp &&
sudo ufw enable &&
sudo ufw status
```

## VIM settings

```bash
$ curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim &&
wget -O ~/.vimrc https://raw.githubusercontent.com/abanshikov/server_settings/main/vimrc &&
vim ~/.vimrc

:PlugInstall
```

## ZSH settings

```bash
$ sudo apt-get install zsh

$ sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)" &&
chsh -s (which zsh)

$ wget -O ~/.zshrc https://raw.githubusercontent.com/abanshikov/server_settings/main/zshrc &&
source ~/.zshrc
```

## Python 3.9.7
```bash
$ sudo apt-get update; sudo apt-get install --no-install-recommends make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev build-essential libssl-dev libffi-dev &&
sudo apt-get install git &&
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
echo "****************************************************************************************************************" &&
pyenv versions &&
python -V &&
pip -V
```
