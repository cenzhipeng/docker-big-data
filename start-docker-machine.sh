#!/bin/bash
docker-machine create --driver virtualbox --virtualbox-boot2docker-url ./rancheros.iso --virtualbox-disk-size "40000" --virtualbox-share-folder "./:/mnt/sda1/work" default
eval $(docker-machine env default)
#docker-machine-ipconfig  static default
#docker-machine ssh default "echo 'cd /mnt/sda1/work' >> /home/docker/.bash_profile"
