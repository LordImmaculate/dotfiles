
#!/usr/bin/zsh

ADAPTER=$(ip route | grep default | awk '{print $5}')
if [[ $ADAPTER == w* ]]; then
	SSID=$(echo 'station wlan0 show' | iwctl | awk '/Connected network/ {for (i=1; i<=NF; i++) if ($i == "network") {print $(i+1); for (j=i+2; j<=NF; j++) printf " %s", $j; print ""; break}}')
	echo "$ADAPTER:" $SSID
else
	echo $ADAPTER
fi
