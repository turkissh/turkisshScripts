#!/bin/bash

clear
user=`whoami`
if [ "$user" != "root" ] ; then
clear
echo
echo "ROOT PRIVILEGES REQUIRED"
read
exit
fi


echo -e "\n		Prec0n v0.2		    \n"
echo -e "Listing interfaces:\n"
arpon -l | grep "dev" | awk '{print $3;}'
read -p "Select iface to fake mac (ej. wlan0, eth0): " iface 

echo -e "--------------------------------------------------------\n"

echo -e "Turning interface down\n"
ifconfig $iface down
sleep 5
echo "Facking mac address"
macchanger -r $iface
echo -e "\nMac address changed"
ifconfig $iface up
sleep 5
clear
echo 	"		Please connect to a net				"
read -p "		Waiting for a key to continue		" key

echo -e "\n--------------------------------------------------------\nLaunching ARPON\n"

arpon -i $iface -d 

echo "                                        TurKissh"
