#!/bin/bash

# Check if Steam is Installed
[ -z "$(command -v steam)" ] &&
    echo "Steam Isn't Installed" && exit
[ -z "$(command -v steam)" ] ||
    # Get Latest Proton Version
    latest=$(curl -s https://api.github.com/repos/GloriousEggroll/proton-ge-custom/releases/latest | grep -m 1 Proton |  cut -d '"' -f 4 | awk '{print $1}') &&
    # Check if Latest Proton is Installed
    [ -z "$(find ~/.steam/root/compatibilitytools.d/"$latest" 2> /dev/null)" ] ||
        echo "Latest Proton is Installed"
    [ -z "$(find ~/.steam/root/compatibilitytools.d/"$latest" 2> /dev/null)" ] &&
        # Install Latest Proton-GE From GitHub Page & Move to .steam/root/compatibilitytools.d/
        echo "Installing Latest Proton" &&
        curl -s https://api.github.com/repos/GloriousEggroll/proton-ge-custom/releases/latest | grep "browser_download_url.*tar.gz" | cut -d '"' -f 4 | wget -i - &&
        mkdir ~/.steam/root/compatibilitytools.d 2> /dev/null
        tar -xf ./*.tar.gz -C ~/.steam/root/compatibilitytools.d/ && rm ./*.tar.gz &&
        echo "Successfully Installed"
