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
wget https://andykimpe1.github.io/iptv/xmltv/config/France2.xml -O WebGrab++.config.xml
./run.net.sh
wget https://andykimpe1.github.io/iptv/xmltv/config/France3.xml -O WebGrab++.config.xml
./run.net.sh
wget https://andykimpe1.github.io/iptv/xmltv/config/France4.xml -O WebGrab++.config.xml
./run.net.sh
wget https://andykimpe1.github.io/iptv/xmltv/config/France5.xml -O WebGrab++.config.xml
./run.net.sh
wget https://andykimpe1.github.io/iptv/xmltv/config/M6.xml -O WebGrab++.config.xml
./run.net.sh
wget https://andykimpe1.github.io/iptv/xmltv/config/Arte.xml -O WebGrab++.config.xml
./run.net.sh
wget https://andykimpe1.github.io/iptv/xmltv/config/LCP.xml -O WebGrab++.config.xml
./run.net.sh
wget https://andykimpe1.github.io/iptv/xmltv/config/W9.xml -O WebGrab++.config.xml
./run.net.sh
wget https://andykimpe1.github.io/iptv/xmltv/config/TMC.xml -O WebGrab++.config.xml
./run.net.sh
wget https://andykimpe1.github.io/iptv/xmltv/config/TFX.xml -O WebGrab++.config.xml
./run.net.sh
wget https://andykimpe1.github.io/iptv/xmltv/config/GULLI.xml -O WebGrab++.config.xml
./run.net.sh
wget https://andykimpe1.github.io/iptv/xmltv/config/BFMTV.xml -O WebGrab++.config.xml
./run.net.sh
wget https://andykimpe1.github.io/iptv/xmltv/config/CNEWS.xml -O WebGrab++.config.xml
./run.net.sh
wget https://andykimpe1.github.io/iptv/xmltv/config/LCI.xml -O WebGrab++.config.xml
./run.net.sh
wget https://andykimpe1.github.io/iptv/xmltv/config/CSTAR.xml -O WebGrab++.config.xml
./run.net.sh
wget https://andykimpe1.github.io/iptv/xmltv/config/T18.xml -O WebGrab++.config.xml
./run.net.sh
#wget https://andykimpe1.github.io/iptv/xmltv/config/Nova19.xml -O WebGrab++.config.xml
./run.net.sh
wget https://andykimpe1.github.io/iptv/xmltv/config/TF1SERIESFILMS.xml -O WebGrab++.config.xml
./run.net.sh
wget https://andykimpe1.github.io/iptv/xmltv/config/LACHAINELEQUIPE.xml -O WebGrab++.config.xml
./run.net.sh
wget https://andykimpe1.github.io/iptv/xmltv/config/6TER.xml -O WebGrab++.config.xml
./run.net.sh
wget https://andykimpe1.github.io/iptv/xmltv/config/RMCSTORY.xml -O WebGrab++.config.xml
./run.net.sh
wget https://andykimpe1.github.io/iptv/xmltv/config/RMCDECOUVERTE.xml -O WebGrab++.config.xml
./run.net.sh
wget https://andykimpe1.github.io/iptv/xmltv/config/Cherie25.xml -O WebGrab++.config.xml
./run.net.sh
