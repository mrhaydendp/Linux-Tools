#!/bin/bash

# Check if Speedtest-cli is installed
if [ $(which speedtest == '*speedtest') ]; then
    echo Speedtest-cli is Installed
else
    echo Speedtest-cli is Not Installed
    sudo apt install speedtest-cli
fi

# Run speedtest & output, wait 30 seconds
speedtest-cli > run1.txt

sleep 30

speedtest-cli > run2.txt

sleep 30

speedtest-cli > run3.txt

# Get ping
arr=( $(cat run* | grep "ms" | awk -F ':' '{print $2}') )

# Average ping
echo "Average Ping (ms):"
echo "(${arr[0]} + ${arr[2]} + ${arr[4]}) / 3" | bc -l | awk '{printf("%.2f\n",$1 + 0.5)}'

# Get download speed
arr=( $(cat run* | grep "Download:") )

# Average download speed
echo "Average Download Speed (Mbps):"
echo "(${arr[1]} + ${arr[4]} + ${arr[7]}) / 3" | bc -l | awk '{printf("%.2f\n",$1 + 0.5)}'

# Get upload speed
arr=( $(cat run* | grep "Upload:") )

# Average upload speed
echo "Average Upload Speed (Mbps):"
echo "(${arr[1]} + ${arr[4]} + ${arr[7]}) / 3" | bc -l | awk '{printf("%.2f\n",$1 + 0.5)}'
