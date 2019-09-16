# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://vagrantcloud.com/search.
  config.vm.box = "generic/ubuntu1804"

  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  #config.vm.box_check_update = false

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # NOTE: This will enable public access to the opened port
  # config.vm.network "forwarded_port", guest: 80, host: 8080

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine and only allow access
  # via 127.0.0.1 to disable public access
  # config.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "127.0.0.1"

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network "private_network", ip: "192.168.33.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # if Vagrant.has_plugin? "vagrant-vbguest"
  #   config.vbguest.no_install  = true
  #   config.vbguest.auto_update = false
  #   config.vbguest.no_remote   = true
  # end

  # Allow X11 forwarding
  config.ssh.forward_x11 = true
  config.ssh.forward_agent = true

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  #config.vm.synced_folder "/mnt/c/Users/mguth/.ssh", ".ssh"
  #config.vm.synced_folder "/Users/mrg/.ssh", "/home/vagrant/.ssh"  
  #config.vm.synced_folder "/mnt/c/vagrant/data", "/data"
  config.vm.synced_folder "openram", "/home/vagrant/openram"
  config.vm.synced_folder "data", "/home/vagrant/data"
  #config.vm.synced_folder "/mnt/c/vagrant/software", "/software"

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  config.vm.provider "virtualbox" do |vb|
      vb.name = "openram"
  #   # Display the VirtualBox GUI when booting the machine
  #   vb.gui = true
  #
  #   # Customize the amount of memory on the VM:
      vb.memory = "8192"
      vb.cpus = "2"

      # Add this to the /etc/fstab
      # UUID=562fd98c-b2e0-4c1a-a460-d724d8f606e4 /software	  ext3    defaults 	  0	  0
      file_to_disk = '/vagrant/software/software.vmdk'
      vb.customize ['storageattach', :id,
                    '--storagectl', 'IDE Controller', 
	            '--port', 1,
                    '--device', 0,
                    '--type', 'hdd',
                    '--medium', file_to_disk]
                   
  end

  config.vm.provision "shell", run: "once", path: "install_deps.sh"
  config.vm.provision "shell", run: "once", path: "install_tools.sh"
  config.vm.provision "file", run: "first", source: "PDKs.tar.gz", destination: "/tmp/PDKs.tar.gz"
  config.vm.provision "shell", run: "first", inline: <<-SHELL
    # Enable X11 forwarding
    echo "X11UseLocalhost no" >> /etc/ssh/sshd_config
    # The Free PDKs
    tar zxvf /tmp/PDKs.tar.gz -C /home
    echo "source /software/setup.sh" >> /home/vagrant/.bashrc
    # Reboot
    reboot
  SHELL

end
