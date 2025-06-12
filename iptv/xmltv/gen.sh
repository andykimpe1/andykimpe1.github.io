#!/bin/bash
cd $HOME
FILE=$HOME/installepg    
if [ -f $FILE ]; then
   sudo apt-get update
   sudo apt upgrade -y
   sudo apt-get -y install dos2unix git ssh net-tools wget nano unzip xmltv
   sudo apt-get -y install dotnet-runtime-7.0
   sudo apt-get -y install dotnet-runtime-8.0
   touch $HOME
fi
rm -rf $HOME/.wg++ $HOME/WebGrabPlus_V5.3_install.tar.gz
sudo wget https://github.com/beavis69/tv_grab_fr_telerama/raw/refs/heads/master/tv_grab_fr_telerama -O /usr/bin/tv_grab_fr_telerama
sudo chmod +x /usr/bin/tv_grab_fr_telerama
rm -rf $HOME/andykimpe1.github.io $HOME/config.conf 
git clone git@github.com:andykimpe1/andykimpe1.github.io.git
cd $HOME/andykimpe1.github.io/iptv/xmltv/
wget https://github.com/andykimpe1/andykimpe1.github.io/raw/refs/heads/main/iptv/xmltv/config/France/config.conf -O $HOME/config.conf
rm -f guide.xml
tv_grab_fr_telerama --config-file $HOME/config.conf --output guide.xml --days 7
sed -i "s|C192.api.telerama.fr|TF1.fr|g" guide.xml
sed -i "s|C4.api.telerama.fr|France2.fr|g" guide.xml
sed -i "s|C80.api.telerama.fr|France3.fr|g" guide.xml
sed -i "s|C78.api.telerama.fr|France4.fr|g" guide.xml
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
