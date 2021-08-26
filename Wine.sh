!bin/Bash

# Wine Installer
codename=$(lsb_release -cs)

# Add 32-bit Architecture
sudo dpkg --add-architecture i386

# Download Repository Key
wget -nc https://dl.winehq.org/wine-builds/winehq.key

# Add Repository Key
sudo apt-key add winehq.key

# Add Repository + Change Codename to Current Distro
sudo add-apt-repository "deb https://dl.winehq.org/wine-builds/ubuntu/ $codename"

# Update Repos && Install Wine
sudo apt update && sudo apt install --install-recommends winehq-stable
