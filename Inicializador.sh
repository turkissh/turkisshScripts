#!/bin/bash

echo -e "\t\t Bienvenido al instalador basico\n"
echo -e "\t\t      Ubuntu 10.04 LTS          \n"
read -p "ENTER para continuar..."

echo "1.- Agregando aptitude"
apt-get install -y aptitude && clear

echo "1.1- Actualizando repositorios"
aptitude update && sudo aptitude safe-upgrade && clear

echo "2.- Agregando repositorios Medibuntu"
wget --output-document=/etc/apt/sources.list.d/medibuntu.list http://www.medibuntu.org/sources.list.d/$(lsb_release -cs).list

apt-get --quiet update && sudo aptitude -y --allow-untrusted install medibuntu-keyring && sudo aptitude update && clear

echo "3.- Instalando codecs no libres"
aptitude -y install non-free-codecs && clear

echo "4.- Instalando soporte para DVD"
aptitude -y install libdvdread4 && sudo /usr/share/doc/libdvdread4/install-css.sh && clear

echo "5.- Instalando VLC"
aptitude -y install vlc && clear

echo "6.- Instalando Compresores"
aptitude -y install rar unace p7zip-full p7zip-rar sharutils mpack lha arj && clear

echo "7.- Instalando Chromium"
add-apt-repository ppa:chromium-daily && sudo aptitude update && sudo aptitude -y install chromium-browser chromium-browser-l10n chromium-codecs-ffmpeg-nonfree chromium-codecs-ffmpeg && clear

echo "8.- Instalando jDownloader"
add-apt-repository ppa:jd-team/jdownloader && sudo aptitude update &&  aptitude install jdownloader && clear


echo "9.- Instalando wine"
aptitude -y install wine1.2
aptitude -y install gnome-exe-thumbnailer && clear

echo "10.- Agregando repositorios Canonical"
add-apt-repository "deb http://archive.canonical.com/ubuntu lucid partner"

clear

echo "\n\nActualizando repositorios"
aptitude update && clear

echo "11.- Instalando Acrobat Reader"
aptitude -y install acroread acroread-fonts && clear

echo "12.- Instalando maquina virtual Java"
aptitude -y install sun-java6-jre sun-java6-plugin sun-java6-fonts && clear

echo "13.- Instalando Skype"
aptitude -y install skype && clear

echo "14.- Instalando Pidgin"
aptitude -y install pidgin && clear

echo "15.- Configurando menu"
gconftool-2 --type Boolean --set /desktop/gnome/interface/menus_have_icons True && clear

echo "16.- Instalando Dropbox"
echo deb http://linux.dropbox.com/ubuntu lucid main | tee /etc/apt/sources.list.d/dropbox.list && apt-key adv --keyserver pgp.mit.edu --recv-keys 5044912E && aptitude update && aptitude -y install nautilus-dropbox && clear

echo "17.- Instalando servidor ssh"
apt-get -y install openssh-server && clear

echo "18.- Instalando konqueror" 
apt-get -y install konqueror && clear

echo "19.- Instalando KeePassX"
apt-get -y install keepassx && clear

echo "20.- Instalando XChat"
apt-get -y install xchat && clear

echo "21.- Instalando TeamViewer"
apt-get -y install teamviewer && clear

echo "22.- Instalando terminator"
apt-get -y install terminator && clear

echo "23.- Instalando abrir terminal aqui"
apt-get -y install nautilus-open-terminal
nautilus -q

echo "24.- Instalando arpon"
apt-get -y install arpon

echo "25.- Instalando meld"
apt-get -y install meld

clear

echo "Instalacion finalizada."









