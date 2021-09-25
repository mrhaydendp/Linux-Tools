#!/bin/bash

# Check if Speedtest-cli is installed
if [ $(which speedtest == '*speedtest') ]; then
    echo Speedtest-CLI is Installed
else
    echo Speedtest-CLI is Not Installed
    exit
fi

# Run speedtests & output then wait 30 seconds
echo -ne '                          (0%)\r'
speedtest-cli > run1.txt
sleep 30
echo -ne '#####                     (33%)\r'
speedtest-cli > run2.txt
sleep 30
echo -ne '#############             (66%)\r'
speedtest-cli > run3.txt
echo -ne '#######################   (100%)\r'
echo -ne '\n'

# Get ping from run*.txt
arr=( $(cat run* | grep "ms" | awk -F ':' '{print $2}') )

# Average ping
echo "Average Ping (ms):"
echo "(${arr[0]} + ${arr[2]} + ${arr[4]}) / 3" | bc -l | awk '{printf("%.2f\n",$1 + 0.5)}'

# Get download speed from run*.txt
arr=( $(cat run* | grep "Download:") )

# Average download speed
echo "Average Download Speed (Mbps):"
echo "(${arr[1]} + ${arr[4]} + ${arr[7]}) / 3" | bc -l | awk '{printf("%.2f\n",$1 + 0.5)}'

# Get upload speed from run*.txt
arr=( $(cat run* | grep "Upload:") )

# Average upload speed
echo "Average Upload Speed (Mbps):"
echo "(${arr[1]} + ${arr[4]} + ${arr[7]}) / 3" | bc -l | awk '{printf("%.2f\n",$1 + 0.5)}'
