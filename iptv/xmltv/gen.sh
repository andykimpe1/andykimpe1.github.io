#!/bin/bash

cd $HOME
FILE=$HOME/installepg    
if [ ! -f $FILE ]; then
   sudo apt-get update
   sudo apt upgrade -y
   sudo apt-get -y install dos2unix git ssh net-tools wget nano unzip xmltv
   sudo apt-get -y install dotnet-runtime-7.0
   sudo apt-get -y install dotnet-runtime-8.0
   sudo wget https://github.com/beavis69/tv_grab_fr_telerama/raw/refs/heads/master/tv_grab_fr_telerama -O /usr/bin/tv_grab_fr_telerama
   sudo chmod +x /usr/bin/tv_grab_fr_telerama
   touch $FILE
fi
rm -rf $HOME/.wg++ $HOME/WebGrabPlus_V5.3_install.tar.gz
rm -rf $HOME/andykimpe1.github.io $HOME/config.conf 
git clone git@github.com:andykimpe1/andykimpe1.github.io.git
cd $HOME/andykimpe1.github.io/iptv/xmltv/
#wget https://github.com/andykimpe1/andykimpe1.github.io/raw/refs/heads/main/iptv/xmltv/config/France/config.conf -O $HOME/config.conf
#rm -f guide.xml
#tv_grab_fr_telerama --config-file $HOME/config.conf --output guide.xml --days 7
wget https://github.com/andykimpe1/andykimpe1.github.io/raw/refs/heads/main/iptv/xmltv/config/France/TF1.conf -O $HOME/TF1.conf
rm -f TF1.xml $HOME/TF1.xml
tv_grab_fr_telerama --config-file $HOME/TF1.conf --output $HOME/TF1.xml --days 7
sed -i "s|C192.api.telerama.fr|TF1.fr|g" $HOME/TF1.xml
sed -i 's|<?xml version="1.0" encoding="UTF-8"?>||g' $HOME/TF1.xml
sed -i 's|<!DOCTYPE tv SYSTEM "xmltv.dtd">||g' $HOME/TF1.xml
sed -i 's|<tv source-info-url="https://api.telerama.fr" source-data-url="https://api.telerama.fr" generator-info-name="XMLTV" generator-info-url="http://mythtv-fr.org/">||g' $HOME/TF1.xml
sed -i 's|  <channel id="C192.api.telerama.fr">||g' $HOME/TF1.xml
sed -i 's|  <channel id="TF1.fr">||g' $HOME/TF1.xml
sed -i "s/    <display-name>FR|//g" $HOME/TF1.xml
sed -i 's| TF1 HD (TF1+)</display-name>||g' $HOME/TF1.xml
sed -i 's|    <icon src="https://focus.telerama.fr/100x100/0000/00/01/clear-192.png" />||g' $HOME/TF1.xml
sed -i 's|  </channel>||g' $HOME/TF1.xml
sed -i 's|</tv>||g' $HOME/TF1.xml
sed -i '/^$/d' $HOME/TF1.xml
rm -f $HOME/TF1.conf
wget https://github.com/andykimpe1/andykimpe1.github.io/raw/refs/heads/main/iptv/xmltv/config/France/France2.conf -O $HOME/France2.conf
rm -f France2.xml $HOME/France2.xml
tv_grab_fr_telerama --config-file $HOME/France2.conf --output France2.xml --days 7
sed -i "s|C4.api.telerama.fr|France2.fr|g" France2.xml
sed -i 's|<?xml version="1.0" encoding="UTF-8"?>||g' France2.xml
sed -i 's|<!DOCTYPE tv SYSTEM "xmltv.dtd">||g' France2.xml
sed -i 's|<tv source-info-url="https://api.telerama.fr" source-data-url="https://api.telerama.fr" generator-info-name="XMLTV" generator-info-url="http://mythtv-fr.org/">||g' France2.xml
sed -i 's|  <channel id="C4.api.telerama.fr">||g' France2.xml
sed -i 's|  <channel id="France2.fr">||g' France2.xml
sed -i "s/    <display-name>FR|//g" France2.xml
sed -i 's| FRANCE 2 FHD (France TV)</display-name>||g' France2.xml
sed -i 's|    <icon src="https://focus.telerama.fr/100x100/0000/00/01/clear-4.png" />||g' France2.xml
sed -i 's|  </channel>||g' France2.xml
sed -i 's|</tv>||g' France2.xml
sed -i '/^$/d' France2.xml
sed -i "s|C192.api.telerama.fr|TF1.fr|g" guide.xml
sed -i "s|C4.api.telerama.fr|France2.fr|g" guide.xml
sed -i "s|C80.api.telerama.fr|France3.fr|g" guide.xml
sed -i "s|C78.api.telerama.fr|France4.fr|g" guide.xml
sed -i "s|C47.api.telerama.fr|France5.fr|g" guide.xml
sed -i "s|C118.api.telerama.fr|M6.fr|g" guide.xml
sed -i "s|C111.api.telerama.fr|ARTE.fr|g" guide.xml
sed -i "s|C234.api.telerama.fr|LaChaineParlementaire.fr|g" guide.xml
sed -i "s|C119.api.telerama.fr|W9.fr|g" guide.xml
sed -i "s|C195.api.telerama.fr|TMC.fr|g" guide.xml
cd $HOME/andykimpe1.github.io
git add --all *
git commit -a -m "update epg"
git push origin main
exit
wget https://webgrabplus.com/sites/default/files/download/SW/V5.3.0/WebGrabPlus_V5.3_install.tar.gz
tar -zxvf WebGrabPlus_V5.3_install.tar.gz
cd ~/.wg++
./install.sh
rm -rf evaluation-builds postprocess_plugins siteini.pack User_contributions _config.yml README.md SiteIniPack_current.zip
wget https://webgrabplus.com/sites/default/files/download/ini/SiteIniPack_current.zip
unzip SiteIniPack_current.zip
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
