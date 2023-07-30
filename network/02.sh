#!/bin/sh
# Exercise: Identify and display the Ethernet interface characteristics:
# (a) Identify broadcast address
# (b) Identify all IP adresses which are part of the same subnet

DEVICE=$(networksetup -listallhardwareports | 
awk 'BEGIN {TMP="-"; DEV=" "}
{
	if ($1 == "Hardware" && $2 == "Port:") {TMP = $3} 
	if (TMP == "Ethernet" && $1 == "Device:") {DEV = $2}
} 
END{print DEV}')

BROADCAST=$(ifconfig $DEVICE | grep broadcast | awk '{print $NF}')
echo "Broadcast address: $BROADCAST"
echo "IP addresses which are part of subnet:"
ping -G 6 $BROADCAST | grep icmp_seq=4 | tr -d ':' | awk '{print $4}' | uniq | sort | column
