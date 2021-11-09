# Get Hostname
echo "Your Hostname Is:"
hostname

# Get IP Address
echo "Your IP Address Is:"
hostname -I | awk '{print $1}'

# Get Cpu Info
echo "Your Processor Is:"
sudo lshw -class processor | grep "product:" | awk '{for (i=2; i<NF; i++) printf $i " "; print $NF}'

# Get Distro Name
echo "You Are Running:"
lsb_release -ds

# Get Populated Dimm Slots & Total Memory
populated=$(sudo lshw -class memory | grep "description: SODIMM" | wc -l)
echo "You Have "$populated" Populated Ram Slots With a Total of:"
ram=$(free --giga | grep "Mem:" | awk '{print $2}')
echo ""$ram"GB of Ram"

# Get Device Form Factor
echo "Form Factor:"
sudo lshw -c system | grep "description:" | awk '{print $2}'

# Get Device Vendor & Model
echo "Device:"
vendor=$(sudo lshw -c system | grep "vendor:" | awk '{print $2}')
model=$(sudo dmidecode -t system | grep "Product Name:" | awk '{print $3,$4}')
echo "$vendor" "$model"
