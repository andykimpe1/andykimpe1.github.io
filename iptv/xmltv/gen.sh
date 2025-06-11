#!/bin/bash
cd
sudo apt-get update
sudo apt upgrade -y
sudo apt-get -y install dos2unix git ssh net-tools wget nano
sudo apt-get -y install dotnet-runtime-7.0
sudo apt-get -y install dotnet-runtime-8.0
rm -rf ~/.wg++ ~/WebGrabPlus_V5.3_install.tar.gz
wget https://webgrabplus.com/sites/default/files/download/SW/V5.3.0/WebGrabPlus_V5.3_install.tar.gz
tar -zxvf WebGrabPlus_V5.3_install.tar.gz
cd ~/.wg++
./install.sh
wget https://andykimpe1.github.io/iptv/xmltv/config/TF1.xml -O WebGrab++.config.xml
./run.net.sh
