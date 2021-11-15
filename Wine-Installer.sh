#!/bin/bash

# Check if Wine is Installed
[ "$(command -v wine)" = "/usr/bin/wine" ] &&
    echo "Wine is Already Installed" && exit
[ "$(command -v wine)" = "/usr/bin/wine" ] ||
    echo "Installing Wine" &&
    # Get Distros Codename
    codename=$(lsb_release -cs) &&
    # Add 32-bit Architecture
    sudo dpkg --add-architecture i386 &&
    # Download Repository Key
    wget -nc https://dl.winehq.org/wine-builds/winehq.key &&
    # Add Repository Key
    sudo apt-key add winehq.key &&
    # Add Repository + Change Codename to Current Distro
    sudo add-apt-repository "deb https://dl.winehq.org/wine-builds/ubuntu/ $codename main" &&
    # Install Wine
    sudo apt install --install-recommends winehq-stable -y &&
    echo 'Successfuly Installed Wine'
