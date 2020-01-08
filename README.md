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
* Start and provision vagrant:
```
vagrant up --provision
```
* Restart vagrant:
```
vagrant reload
```
* Install the guest addition updater:
```
vagrant plugin install vagrant-vbguest
```
* Connect to vagrant:
```
vagrant ssh
```

# Windows Subsystem for Linux (WSL) #
If you are using Vagrant in WSL2, you must put the cloned repo in
the WSL user space and the shared directories (data, openram)
on the C:\vagrant drive (/mnt/c/vagrant in WSL). The software.vmdk 
should go in C:\vagrant\software (/home/<user>/openram-vagrant-image/software).

# Using Graphics #

On macOS, you need to install and start [XQuartz](https://www.xquartz.org/).

On Windows in WSL, you need to install and start [vcxsrv](https://sourceforge.net/projects/vcxsrv/) (Xlaunch). In the options, you can use the defaults, except you might need to check "Disable access control" to allow connections from Vagrant.

In both, make sure that the DISPLAY environment variable is set before you run "vagrant ssh":
```
export DISPLAY=<yourcomputer>:0.0
```
After sshing into Vagrant, try running xcalc.
