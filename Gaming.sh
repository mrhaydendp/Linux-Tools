#!/bin/bash

# Gaming + Tools

echo Installing Steam & Proton-GE
sudo apt install steam
steam
curl -s https://api.github.com/repos/GloriousEggroll/proton-ge-custom/releases/latest | grep "browser_download_url.*tar.gz" | cut -d '"' -f 4 | wget -i -
mkdir ~/.steam/root/compatibilitytools.d
tar -xf *.tar.gz -C ~/.steam/root/compatibilitytools.d/

echo Installing Lutris
sudo add-apt-repository ppa:lutris-team/lutris
sudo apt-get update && sudo apt install lutris
sudo -i
echo dev.i915.perf_stream_paranoid=0 > /etc/sysctl.d/60-mdapi.conf
