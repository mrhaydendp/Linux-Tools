#!/usr/bin/env sh

# Check if Speedtest or Speedtest-cli is Installed
command -v speedtest >/dev/null 2>&1 || { echo >&2 "This application requires Speedtest to be installed, Exiting..."; exit 1; }

# Run 3 Speedtests & Output to Run*.txt w/ Progress Hashes
printf "Running Speedtests...\r"
for i in 1 2 3
do
    [ "$i" = 1 ] && printf "                          (0%%)\r"
    [ "$i" = 2 ] && printf "#####                     (33%%)\r"
    [ "$i" = 3 ] && printf "#############             (66%%)\r"
    speedtest --share > run$i.txt ||
    { echo "Speedtest $i of 3 Failed, Exiting"; exit; }
done
printf "#######################   (100%%)\r"
date=$(date +"%c")
printf "Speedtest Result - %s\n\n" "$date"

# Grab Ping Speeds from Run*.txt & Average them
ping=$(grep "ms" ./run*.txt | awk -F ':' '{print $3}' | awk '{if(min=="")total+=$1; count+=1} END {print total/count}' | awk '{printf("%.2f\n",$1)}')
echo "Average Ping Speed: $ping ms"

# Grab Download Speeds from Run*.txt & Average them
download=$(grep "Download:" ./run*.txt | awk '{print $2}' | awk '{if(min=="")total+=$1; count+=1} END {print total/count}' | awk '{printf("%.2f\n",$1)}')
echo "Average Download Speed: $download Mbps"

# Grab Upload Speeds from Run*.txt & Average them
upload=$(grep "Upload:" ./run*.txt | awk '{print $2}' | awk '{if(min=="")total+=$1; count+=1} END {print total/count}' | awk '{printf("%.2f\n",$1)}')
echo "Average Upload Speed: $upload Mbps"

# View Results on the Web
echo && echo "View Results in the Browser:"
results=$(grep "http://" ./run*.txt | awk '{print $3}' | cut -f 1,2,3 -d ".")
for http in ${results}
do
    echo "- $http"
done
