#!/usr/bin/env bash

# Check if Wine is Installed
[ "$(command -v wine)" = "/usr/bin/wine" ] &&
    echo "Wine is Already Installed" && exit
[ "$(command -v wine)" = "/usr/bin/wine" ] ||
    echo "Installing Wine" &&
    # Add 32-bit Architecture
    sudo dpkg --add-architecture i386 &&
    # Download Repository Key
    wget -nc https://dl.winehq.org/wine-builds/winehq.key &&
    # Add Repository Key
    sudo apt-key add winehq.key &&
    # Add Repository + Change Codename to Current Distros Ubuntu Codename
    sudo add-apt-repository "deb https://dl.winehq.org/wine-builds/ubuntu/ $(grep "UBUNTU" /etc/os-release | cut -f 2 -d "=") main" &&
    # Install Wine
    sudo apt install --install-recommends winehq-stable -y &&
    echo "Successfuly Installed Wine"
