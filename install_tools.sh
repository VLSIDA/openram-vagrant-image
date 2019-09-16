#!/bin/bash
### Magic ###
# This would install the default Ubuntu version which
# is an old one...
#apt-get install --no-install-recommends -y magic
cd
git clone git://opencircuitdesign.com/magic-8.2
cd magic-8.2
./configure && make && make install

### Ngspice ###
#This would install ngspice 29 which is old
#apt-get install --no-install-recommends -y ngspice
# Compile the newest
cd
git clone git://git.code.sf.net/p/ngspice/ngspice
cd ngspice
./autogen.sh && ./configure --enable-openmp --with-readline && make -j$(nproc) && make install

### Netgen ###
cd
git clone git://opencircuitdesign.com/netgen-1.5
cd netgen-1.5
./configure && make -j$(nproc) && make install

## KLayout ###
#cd
#git clone https://github.com/KLayout/klayout
#cd klayout
#./build.sh -qt5 
#cp -r bin-release /software/klayout
