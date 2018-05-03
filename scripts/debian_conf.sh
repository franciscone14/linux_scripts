#!/bin/bash

apt update && sudo apt upgrade -y

# LightDM
apt install lightdm

# Firmware Bluetooth
echo "deb http://httpredir.debian.org/debian/ jessie main contrib non-free" > /etc/apt/sources.list.d/atheros.list
apt update && apt install firmware-atheros && apt install firmware-realtek
apt install blueman

# Latte Dock Dependencies
apt install build-essential cmake extra-cmake-modules libkf5activities-dev libkf5archive-dev libkf5crash-dev libkf5declarative-dev libkf5iconthemes-dev libkf5notifications-dev libkf5plasma-dev libkf5wayland-dev libkf5windowsystem-dev libkf5xmlgui-dev libsm-dev libxcb-util0-dev libqt5x11extras5-dev libx11-xcb-dev gettext -y

# Install Chrome
sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
apt update
apt install google-chrome-stable

# Install Java
echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" | tee /etc/apt/sources.list.d/webupd8team-java.list
echo "deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" | tee -a /etc/apt/sources.list.d/webupd8team-java.list
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys EEA14886
apt update
apt install oracle-java8-installer -y
apt install oracle-java8-set-default -y

# Install git
apt install git -y

# Google Drive - KDE
apt install kio-gdrive -y

# SciLab
apt install scilab -y

# Install LatteDock
cd /opt/
git clone https://github.com/psifidotos/Latte-Dock.git
cd Latte-Dock
git checkout v0.7.0
./install.sh

# Inkscape
apt install inkscape

# Intel Microcode
apt install intel-microcode

# Spotify
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 0DF731E45CE24F27EEEB1450EFDC8610341D9410
echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list
apt-get update
apt-get install spotify-client

# Atom Editor
wget -q -O - https://packagecloud.io/AtomEditor/atom/gpgkey | sudo apt-key add -
sh -c 'echo "deb [arch=amd64] https://packagecloud.io/AtomEditor/atom/any/ any main" > /etc/apt/sources.list.d/atom.list'
apt-get update
apt-get install atom

# Sublime Text
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add 
apt-get install apt-transport-https
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
apt-get update
apt-get install sublime-text

# Mega Client
wget https://mega.nz/linux/MEGAsync/Debian_9.0/amd64/megasync-Debian_9.0_amd64.deb
dpkg -i megasync-Debian_9.0_amd64.deb
apt -f install

# Libre Office Style Breeze
apt install libreoffice-style-breeze

# Dia
apt install dia

# MySQL - Not working on debian testing
echo -e "deb http://repo.mysql.com/apt/debian/ stretch mysql-5.7\ndeb-src http://repo.mysql.com/apt/debian/ stretch mysql-5.7" > /etc/apt/sources.list.d/mysql.list
wget -O /tmp/RPM-GPG-KEY-mysql https://repo.mysql.com/RPM-GPG-KEY-mysql --no-check-certificate
apt-key add /tmp/RPM-GPG-KEY-mysql
apt update
apt install mysql-server

# MariaDB
apt install mariadb-server

# Disable MySQL to start on boot
systemctl disable mysql

# Slack
wget -q https://downloads.slack-edge.com/linux_releases/slack-desktop-3.1.1-amd64.deb
dpkg -i slack-desktop-3.1.1-amd64.deb
apt -f install
rm slack-desktop-3.1.1-amd64.deb

# RAR
apt install rar unrar

# Eclipse IDE
apt install default-jdk default-jre wget -y
wget http://mirror.nbtelecom.com.br/eclipse/oomph/epp/oxygen/R2/eclipse-inst-linux64.tar.gz
tar -xzf eclipse-inst-linux64.tar.gz
cd eclipse-installer
mkdir /opt/eclipse/
mkdir /opt/eclipse/java-oxygen
chmod 777 -R /opt/eclipse/java-oxygen
./eclipse-inst

# VLC
apt install vlc -y

# Torrent Client
apt install deluge
