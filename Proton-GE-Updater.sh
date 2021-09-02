# Format $ver Variable
format=$(curl -s https://api.github.com/repos/GloriousEggroll/proton-ge-custom/releases/latest | grep "name" | grep Proton-* |  cut -d '"' -f 4)
format=$(echo "${current%.*}")
ver=$(echo "${current%.*}")

# Check if Proton is Installed
if [ $(ls ~/.steam/debian-installation/compatibilitytools.d/$ver 2> /dev/null) ]; then # if files named "FOO*" were downloaded 
    echo "Latest Proton is Installed" 
else
    echo "Installing Latest Proton"
    curl -s https://api.github.com/repos/GloriousEggroll/proton-ge-custom/releases/latest | grep "browser_download_url.*tar.gz" | cut -d '"' -f 4 | wget -i -
    mkdir ~/.steam/root/compatibilitytools.d
    tar -xf *.tar.gz -C ~/.steam/root/compatibilitytools.d/ && rm *.tar.gz
    echo "Successfully Installed"
fi