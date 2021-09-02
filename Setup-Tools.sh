#!/bin/bash

# UI
tool=$(zenity --list \
  --title='Linux Setup Tools' \
  --width=620 --height=400 \
  --column='Tool' --column='Description' \
    'Brave Browser' 'Adblocking, privacy respecting browser' \
    'System Tools' 'Collection of tools for monitoring hardware' \
    'Proton-GE' 'Custom version of proton with qol changes' \
    'Lutris' 'Open Source gaming platform for Linux' \
    'Wine' 'Translation layer for running Windows games and apps' \
    'System76 Drivers' 'Driver installer for System76 devices'
    )

echo $tool

if [ "$tool" = 'Brave Browser' ]; then
    sudo apt install apt-transport-https curl
    sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
    echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
    sudo apt update
    sudo apt install brave-browser
    sh Setup-Tools.sh

elif [ "$tool" = 'System Tools' ]; then
    sudo apt install htop neofetch hardinfo

elif [ "$tool" = 'Proton-GE' ]; then
    wget '' && sh Proton-GE-Updater.sh
    sh Setup-Tools.sh

elif [ "$tool" = 'Lutris' ]; then
    sudo add-apt-repository ppa:lutris-team/lutris
    sudo apt-get update && sudo apt install lutris
    sh Setup-Tools.sh

elif [ "$tool" = 'Wine' ]; then
    wget '' && Wine-Installer.sh
    sh Setup-Tools.sh

elif [ "$tool" = 'System76 Drivers' ]; then
    sudo wget -o /etc/apt/preferences.d/system76-apt-preferences https://github.com/mrhaydendp/Linux-Setup-Tools/raw/main/system76-apt-preferences
    sh Setup-Tools.sh

fi