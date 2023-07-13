# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com
  
  config.hostmanager.enabled = true
  config.hostmanager.manage_host = true
  
  ##### Jenkins #####

  config.vm.define "slave01" do |slave01|
    slave01.vm.box = "generic/debian10"
    slave01.vm.network "private_network", ip: "192.168.56.11"
    slave01.vm.synced_folder ".", "/vagrant_data"
  end

  config.vm.define "slave02" do |slave02|
    slave02.vm.box = "generic/debian10"
    slave02.vm.network "private_network", ip: "192.168.56.12"
    slave02.vm.synced_folder ".", "/vagrant_data"
  end
  # SHELL
end
