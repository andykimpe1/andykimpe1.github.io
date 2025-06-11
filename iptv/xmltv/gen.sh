#!/bin/bash
cd
sudo apt-get update
sudo apt upgrade -y
sudo apt-get -y install mono-complete dos2unix git ssh net-tools wget nano
rm -rf ~/.wg++ ~/WebGrabPlus_V5.1_install.tar.gz
wget http://webgrabplus.com/sites/default/files/download/SW/V5.1.0/WebGrabPlus_V5.1_install.tar.gz
tar -zxvf WebGrabPlus_V5.1_install.tar.gz
cd ~/.wg++
./install.sh
