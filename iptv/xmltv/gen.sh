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
wget https://andykimpe1.github.io/iptv/xmltv/config/France/TF1.xml -O WebGrab++.config.xml
./run.net.sh
wget https://andykimpe1.github.io/iptv/xmltv/config/France/France2.xml -O WebGrab++.config.xml
./run.net.sh
wget https://andykimpe1.github.io/iptv/xmltv/config/France/France3.xml -O WebGrab++.config.xml
./run.net.sh
wget https://andykimpe1.github.io/iptv/xmltv/config/France/France4.xml -O WebGrab++.config.xml
./run.net.sh
wget https://andykimpe1.github.io/iptv/xmltv/config/France/France5.xml -O WebGrab++.config.xml
./run.net.sh
wget https://andykimpe1.github.io/iptv/xmltv/config/France/M6.xml -O WebGrab++.config.xml
./run.net.sh
wget https://andykimpe1.github.io/iptv/xmltv/config/France/Arte.xml -O WebGrab++.config.xml
./run.net.sh
wget https://andykimpe1.github.io/iptv/xmltv/config/France/LCP.xml -O WebGrab++.config.xml
./run.net.sh
wget https://andykimpe1.github.io/iptv/xmltv/config/France/W9.xml -O WebGrab++.config.xml
./run.net.sh
wget https://andykimpe1.github.io/iptv/xmltv/config/France/TMC.xml -O WebGrab++.config.xml
./run.net.sh
wget https://andykimpe1.github.io/iptv/xmltv/config/France/TFX.xml -O WebGrab++.config.xml
./run.net.sh
wget https://andykimpe1.github.io/iptv/xmltv/config/France/GULLI.xml -O WebGrab++.config.xml
./run.net.sh
wget https://andykimpe1.github.io/iptv/xmltv/config/France/BFMTV.xml -O WebGrab++.config.xml
./run.net.sh
wget https://andykimpe1.github.io/iptv/xmltv/config/France/CNEWS.xml -O WebGrab++.config.xml
./run.net.sh
wget https://andykimpe1.github.io/iptv/xmltv/config/France/LCI.xml -O WebGrab++.config.xml
./run.net.sh
wget https://andykimpe1.github.io/iptv/xmltv/config/France/CSTAR.xml -O WebGrab++.config.xml
./run.net.sh
wget https://andykimpe1.github.io/iptv/xmltv/config/France/T18.xml -O WebGrab++.config.xml
./run.net.sh
#wget https://andykimpe1.github.io/iptv/xmltv/config/France/Nova19.xml -O WebGrab++.config.xml
./run.net.sh
wget https://andykimpe1.github.io/iptv/xmltv/config/France/TF1SERIESFILMS.xml -O WebGrab++.config.xml
./run.net.sh
wget https://andykimpe1.github.io/iptv/xmltv/config/France/LACHAINELEQUIPE.xml -O WebGrab++.config.xml
./run.net.sh
wget https://andykimpe1.github.io/iptv/xmltv/config/France/6TER.xml -O WebGrab++.config.xml
./run.net.sh
wget https://andykimpe1.github.io/iptv/xmltv/config/France/RMCSTORY.xml -O WebGrab++.config.xml
./run.net.sh
wget https://andykimpe1.github.io/iptv/xmltv/config/France/RMCDECOUVERTE.xml -O WebGrab++.config.xml
./run.net.sh
wget https://andykimpe1.github.io/iptv/xmltv/config/France/Cherie25.xml -O WebGrab++.config.xml
./run.net.sh
