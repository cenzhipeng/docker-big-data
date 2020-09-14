#!/bin/bash
echo 'cd /vagrant' >> /home/vagrant/.bash_profile
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
sudo systemctl start docker
sudo usermod -aG docker vagrant
