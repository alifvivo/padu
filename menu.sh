#!/bin/bash
green='\e[32m'
RED='\033[0;31m'
NC='\033[0m'
BGBLUE='\e[1;44m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0;37m'
clear
echo -e ""
ISP=$(curl -s ipinfo.io/org | cut -d " " -f 2-10 )
CITY=$(curl -s ipinfo.io/city )
WKT=$(curl -s ipinfo.io/timezone )
IPVPS=$(curl -s ipinfo.io/ip )
jam=$(date +"%T")
hari=$(date +"%A")
tnggl=$(date +"%d-%B-%Y")
domain=$(cat /etc/v2ray/domain)
clear
echo -e ""
figlet TRICKSTERMODE | lolcat
figlet AutoScript | lolcat 
echo -e "${ORANGE}════════════════════════════════════════════════════════════${NC}"
echo -e "${BGBLUE}                      SERVER INFORMATION                    ${NC}"
echo -e "${ORANGE}════════════════════════════════════════════════════════════${NC}"
echo -e "$green TIME                 :$jam"$NC
echo -e "$green DAY                  :$hari"$NC
echo -e "$green DATE                 :$tnggl"$NC
echo -e "$green SERVER               :$ISP"$NC
echo -e "$green City                 :$CITY"$NC
echo -e "$green IP VPS               :$IPVPS"$NC
echo -e "$green DOMAIN               :$domain"$NC
echo -e "${ORANGE}════════════════════════════════════════════════════════════${NC}"
echo -e "${BGBLUE}                     [ MAIN MENU ]                          ${NC}"
echo -e "${ORANGE}════════════════════════════════════════════════════════════${NC}"
echo -e "$green (•1) $NC PANEL SSH & OPENVPN"
echo -e "$green (•2) $NC PANEL WIREGUARDS"
echo -e "$green (•3) $NC PANEL L2TP "
echo -e "$green (•4) $NC PANEL PPTP "
echo -e "$green (•5) $NC PANEL SSTP "
echo -e "$green (•6) $NC PANEL SSR "
echo -e "$green (•7) $NC PANEL SS "
echo -e "$green (•8) $NC PANEL VMESS "
echo -e "$green (•9) $NC PANEL VLESS "
echo -e "$green (10) $NC PANEL XRAY "
echo -e "$green (11) $NC PANEL TROJAN "
echo -e "${ORANGE}════════════════════════════════════════════════════════════${NC}"
echo -e "${BGBLUE}                     [ SISTEM MENU ]                        ${NC}"
echo -e "${ORANGE}════════════════════════════════════════════════════════════${NC}"
echo -e "$green (•12) $NC ADD NEW SUBDOMAIN     $green (•20) $NC Limit Bandwith "
echo -e "$green (•13) $NC RENEW CERTIFICATE     $green (•21) $NC Check Usage "
echo -e "$green (•14) $NC CHANGE PORT           $green (•22) $NC Reboot VPS "
echo -e "$green (•15) $NC AUTOBACKUP DATA       $green (•23) $NC Speedtest VPS "
echo -e "$green (•16) $NC BACKUP DATA VPS       $green (•24) $NC Update Script "
echo -e "$green (•17) $NC Restore Data Vps      $green (•25) $NC Displaying System "
echo -e "$green (•18) $NC WEBMIN MENU           $green (•26) $NC Info Script Auto "
echo -e "$green (•19) $NC UPDATE TO KERNEL      $green (•27) $NC Show System Status "
echo -e "${ORANGE}════════════════════════════════════════════════════════════${NC}"
echo -e " Premium VPS by @TricksterMode
echo -e " Thank you for using script by PAKYAVPN"
echo -e "${ORANGE}════════════════════════════════════════════════════════════${NC}"
echo -e   ""
echo -e "[Ctrl + C] For exit from main menu"
echo -e   ""
read -p "     Select From Options [1-27 or x] :  " menu
echo -e ""
case $menu in
1)
menu-ssh
;;
2)
menu-wg
;;
3)
menu-l2tp
;;
4)
menu-pptp
;;
5)
menu-sstp
;;
6)
menu-ssr
;;
7)
menu-ss 
;;
8)
menu-vmess
;;
9)
menu-vless 
;;
10)
menu-xray 
;;
11)
menu-trojan 
;;
12)
add-host
;;
13)
certv2ray
;;
14)
change-port
;;
15)
autobackup
;;
16)
backup
;;
17)
restore
;;
18)
wbmn
;;
19)
kernel-updt
;;
20)
limit-speed
;;
21)
ram
;;
22)
reboot
;;
23)
speedtest-cli
;;
24)
update
;;
25)
info
;;
26)
about
;;
27)
running
;;
x)
clear
menu
;;
*)
echo " Tolong masukkan nombor yang betul!!"
;;
esac
