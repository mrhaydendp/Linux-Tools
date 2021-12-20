#!/usr/bin/env bash

# Software
echo -e "Software: \n"

# Get Hostname
echo "Hostname: $(hostname)"

# Get IP Address
echo "Ip Address: $(hostname -I | awk '{print $1}')"

# Get Distro Name
echo -e "Distro: $(lsb_release -ds) \n"

# Hardware
echo -e "Hardware: \n"

# Get Populated Dimm Slots & Total Memory
populated=$(sudo lshw -class memory | grep -c "description: SODIMM")
per=$(echo "$(free --giga | grep "Mem:" | awk '{print $2}') / $(sudo lshw -class memory | grep -c "description: SODIMM")" | bc)
echo Ram: "$populated"x "$per"GB

# Get Cpu Info
echo "Processor: $(sudo lshw -class processor | grep "product:" | awk '{for (i=2; i<NF; i++) printf $i " "; print $NF}')"

# Get Device Form Factor
echo "Form Factor: $(sudo lshw -c system | grep "description:" | awk '{print $2}')"

# Get Device Vendor & Model
vendor=$(sudo lshw -c system | grep "vendor:" | awk '{print $2}')
model=$(sudo dmidecode -t system | grep "Product Name:" | awk '{print $3,$4}')
echo "Device: $vendor $model"
