#!/bin/bash
cd $HOME
FILE=$HOME/wgaccount    
if [ ! -f $FILE ]; then
   sudo apt-get update
   sudo apt upgrade -y
   sudo apt-get -y install dos2unix git ssh net-tools wget nano unzip xmltv libmojolicious-perl
   sudo add-apt-repository -y ppa:dotnet/backports
   sudo apt-get -y purge dotnet-*
   sudo apt -y autoremove
   sudo apt-get -y install dotnet-runtime-9.0
   sudo wget https://github.com/beavis69/tv_grab_fr_telerama/raw/refs/heads/master/tv_grab_fr_telerama -O /usr/bin/tv_grab_fr_telerama
   sudo chmod +x /usr/bin/tv_grab_fr_telerama
   echo "please visit webgrabplus.com"
   echo "create your account on the website"
   echo "donate 6€ with paypal and wait 24h"
   echo "for donate use this page"
   echo "https://webgrabplus.com/content/support-us"
   echo "check your licence is valid and your donator badge found here"
   echo "https://webgrabplus.com/users/yourusername"
   echo "enter your information"
   read -e -p "Enter wg-username: " -i "$wgusername" wgusername
   read -e -p "Enter registered-email: " -i "$wgemail" wgemail
   read -e -p "Enter password: " -i "$wgpassword" wgpassword
   echo "wgusername=$wgusername" > $HOME/wgaccount
   echo "wgemail=$wgemail" >> $HOME/wgaccount
   echo "wgpassword=$wgpassword" >> $HOME/wgaccount
fi
source $HOME/wgaccount
rm -rf $HOME/.wg++ $HOME/WebGrabPlus_V5.3_install.tar.gz
rm -rf $HOME/andykimpe1.github.io $HOME/config.conf
#wget https://webgrabplus.com/sites/default/files/download/SW/V5.3.0/WebGrabPlus_V5.3_install.tar.gz
#tar -zxvf WebGrabPlus_V5.3_install.tar.gz
wget https://webgrabplus.com/sites/default/files/download/SW/V5.5.0/WebGrabPlus_5.5_install.tar.gz
tar -zxvf WebGrabPlus_5.5_install.tar.gz
cd $HOME/.wg++/
rm -rf $HOME/WebGrabPlus_*_install.tar.gz evaluation-builds postprocess_plugins siteini.pack User_contributions _config.yml README.md SiteIniPack_current.zip doc/
./install.sh
wget https://webgrabplus.com/sites/default/files/download/ini/SiteIniPack_current.zip
rm -rf evaluation-builds postprocess_plugins siteini.pack User_contributions _config.yml README.md doc/
unzip SiteIniPack_current.zip
wget https://andykimpe1.github.io/iptv/xmltv/config/France/TELERAMA.xml -O WebGrab++.config.xml
sed -i "s|your webgrab+plus username|$wgusername|g" WebGrab++.config.xml
sed -i "s|your registered email address|$wgemail|g" WebGrab++.config.xml
sed -i "s|your license password|$wgpassword|g" WebGrab++.config.xml
./run.net.sh
#echo "channel 192 FR| TF1 HD (TF1+);https://focus.telerama.fr/100x100/0000/00/01/clear-192.png" > $HOME/config.conf
#tv_grab_fr_telerama --config-file $HOME/config.conf --output France.xml --days 7
#sed -i "s|C192.api.telerama.fr|TF1.fr|g" France.xml
cd $HOME
git clone git@github.com:andykimpe1/andykimpe1.github.io.git
sed 1d $HOME/.wg++/France.xml -i
sed 1d $HOME/.wg++/France.xml -i
sed -i '$d' $HOME/.wg++/France.xml
echo '<?xml version="1.0" encoding="UTF-8"?>' > $HOME/andykimpe1.github.io/iptv/xmltv/guide.xml
echo '<tv generator-info-name="WebGrab+Plus/w MDB &amp; REX Postprocess -- version  V5.3.0.0 -- Jan van Straaten" generator-info-url="http://www.webgrabplus.com">' >> $HOME/andykimpe1.github.io/iptv/xmltv/guide.xml
cat $HOME/.wg++/France.xml >> $HOME/andykimpe1.github.io/iptv/xmltv/guide.xml
echo '</tv>' >> $HOME/andykimpe1.github.io/iptv/xmltv/guide.xml
rm -f $HOME/andykimpe1.github.io/iptv/xmltv/France.xml
cd $HOME/andykimpe1.github.io
git add --all *
git commit -a -m "update epg"
git push origin main
cd $HOME
rm -rf $HOME/.wg++ $HOME/WebGrabPlus_V5.3_install.tar.gz
rm -rf $HOME/andykimpe1.github.io $HOME/config.conf
exit


git clone git@github.com:andykimpe1/andykimpe1.github.io.git
cd $HOME/andykimpe1.github.io/iptv/xmltv/
# france grab epg with telerama
#wget https://github.com/andykimpe1/andykimpe1.github.io/raw/refs/heads/main/iptv/xmltv/config/France/config.conf -O $HOME/config.conf
#rm -f guide.xml France.xml










echo "channel 192 FR| TF1 HD (TF1+);https://focus.telerama.fr/100x100/0000/00/01/clear-192.png" > $HOME/config.conf
tv_grab_fr_telerama --config-file $HOME/config.conf --output France.xml --days 7
sed -i "s|C192.api.telerama.fr|TF1.fr|g" France.xml
sed -i "s|C4.api.telerama.fr|France2.fr|g" France.xml
sed -i "s|C80.api.telerama.fr|France3.fr|g" France.xml
sed -i "s|C78.api.telerama.fr|France4.fr|g" France.xml
sed -i "s|C47.api.telerama.fr|France5.fr|g" France.xml
sed -i "s|C118.api.telerama.fr|M6.fr|g" France.xml
sed -i "s|C111.api.telerama.fr|ARTE.fr|g" France.xml
sed -i "s|C234.api.telerama.fr|LaChaineParlementaire.fr|g" France.xml
sed -i "s|C119.api.telerama.fr|W9.fr|g" France.xml
sed -i "s|C195.api.telerama.fr|TMC.fr|g" France.xml
sed -i "s|C446.api.telerama.fr|TFX.fr|g" France.xml
sed -i "s|C482.api.telerama.fr|Gulli.fr|g" France.xml
sed -i "s|C481.api.telerama.fr|BFMTV.fr|g" France.xml
sed -i "s|C226.api.telerama.fr|CNews.fr|g" France.xml
sed -i "s|C112.api.telerama.fr|LCI.fr|g" France.xml
sed -i "s|C2111.api.telerama.fr|FranceInfo.fr|g" France.xml
sed -i "s|C458.api.telerama.fr|CStar.fr|g" France.xml
sed -i "s|C4139.api.telerama.fr|T18.fr|g" France.xml
#sed -i "s|C195.api.telerama.fr|Nova19.fr|g" France.xml
sed -i "s|C1404.api.telerama.fr|TF1SeriesFilms.fr|g" France.xml
sed -i "s|C1401.api.telerama.fr|LEquipe21.fr|g" France.xml
sed -i "s|C1403.api.telerama.fr|6ter.fr|g" France.xml
sed -i "s|C1402.api.telerama.fr|RMCStory.fr|g" France.xml
sed -i "s|C1400.api.telerama.fr|RMCdecouverte.fr|g" France.xml
sed -i "s|C1399.api.telerama.fr|Cherie25.fr|g" France.xml
cat France.xml > guide.xml
sed -i 's|<?xml version="1.0" encoding="UTF-8"?>||g' France.xml
sed -i 's|<!DOCTYPE tv SYSTEM "xmltv.dtd">||g' France.xml
sed -i 's|<tv source-info-url="https://api.telerama.fr" source-data-url="https://api.telerama.fr" generator-info-name="XMLTV" generator-info-url="http://mythtv-fr.org/">||g' France.xml
sed -i 's|  <channel id="TF1.fr">||g' France.xml
sed -i 's| TF1 HD (TF1+)</display-name>||g' France.xml
sed -i 's|    <icon src="https://focus.telerama.fr/100x100/0000/00/01/clear-192.png" />||g' France.xml
sed -i 's|  </channel>||g' France.xml
sed -i 's|  <channel id="France2.fr">||g' France.xml
sed -i 's| FRANCE 2 FHD (France TV)</display-name>||g' France.xml
sed -i 's|    <icon src="https://focus.telerama.fr/100x100/0000/00/01/clear-4.png" />||g' France.xml
sed -i 's|  <channel id="France3.fr">||g' France.xml
sed -i 's| FRANCE 3 FHD (France TV)</display-name>||g' France.xml
sed -i 's|    <icon src="https://focus.telerama.fr/100x100/0000/00/01/clear-80.png" />||g' France.xml
sed -i 's|  <channel id="France4.fr">||g' France.xml
sed -i 's| FRANCE 4 FHD (France TV)</display-name>||g' France.xml
sed -i 's|    <icon src="https://focus.telerama.fr/100x100/0000/00/01/clear-78.png" />||g' France.xml
sed -i 's|  <channel id="France5.fr">||g' France.xml
sed -i 's| FRANCE 5 FHD (France TV)</display-name>||g' France.xml
sed -i 's|    <icon src="https://focus.telerama.fr/100x100/0000/00/01/clear-47.png" />||g' France.xml
sed -i 's|  <channel id="M6.fr">||g' France.xml
sed -i 's| M6 FHD (M6+)</display-name>||g' France.xml
sed -i 's|    <icon src="https://focus.telerama.fr/100x100/0000/00/01/clear-118.png" />||g' France.xml
sed -i 's|  <channel id="ARTE.fr">||g' France.xml
sed -i 's| ARTE FHD (France TV)</display-name>||g' France.xml
sed -i 's|    <icon src="https://focus.telerama.fr/100x100/0000/00/01/clear-111.png" />||g' France.xml
sed -i 's|  <channel id="LaChaineParlementaire.fr">||g' France.xml
sed -i 's| LCP FHD (France TV)</display-name>||g' France.xml
sed -i 's|    <icon src="https://focus.telerama.fr/100x100/0000/00/01/clear-234.png" />||g' France.xml
sed -i 's|  <channel id="W9.fr">||g' France.xml
sed -i 's| W9 FHD (M6+)</display-name>||g' France.xml
sed -i 's|    <icon src="https://focus.telerama.fr/100x100/0000/00/01/clear-119.png" />||g' France.xml
sed -i 's|  <channel id="TMC.fr">||g' France.xml
sed -i 's| TMC HD (TF1+)</display-name>||g' France.xml
sed -i 's|    <icon src="https://focus.telerama.fr/100x100/0000/00/01/clear-195.png" />||g' France.xml
sed -i 's|  <channel id="TFX.fr">||g' France.xml
sed -i 's| TFX HD (TF1+)</display-name>||g' France.xml
sed -i 's|    <icon src="https://focus.telerama.fr/100x100/0000/00/01/clear-446.png" />||g' France.xml
sed -i 's|  <channel id="Gulli.fr">||g' France.xml
sed -i 's| Gulli (gulli.fr)</display-name>||g' France.xml
sed -i 's|    <icon src="https://focus.telerama.fr/100x100/0000/00/01/clear-482.png" />||g' France.xml
sed -i 's|  <channel id="BFMTV.fr">||g' France.xml
sed -i 's| BFM TV FHD (rmcbfmplay.com)</display-name>||g' France.xml
sed -i 's|    <icon src="https://focus.telerama.fr/100x100/0000/00/01/clear-481.png" />||g' France.xml
sed -i 's|  <channel id="CNews.fr">||g' France.xml
sed -i 's| C NEWS FHD (canalplus.com)</display-name>||g' France.xml
sed -i 's|    <icon src="https://focus.telerama.fr/100x100/0000/00/01/clear-226.png" />||g' France.xml
sed -i 's|  <channel id="LCI.fr">||g' France.xml
sed -i 's| LCI  HD (TF1+)</display-name>||g' France.xml
sed -i 's|    <icon src="https://focus.telerama.fr/100x100/0000/00/01/clear-112.png" />||g' France.xml
sed -i 's|  <channel id="FranceInfo.fr">||g' France.xml
sed -i 's| France Info FHD (France TV)</display-name>||g' France.xml
sed -i 's|    <icon src="https://focus.telerama.fr/100x100/0000/00/01/clear-2111.png" />||g' France.xml
sed -i 's|  <channel id="CStar.fr">||g' France.xml
sed -i 's| CStar FHD (dailymotion.com)</display-name>||g' France.xml
sed -i 's|    <icon src="https://focus.telerama.fr/100x100/0000/00/01/clear-458.png" />||g' France.xml
sed -i 's|  <channel id="T18.fr">||g' France.xml
sed -i 's| T18 HD (dailymotion.com)</display-name>||g' France.xml
sed -i 's|    <icon src="https://focus.telerama.fr/100x100/0000/00/01/clear-4139.png" />||g' France.xml
sed -i 's|  <channel id="TF1SeriesFilms.fr">||g' France.xml
sed -i 's| TF1 Series Films HD (TF1+)</display-name>||g' France.xml
sed -i 's|    <icon src="https://focus.telerama.fr/100x100/0000/00/01/clear-1404.png" />||g' France.xml
sed -i 's|  <channel id="LEquipe21.fr">||g' France.xml
sed -i "s| LA CHAINE L'EQUIPE FHD (dailymotion.com)</display-name>||g" France.xml
sed -i 's|    <icon src="https://focus.telerama.fr/100x100/0000/00/01/clear-1401.png" />||g' France.xml
sed -i 's|  <channel id="6ter.fr">||g' France.xml
sed -i 's| 6Ter FHD (M6+)</display-name>||g' France.xml
sed -i 's|    <icon src="https://focus.telerama.fr/100x100/0000/00/01/clear-1403.png" />||g' France.xml
sed -i 's|  <channel id="RMCStory.fr">||g' France.xml
sed -i 's| RMC STORY FHD (rmcbfmplay.com)</display-name>||g' France.xml
sed -i 's|    <icon src="https://focus.telerama.fr/100x100/0000/00/01/clear-1402.png" />||g' France.xml
sed -i 's|  <channel id="RMCdecouverte.fr">||g' France.xml
sed -i 's| RMC Decouverte FHD (rmcbfmplay.com)</display-name>||g' France.xml
sed -i 's|    <icon src="https://focus.telerama.fr/100x100/0000/00/01/clear-1400.png" />||g' France.xml
sed -i 's|  <channel id="Cherie25.fr">||g' France.xml
sed -i 's| Cherie 25 FHD (nrj-play.fr)</display-name>||g' France.xml
sed -i 's|    <icon src="https://focus.telerama.fr/100x100/0000/00/01/clear-1399.png" />||g' France.xml
sed -i 's/    <display-name>FR|//g' France.xml
sed -i 's|</tv>||g' France.xml
sed -i '/^$/d' France.xml
cd $HOME/andykimpe1.github.io
git add --all *
git commit -a -m "update epg"
git push origin main
cd $HOME
rm -rf $HOME/andykimpe1.github.io $HOME/config.conf
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
