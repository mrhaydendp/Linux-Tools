#!/bin/bash

# Check if Steam is Installed
if [ $(which steam == '*steam') ]; then
    # Format $ver Variable
    format=$(curl -s https://api.github.com/repos/GloriousEggroll/proton-ge-custom/releases/latest | grep "name" | grep Proton-* |  cut -d '"' -f 4)
    format=$(echo "${current%.*}")
    ver=$(echo "${current%.*}")
    # Check if Latest Proton is Installed
    if [ $(ls ~/.steam/root/compatibilitytools.d/$ver 2> /dev/null) ]; then
        echo "Latest Proton is Installed" 
    else
        # Install Latest Proton-GE From GitHub Page & Move to .steam/root/compatibilitytools.d/
        echo "Installing Latest Proton"
        curl -s https://api.github.com/repos/GloriousEggroll/proton-ge-custom/releases/latest | grep "browser_download_url.*tar.gz" | cut -d '"' -f 4 | wget -i -
        mkdir ~/.steam/root/compatibilitytools.d
        tar -xf *.tar.gz -C ~/.steam/root/compatibilitytools.d/ && rm *.tar.gz
        echo "Successfully Installed"
    fi
else
    echo "Steam not Installed"
    exit
fi
