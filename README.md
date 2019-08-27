To start:
1) Install vagrant https://www.vagrantup.com/
2) Clone this: git clone  git@github.com:VLSIDA/openram-vagrant-image.git
3) cd openram-vagrant-image
4) Create a shared data directory: 
mkdir data
5) Put proprietary tools in a software disk image:
/vagrant/software/software.vmdk
6) Provision vagrant:
vagrant provision
7) Restart vagrant:
vagrant reload
8) Connect to vagrant:
vagrant ssh


