# -*- mode: ruby -*-

Vagrant.configure("2") do |config|
  config.vm.box = "mercari"
  config.vm.box_url = "http://developer.nrel.gov/downloads/vagrant-boxes/CentOS-6.5-x86_64-v20140504.box"
  config.ssh.insert_key = false
  config.ssh.forward_agent = true

  config.vm.define "db1" do |server|
    server.vm.network "private_network", ip: "192.168.33.10"
    config.vm.hostname = "db1"
    config.vm.provision "shell", path: "install_mysql.sh", args: 1
  end

  config.vm.define "db2" do |server|
    server.vm.network "private_network", ip: "192.168.33.11"
    config.vm.hostname = "db2"
    config.vm.provision "shell", path: "install_mysql.sh", args: 2
  end

  config.vm.define "db12" do |server|
    server.vm.network "private_network", ip: "192.168.33.12"
    config.vm.hostname = "db12"
    config.vm.provision "shell", path: "install_mariadb.sh"
  end

end
