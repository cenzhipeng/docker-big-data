# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  config.vm.box = "centos/7"
  config.vm.network "private_network", ip: "192.168.50.4"
  config.vm.provision "shell", path: "machine-init.sh"
  config.ssh.extra_args = ["-D", "18000"]
#   config.vm.network "forwarded_port", guest: 22, host: 22222
#   config.vm.network "forwarded_port", guest: 18000, host: 38000
  config.vm.provider "virtualbox" do |v|
    v.memory = 4096
    v.cpus = 1
  end
  config.vm.synced_folder ".", "/vagrant", type: "nfs"
end
