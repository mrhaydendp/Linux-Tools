#!/bin/bash

# Download system76-apt-preferences & Move to Correct Directory
wget https://github.com/mrhaydendp/Linux-Setup-Tools/raw/main/system76-apt-preferences
sudo mv system76-apt-preferences /etc/apt/preferences.d/

# Install Driver App
sudo apt-add-repository -y ppa:system76-dev/stable
sudo apt-get update
sudo apt install system76-driver
