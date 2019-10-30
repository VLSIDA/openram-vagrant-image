# Setup Instructions #

1. Install vagrant from https://www.vagrantup.com/
2. Install git from https://git-scm.com/downloads
3. Install the git lfs extension: https://git-lfs.github.com/
4. Install git lfs:
```
git lfs install
```
5. Clone this repo locally:
```
git clone  git@github.com:VLSIDA/openram-vagrant-image.git
```
6. cd openram-vagrant-image
7. (If you cloned before installing git lfs, you will need to do a git lfs pull as well to get the large PDK file.)
8. Create a shared data directory:
```
mkdir data
```
9. Clone OpenRAM as openram
```
git clone git@github.com:VLSIDA/OpenRAM.git openram
```
(or PrivateRAM for my group)
10. Put proprietary tools in a software disk image:
/vagrant/software/software.vmdk
11. Provision vagrant:
```
vagrant provision
```
12. Restart vagrant:
```
vagrant reload
```
13. Connect to vagrant:
```
vagrant ssh
```
14. Add the software to the fstab file:
```
sudo echo "UUID=562fd98c-b2e0-4c1a-a460-d724d8f606e4 /software       ext3    defaults        0       0" >> /etc/fstab
sudo mkdir /software
sudo mount /software
```

# Windows Subsystem for Linux (WSL) #
If you are using Vagrant in WSL2, you must put the cloned repo in
the WSL user space and the shared directories (data, openram)
on the C:\vagrant drive (/mnt/c/vagrant in WSL). The software.vmdk 
should go in C:\vagrant\software (/home/<user>/openram-vagrant-image/software).

