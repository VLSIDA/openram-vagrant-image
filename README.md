# Setup Instructions #

* Install [Virtualbox](https://www.virtualbox.org/wiki/Downloads)
* Install [vagrant](https://www.vagrantup.com/)
* Install [git](https://git-scm.com/downloads)
* Install the [git lfs extension](https://git-lfs.github.com/)
* Install git lfs:
```
git lfs install
```
* Clone this repo locally:
```
git clone  git@github.com:VLSIDA/openram-vagrant-image.git
```
* cd openram-vagrant-image
* (If you cloned before installing git lfs, you will need to do a git lfs pull as well to get the large PDK file.)
* Create a shared data directory:
```
mkdir data
```
* Clone OpenRAM as openram
```
git clone git@github.com:VLSIDA/OpenRAM.git openram
```
(or PrivateRAM for my group)
* Put proprietary tools in a software disk image:
/vagrant/software/software.vmdk
* Provision vagrant:
```
vagrant provision
```
* Restart vagrant:
```
vagrant reload
```
* Connect to vagrant:
```
vagrant ssh
```
* Add the software to the fstab file:
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

# Using Graphics #

On macOS, you need to install and start [XQuartz](https://www.xquartz.org/).

On Windows in WSL, you need to install and start [vcxsrv](https://sourceforge.net/projects/vcxsrv/).

In both, make sure that the DISPLAY environment variable is set before you run "vagrant ssh":
```
export <yourcomputer>:0.0
```
After sshing into Vagrant, try running xcalc.
