To start:
1) Install vagrant https://www.vagrantup.com/
2) Install git: https://git-scm.com/downloads
3) Install the git lfs extension: https://git-lfs.github.com/
3) Clone this: git clone  git@github.com:VLSIDA/openram-vagrant-image.git
4) cd openram-vagrant-image
5) Create a shared data directory: 
mkdir data
6) Clone OpenRAM as openram
7) Put proprietary tools in a software disk image:
/vagrant/software/software.vmdk
8) Provision vagrant:
vagrant provision
9) Restart vagrant:
vagrant reload
10) Connect to vagrant:
vagrant ssh

If you are using Vagrant in WSL2, you must put the cloned repo in
the WSL user space and the shared directories (data, openram)
on the C:\vagrant drive (/mnt/c/vagrant in WSL). The software.vmdk 
should go in C:\vagrant\software (/mnt/c/vagrant/software).

