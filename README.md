To start:
1) Install vagrant https://www.vagrantup.com/
2) Clone this:
git clone  git@github.com:VLSIDA/openram-vagrant-image.git
cd fpga-vagrant-image
3) Create a shared data directory:
mkdir data
4) Put proprietary tools in a software directory:
mkdir software
5) Add setup file in software directory:
software/setup.sh
6) Provision vagrant:
vagrant provision
7) Restart vagrant:
vagrant reload
8) Connect to vagrant:
vagrant ssh

