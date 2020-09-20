#!/bin/bash
echo 'cd /vagrant' >> /home/vagrant/.bash_profile
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
sudo systemctl start docker
sudo curl -L "https://github.com/docker/compose/releases/download/1.27.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

echo "export CLICOLOR=1" >> /home/vagrant/.bash_profile
echo "export LSCOLORS='gxfxcxdxbxGxDxabagacad'" >> /home/vagrant/.bash_profile
echo "export PS1='\[\033[01;32m\]\u@:\[\033[01;36m\]\w\[\033[00m\]\$ '" >> /home/vagrant/.bash_profile
echo "export TERM=xterm-color" >> /home/vagrant/.bash_profile



sudo usermod -aG docker vagrant
