
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
  # config.vm.box_check_update = false

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

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  config.vm.synced_folder "data", "/vagrant_data"

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  # config.vm.provider "virtualbox" do |vb|
  #   # Display the VirtualBox GUI when booting the machine
  #   vb.gui = true
  #
  #   # Customize the amount of memory on the VM:
  #   vb.memory = "1024"
  # end
  #
  # View the documentation for the provider you are using for more
  # information on available options.


  # Allow X11 forwarding
  config.ssh.forward_x11 = true
  config.ssh.forward_agent = true

  # Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.
  config.vm.provision "file", source: "set-paths.sh", destination: "/tmp"
  config.vm.provision "file", source: "PDKs.tar.gz", destination: "/tmp/PDKs.tar.gz"
  config.vm.provision "shell", inline: <<-SHELL
    apt-get update
    apt-get --no-install-recommends -y upgrade

    # Enable X11 forwarding
    echo "X11UseLocalhost no" >> /etc/sshd_config
  
    ### Dependencies ###
    # General tools for building etc.
    apt-get install --no-install-recommends -y build-essential git ssh vim gosu
    apt-get install --no-install-recommends -y autoconf automake libtool bison flex
    # Use bash instead of dash
    rm /bin/sh && ln -s /bin/bash /bin/sh
    # Needed by OpenRAM 
    apt-get install --no-install-recommends -y  python3 python3-numpy python3-scipy
    # Needed by Netgen
    apt-get install --no-install-recommends -y m4 csh  tk tk-dev tcl-dev
    # Needed by ngspice
    apt-get install --no-install-recommends -y libxaw7-dev
    # X11 dev not used
    apt-get install --no-install-recommends -y libx11-dev libcairo2-dev
    ### Magic ###

    # This would install the default Ubuntu version which
    # is an old one...
    #apt-get install --no-install-recommends -y magic

    cd
    git clone git://opencircuitdesign.com/magic-8.2
    cd magic-8.2
    ./configure && make -j$(nproc) && make install

    ### Ngspice ###
    #This would install ngspice 29 which is old
    #apt-get install --no-install-recommends -y ngspice
    # Compile the newest
    cd
    git clone git://git.code.sf.net/p/ngspice/ngspice
    cd ngspice
    ./autogen.sh && ./configure --enable-openmp && make -j$(nproc) && make install
    #rm -rf /root/ngspice

    ### Netgen ###
    cd
    git clone git://opencircuitdesign.com/netgen-1.5
    cd netgen-1.5
    ./configure && make -j$(nproc) && make install
    #rm -rf /root/netgen-1.5

    ### FREEPDK 15 and 45 PDKs ###
    tar zxvf /tmp/PDKs.tar.gz -C /home
    # Tool setup paths
    mv /tmp/set-paths /etc/skel
    chmod 755 /etc/skel/set-paths.sh
    echo "source /etc/skel/set-paths.sh" >> /etc/skel/.bashrc

    # CAD dependencies
    # Needed by calibre
    apt-get install --no-install-recommends -y libglu1-mesa-dev freeglut3-dev mesa-common-dev
    # Needed by virtuoso
    apt-get install --no-install-recommends -y ksh libc6-i386
    # Needed by Synopsys design compiler
    apt-get install --no-install-recommends -y libjpeg62 libtiff5 libmng2 libpng16-16
    ln -s /usr/lib/x86_64-linux-gnu/libtiff.so.5 /usr/lib/x86_64-linux-gnu/libtiff.so.3 
    ln -s /usr/lib/x86_64-linux-gnu/libmng.so.2 /usr/lib/x86_64-linux-gnu/libmng.so.1
    # Needed by Synopsys library compiler 
    apt-get install --no-install-recommends -y libqt5widgets5 libqt5x11extras5 libqt5printsupport5 libqt5xml5 libqt5sql5 libqt5svg5
    # Needed by ICC/Synopsys
    apt-get install --no-install-recommends -y wget
    wget -q -O /tmp/libpng12.deb http://mirrors.kernel.org/ubuntu/pool/main/libp/libpng/libpng12-0_1.2.54-1ubuntu1_amd64.deb \
    && dpkg -i /tmp/libpng12.deb \
    && rm /tmp/libpng12.deb

    ### Utilities ###
    # X11
    apt-get install -y --no-install-recommends x11-xserver-utils
    # Network debug tools (can be removed to save space)
    apt-get install --no-install-recommends -y iputils-ping net-tools lsof wget whois nmap telnet curl dnsutils tcpdump traceroute
    # Needed to run lmstat
    apt-get install -y --no-install-recommends lsb lsb-release lsb-core
    # Interactive tools
    apt-get install -y --no-install-recommends emacs screen gdb



  SHELL
end
