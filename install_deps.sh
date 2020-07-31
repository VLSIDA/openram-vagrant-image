#!/bin/bash
apt-get update
# Work-around for grup-pc interactive bug
DEBIAN_FRONTEND=noninteractive apt-get -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" upgrade
#apt-get --no-install-recommends -y upgrade
### Dependencies ###
# General tools for building etc.
apt-get install --no-install-recommends -y build-essential git ssh vim cmake apt-file
apt-get install --no-install-recommends -y autoconf automake libtool bison flex libncurses5-dev
# Use bash instead of dash
rm /bin/sh && ln -s /bin/bash /bin/sh
# Needed by OpenRAM 
apt-get install --no-install-recommends -y  python3 python3-numpy python3-scipy python3-pip python3-matplotlib python3-venv
# Needed by Netgen and Magic
apt-get install --no-install-recommends -y m4 csh  tk tk-dev tcl-dev blt-dev
# Needed by ngspice (octave for viewing)
apt-get install --no-install-recommends -y libxaw7-dev libreadline7 libreadline-dev octave
# X11 dev not used
apt-get install --no-install-recommends -y libx11-dev libcairo2-dev

# CAD dependencies
# Needed by calibre
apt-get install --no-install-recommends -y libglu1-mesa-dev freeglut3-dev mesa-common-dev
# Needed by virtuoso
apt-get install --no-install-recommends -y ksh libc6-i386
ln -s libXpm.so.4 libXp.so.6
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
# Needed for klayout
apt-get install -y --no-install-recommends qt5-default qtcreator ruby-full ruby-dev python3-dev qtmultimedia5-dev libqt5multimediawidgets5 libqt5multimedia5-plugins libqt5multimedia5 libqt5svg5-dev libqt5designer5 libqt5designercomponents5 libqt5xmlpatterns5-dev qttools5-dev

### Utilities ###
# X11
apt-get install --no-install-recommends -y x11-xserver-utils
# Network debug tools (can be removed to save space)
apt-get install --no-install-recommends -y iputils-ping net-tools lsof wget whois nmap telnet curl dnsutils tcpdump traceroute id-utils
# Needed to run lmstat
apt-get install --no-install-recommends -y lsb lsb-release lsb-core
# Interactive tools
apt-get install --no-install-recommends -y emacs screen gdb python3-setuptools
# Code stuff for elpy
python3 -m pip install jedi autopep8 rope flake8 yapf black 
# Openvpn
apt-get install --no-install-recommends -y openconnect lib32ncurses5 lib32tinfo5 lib32z1 libc6-i386 libpkcs11-helper1 openvpn vpnc-scripts net-tools
#wget -q -O /usr/local/bin/ucivpnup http://www.socsci.uci.edu/~jstern/uci_vpn_ubuntu/ucivpnup.txt
#wget -q -O /usr/local/bin/ucivpndown http://www.socsci.uci.edu/~jstern/uci_vpn_ubuntu/ucivpndown.txt

#wget https://sourceforge.net/projects/ngspice/files/ng-spice-rework/old-releases/contrib/octave_spice.tar.gz

