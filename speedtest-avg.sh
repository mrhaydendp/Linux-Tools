#!/usr/bin/env bash

# Check if Speedtest-CLI is Installed
[ -z != $(command -v speedtest) ] ||
    { echo "Speedtest-CLI is Not Installed"; exit; } &&
    echo "Running Speedtests..."

# Run 3 Speedtests & Output to Run*.txt w/ Progress Hashes 
for i in 1 2 3
do
    [ "$i" = 1 ] && echo -ne '                          (0%)\r'
    [ "$i" = 2 ] && echo -ne '#####                     (33%)\r'
    [ "$i" = 3 ] && echo -ne '#############             (66%)\r'
    speedtest-cli > run$i.txt
done
echo -ne '#######################   (100%)\r'
echo -ne '\n'

# Calculate Average Ping Time & Display
arr=($(grep "ms" ./run*.txt | awk -F ':' '{print $3}')) &&
Ping=$(echo "(${arr[0]} + ${arr[2]} + ${arr[4]}) / 3" | bc -l | awk '{printf("%.2f\n",$1)}')
echo "Average Ping: $Ping ms"

# Calculate Average Download Speed & Display
arr=( $(grep "Download:" ./run*.txt) )
Download=$(echo "(${arr[1]} + ${arr[4]} + ${arr[7]}) / 3" | bc -l | awk '{printf("%.2f\n",$1)}')
echo "Average Download Speed: $Download Mbps"

# Calculate Average Upload Speed & Display
arr=( $(grep "Upload:" ./run*.txt) )
Upload=$(echo "(${arr[1]} + ${arr[4]} + ${arr[7]}) / 3" | bc -l | awk '{printf("%.2f\n",$1)}')
echo "Average Upload Speed: $Upload Mbps"
