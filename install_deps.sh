#!/bin/bash
apt-get update
apt-get --no-install-recommends -y upgrade
### Dependencies ###
# General tools for building etc.
apt-get install --no-install-recommends -y build-essential git ssh vim gosu
apt-get install --no-install-recommends -y autoconf automake libtool bison flex
# Use bash instead of dash
rm /bin/sh && ln -s /bin/bash /bin/sh
# Needed by OpenRAM 
apt-get install --no-install-recommends -y  python3 python3-numpy python3-scipy python3-pip
# Needed by Netgen and Magic
apt-get install --no-install-recommends -y m4 csh  tk tk-dev tcl-dev blt-dev
# Needed by ngspice
apt-get install --no-install-recommends -y libxaw7-dev libreadline7 libreadline-dev
# X11 dev not used
apt-get install --no-install-recommends -y libx11-dev libcairo2-dev

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
# Needed by Innovus
wget -q -O /tmp/libxp6.deb https://ftp.us.debian.org/debian/pool/main/libx/libxp/libxp6_1.0.2-2_amd64.deb \
&& dpkg -i /tmp/libxp6.deb \
&& rm /tmp/libxp6.deb

### Utilities ###
# X11
apt-get install -y --no-install-recommends x11-xserver-utils
# Network debug tools (can be removed to save space)
apt-get install --no-install-recommends -y iputils-ping net-tools lsof wget whois nmap telnet curl dnsutils tcpdump traceroute id-utils
# Needed to run lmstat
apt-get install -y --no-install-recommends lsb lsb-release lsb-core
# Interactive tools
apt-get install -y --no-install-recommends emacs screen gdb
