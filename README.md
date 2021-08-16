# Linux Setup Tools
A culmination of applications and utilities to setup laptop and desktops.

# Contents
- [Applications](https://github.com/mrhaydendp/Linux-Setup-Tools/blob/main/README.md#applications)
- [Gaming](https://github.com/mrhaydendp/Linux-Setup-Tools/blob/main/README.md#gaming)
- [Utilities](https://github.com/mrhaydendp/Linux-Setup-Tools/blob/main/README.md#utilities)

## Applications

### Brave
Install repo and keys then install Brave
```
sudo apt install apt-transport-https curl

sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg

echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list

sudo apt update

sudo apt install brave-browser
```

### VSCodium
Install latest release and install using dpkg
```
curl -s https://api.github.com/repos/VSCodium/vscodium/releases/latest | grep "browser_download_url.*amd64.deb" | cut -d '"' -f 4 | wget -i -
sudo dpkg -i *.deb
```

## Gaming

### Steam
Install steam
```
sudo apt install steam
```

### Lutris
Add repo
```
sudo add-apt-repository ppa:lutris-team/lutris
```
Update repos and install Lutris
```
sudo apt update && sudo apt install lutris
```
If you get MESA-INTEL: warning: Performance support disabled, consider sysctl dev.i915.perf_stream_paranoid=0 error do this:
```
sudo -i
echo dev.i915.perf_stream_paranoid=0 > /etc/sysctl.d/60-mdapi.conf
```

### Proton-GE
```
curl -s https://api.github.com/repos/GloriousEggroll/proton-ge-custom/releases/latest | grep "browser_download_url.*tar.gz" | cut -d '"' -f 4 | wget -i -
mkdir ~/.steam/root/compatibilitytools.d
tar -xf *.tar.gz -C ~/.steam/root/compatibilitytools.d/
```

## Utilities

### Tlp
```
sudo apt install tlp tlp-rdw --no-install-recommends
```

### Gnome Sushi
```
sudo apt install gnome-sushi
```

### Wine
Enable 32 bit support
```
sudo dpkg --add-architecture i386
```
Download and add repo key
```
wget -nc https://dl.winehq.org/wine-builds/winehq.key
sudo apt-key add winehq.key
```
Add the repo (replace hirsute main with Ubuntu codename)
```
sudo add-apt-repository 'deb https://dl.winehq.org/wine-builds/ubuntu/ hirsute main'
```
update repos and install Wine
```
sudo apt update && sudo apt install --install-recommends winehq-stable
```

### System76 Drivers
Create the apt preferences file
```
sudo gedit /etc/apt/preferences.d/system76-apt-preferences
```
Add the following six lines:
```
Package: *
Pin: release o=LP-PPA-system76-dev-stable
Pin-Priority: 1001

Package: *
Pin: release o=LP-PPA-system76-dev-pre-stable
Pin-Priority: 1001
```
Install driver
```
sudo apt-add-repository -y ppa:system76-dev/stable
sudo apt-get update
sudo apt install system76-driver
```

## Update & Clean
```
sudo apt update && sudo apt full-upgrade
sudo apt autoclean
```
