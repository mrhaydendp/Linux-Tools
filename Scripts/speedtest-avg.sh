if [ $(which speedtest == '*speedtest') ]; then
    echo Speetest-cli is installed
else
    echo Speedtest-cli is not installed, installing now
    sudo apt install speedtest-cli -y
fi

speedtest > run1.txt

sleep 30

speedtest > run2.txt

sleep 30

speedtest > run3.txt

arr=( $(cat run* | grep "Download:") )

echo "Download Speed (Mbps):"
echo "(${arr[1]} + ${arr[4]} + ${arr[7]}) / 3" | bc -l | awk '{printf("%.2f\n",$1 + 0.5)}'

arr=( $(cat run* | grep "Upload:") )

echo "Upload Speed (Mbps):"
echo "(${arr[1]} + ${arr[4]} + ${arr[7]}) / 3" | bc -l | awk '{printf("%.2f\n",$1 + 0.5)}'
