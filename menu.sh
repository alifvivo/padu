#!/bin/bash
RED='\e[1;31m'
green='\e[0;32m'
BLUE='\e[0;34m'
BGRED='\e[1;41m'
BGGREEN='\e[1;42m'
BGYELLOW='\e[1;43m'
BGBLUE='\e[1;44m'
NC='\e[0m'
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
echo -e "   $green TIME                 :$NC  $jam"
echo -e "   $green DAY                  :$NC  $hari"
echo -e "   $green DATE                 :$NC  $tnggl"
echo -e "   $green SERVER               :$NC  $ISP"
echo -e "   $green City                 :$NC  $CITY"
echo -e "   $green IP VPS               :$NC  $IPVPS"
echo -e "   $green DOMAIN               :$NC  $domain"
echo -e ""
echo -e  " ══════════════════════════════════════════════════════════════════" | lolcat
echo -e " ${BGBLUE}                     PREMIUM SCRIPT                               ${NC}"
echo -e  " ══════════════════════════════════════════════════════════════════" | lolcat
figlet WANVPN | lolcat
figlet AutoScript | lolcat 
  echo -e  "  ╔══════════════════════════════════════════════════════════════════╗" | lolcat
  echo -e  "  ║${BGBLUE}                         ┃ VPS MENU ┃                             ${NC}║"
  echo -e  "  ╠══════════════════════════════════════════════════════════════════╝" | lolcat
  echo -e  "  ║"
  echo -e  "  ║   [ 1 ] ► >>  SSH & OVPN PANEL "
  echo -e  "  ║   [ 2 ] ► >>  WIREGUARD PANEL "
  echo -e  "  ║   [ 3 ] ► >>  L2TP PANEL "
  echo -e  "  ║   [ 4 ] ► >>  PPTP PANEL "
  echo -e  "  ║   [ 5 ] ► >>  SSTP PANEL "
  echo -e  "  ║   [ 6 ] ► >>  SSR PANEL "
  echo -e  "  ║   [ 7 ] ► >>  SS PANEL "
  echo -e  "  ║   [ 8 ] ► >>  VMESS PANEL "
  echo -e  "  ║   [ 9 ] ► >>  VLESS PANEL "
  echo -e  "  ║   [ 10 ] ► >> XRAY PANEL "
  echo -e  "  ║   [ 11 ] ► >> TROJAN PANEL "
  echo -e  "  ╔══════════════════════════════════════════════════════════════════╗" | lolcat
  echo -e  "  ║${BGBLUE}                          ┃ SISTEM MENU ┃                         ${NC}║"
  echo -e  "  ╠══════════════════════════════════════════════════════════════════╝" | lolcat
  echo -e  "  ║   [ 12 ] ► >>  Add New Subdomain     [ 20 ] ► >>  Limit Bandwith "
  echo -e  "  ║   [ 13 ] ► >>  Renew Certificate     [ 21 ] ► >>  Check Usage "
  echo -e  "  ║   [ 14 ] ► >>  Change Port           [ 22 ] ► >>  Reboot VPS "
  echo -e  "  ║   [ 15 ] ► >>  Autobackup Data       [ 23 ] ► >>  Speedtest VPS "
  echo -e  "  ║   [ 16 ] ► >>  Backup Data VPS       [ 24 ] ► >>  Update Script "
  echo -e  "  ║   [ 17 ] ► >>  Restore Data VPS      [ 25 ] ► >>  Displaying System "
  echo -e  "  ║   [ 18 ] ► >>  Webmin Menu           [ 26 ] ► >>  Info Script Auto "
  echo -e  "  ║   [ 19 ] ► >>  Update To Kernel      [ 27 ] ► >>  Show System Status "
  echo -e  "  ║"
  echo -e  "  ║   [ x ] ► >>  Exit "
  echo -e  "  ║"
  echo -e  "  ╠══════════════════════════════════════════════════════════════════╗" | lolcat
  echo -e  "  ║${BGBLUE}                 AutoScript Premium By PakyaVPN                   ${NC}║"
  echo -e  "  ╚══════════════════════════════════════════════════════════════════╝" | lolcat
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
exit
menu
;;
*)
echo " Tolong masukkan nombor yang betul!!"
;;
esac
