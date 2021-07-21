# Linux Setup Tools
### Culmination of applications and scripts to setup Linux to your liking

- [Gaming](https://github.com/mrhaydendp/Linux-Setup-Tools/blob/main/README.md#gaming)
- [Applications](https://github.com/mrhaydendp/Linux-Setup-Tools/blob/main/README.md#applications)
- [System76 Driver](https://github.com/mrhaydendp/Linux-Setup-Tools/blob/main/README.md#drivers)
- [Updater](https://github.com/mrhaydendp/Linux-Setup-Tools/blob/main/README.md#updates)

## Gaming
### Lutris
```
sudo add-apt-repository ppa:lutris-team/lutris
sudo apt update
sudo apt install lutris
```
### Proton GE
#### Download latest release from this [link](https://github.com/GloriousEggroll/proton-ge-custom/releases)
```
mkdir ~/.steam/root/compatibilitytools.d/
cd Downloads/
tar -xf ./Proton*.tar.gz -C ~/.steam/root/compatibilitytools.d/
```
#### Open Steam and select Proton-GE

### Wine
#### For 21.04 (replace 'hirsute' with other Ubuntu codenames for other versions)
```
sudo dpkg --add-architecture i386
wget -nc https://dl.winehq.org/wine-builds/winehq.key
sudo apt-key add winehq.key
sudo add-apt-repository 'deb https://dl.winehq.org/wine-builds/ubuntu/ hirsute main'
sudo apt-get update && sudo apt-get install --install-recommends winehq-staging
```

### Steam
#### Install .deb file from [link](https://cdn.akamai.steamstatic.com/client/installer/steam.deb) and open in eddy

## Applications
### Brave
```
sudo apt install apt-transport-https curl

sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg

echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list

sudo apt update && sudo apt install brave-browser
```

### Auto-cpufreq
#### Get the source code and run the installer
```
git clone https://github.com/AdnanHodzic/auto-cpufreq.git
cd auto-cpufreq && sudo ./auto-cpufreq-installer
```
#### Install the auto-cpufreq daemon
```
sudo auto-cpufreq --install
```
#### Auto-cpufreq will take effect upon restart

### Tlp
#### Install tlp with current dependencies
```
sudo apt install tlp tlp-rdw --no-install-recommends
```
#### Tlp will take effect upon restart

## Drivers
### System76 Drivers
#### Create the apt preferences file:
```
sudo gedit /etc/apt/preferences.d/system76-apt-preferences
```

#### Add the following lines and click save:
```
Package: *
Pin: release o=LP-PPA-system76-dev-stable
Pin-Priority: 1001

Package: *
Pin: release o=LP-PPA-system76-dev-pre-stable
Pin-Priority: 1001
```

#### To install the Driver run the following commands in the Terminal:
```
sudo apt-add-repository -y ppa:system76-dev/stable
sudo apt-get update
sudo apt install system76-driver
```

## Updates
#### Use this to update distro and remove old unused dependencies
```
sudo apt update && sudo apt full-upgrade
```
