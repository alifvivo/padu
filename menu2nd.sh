#!/bin/bash
# Color Validation
DF='\e[39m'
Bold='\e[1m'
Blink='\e[5m'
Lyell='\e[1;93m'
red='\e[1;31m'
green='\e[1;32m'
blue='\e[1;34m'
PURPLE='\e[1;95m'
cyan='\e[36m'
Lred='\e[1;91m'
Lgreen='\e[92m'
Lyellow='\e[93m'
white='\e[1;37m'
NC='\e[0m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
CYAN='\e[1;36m'
HIBlue="\033[1;94m"
MYIP=$(wget -qO- ipinfo.io/ip);
echo "Checking VPS"
IZIN=$(curl -sS https://raw.githubusercontent.com/alifvivo/ip/main/access | awk '{print $4}' | grep $MYIP)
if [[ $MYIP = $IZIN ]]; then
echo -e "${NC}${GREEN}Permission Accepted...${NC}"
else
echo -e "${NC}${RED}Permission Denied!${NC}";
echo -e "${NC}${Lyellow}Please Contact Admin!!"
fi
clear
# VPS Information
Checkstart1=$(ip route | grep default | cut -d ' ' -f 3 | head -n 1);
if [[ $Checkstart1 == "venet0" ]]; then
    clear
	  lan_net="venet0"
    typevps="OpenVZ"
else
    clear
		lan_net="eth0"
    typevps="PREMIUM"
fi
clear
# DNS Patch
tipeos2=$(uname -m)
# OS Uptime
uptime="$(uptime -p | cut -d " " -f 2-10)"
# Download
#Download/Upload today
dtoday="$(vnstat -i eth0 | grep "today" | awk '{print $2" "substr ($3, 1, 1)}')"
utoday="$(vnstat -i eth0 | grep "today" | awk '{print $5" "substr ($6, 1, 1)}')"
ttoday="$(vnstat -i eth0 | grep "today" | awk '{print $8" "substr ($9, 1, 1)}')"
#Download/Upload yesterday
dyest="$(vnstat -i eth0 | grep "yesterday" | awk '{print $2" "substr ($3, 1, 1)}')"
uyest="$(vnstat -i eth0 | grep "yesterday" | awk '{print $5" "substr ($6, 1, 1)}')"
tyest="$(vnstat -i eth0 | grep "yesterday" | awk '{print $8" "substr ($9, 1, 1)}')"
#Download/Upload current month
dmon="$(vnstat -i eth0 -m | grep "`date +"%b '%y"`" | awk '{print $3" "substr ($4, 1, 1)}')"
umon="$(vnstat -i eth0 -m | grep "`date +"%b '%y"`" | awk '{print $6" "substr ($7, 1, 1)}')"
tmon="$(vnstat -i eth0 -m | grep "`date +"%b '%y"`" | awk '{print $9" "substr ($10, 1, 1)}')"

source /etc/os-release
Versi_OS=$VERSION
ver=$VERSION_ID
Tipe=$NAME
URL_SUPPORT=$HOME_URL
basedong=$ID
ISP=$(curl -s ipinfo.io/org | cut -d " " -f 2-10 )
CITY=$(curl -s ipinfo.io/city )
WKT=$(curl -s ipinfo.io/timezone )
domain=$(cat /etc/v2ray/domain)
Sver=$(cat /home/version)
DAY=$(date +%A)
DATE=$(date +%m/%d/%Y)
IPVPS=$(curl -s ipinfo.io/ip )
	freq=$( awk -F: ' /cpu MHz/ {freq=$2} END {print freq}' /proc/cpuinfo )
	tram=$( free -m | awk 'NR==2 {print $2}' )
	uram=$( free -m | awk 'NR==2 {print $3}' )
	fram=$( free -m | awk 'NR==2 {print $4}' )
	swap=$( free -m | awk 'NR==4 {print $2}' )
name=$(curl -sS https://raw.githubusercontent.com/alifvivo/ip/main/access | grep $IPVPS | awk '{print $2}')
exp=$(curl -sS https://raw.githubusercontent.com/alifvivo/ip/main/access | grep $IPVPS | awk '{print $3}')
clear
echo ""
echo -e "\e[36m                                                            \e[0m"
echo -e "\e[36m ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "             • SCRIPT BY PAKYAVPN •"
echo -e "\e[36m ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e " $green VPS Type             : $typevps"$NC
echo -e " $green CPU Model            :$cname"$NC
echo -e " $green CPU Frequency        :$freq MHz"$NC
echo -e " $green Number Of Cores      : $cores"$NC
echo -e " $green CPU Usage            : $cpu_usage"$NC
echo -e " $green Operating System     : "`hostnamectl | grep "Operating System" | cut -d ' ' -f5-`$NC
echo -e " $green Kernel               : `uname -r`"$NC
echo -e " $green Bash Ver             : $versibash"$NC
echo -e " $green ISP NAME             : $ISP"$NC
echo -e " $green IP VPS               : $IPVPS"$NC
echo -e " $green DOMAIN               : $domain"$NC
echo -e " $green City                 : $CITY"$NC
echo -e " $green SERVER               : $ISP"$NC
echo -e " $green Script Version       :$Sver"$NC
echo -e " $green Client Name          : $name"$NC
echo -e " $green Expired On           : $exp"$NC
echo -e " $green Expired In           : $remain Days"$NC
echo -e " $green Provided By          : $username $NC"
echo -e "\e[36m ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\e[36m Traffic\e[0m       \e[36mToday      Yesterday     Month   "
echo -e "\e[36m Download\e[0m      $dtoday    $dyest       $dmon   \e[0m"
echo -e "\e[36m Upload\e[0m        $utoday      $uyest       $umon   \e[0m"
echo -e "\e[36m Total\e[0m       \033[0;36m  $ttoday    $tyest       $tmon  \e[0m "
echo -e "\e[36m ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "             • SCRIPT MENU, DASHBOARD•"
echo -e "\e[36m ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e " [\e[36m•1\e[0m] SSH & OpenVPN Menu    [\e[36m•7\e[0m] System Menu"
echo -e " [\e[36m•2\e[0m] Wireguard Menu        [\e[36m•8\e[0m] Change Port"
echo -e " [\e[36m•3\e[0m] Vmess & Vless Menu         [\e[36m•9\e[0m] MENU THEMES"
echo -e " [\e[36m•4\e[0m] Trojan Menu    [\e[36m10\e[0m] INFO ALL PORT"
echo -e " [\e[36m•5\e[0m] SSR & SS Menu           [\e[36m11\e[0m] Exit REBOOT"
echo -e " [\e[36m•6\e[0m] L2TP, PPTP, SSTP           [\e[31m12\e[0m] \e[31mCHECK RUNNING SC\033[0m"
echo -e   ""
echo -e   " Press x or [ Ctrl+C ] • To-Exit-Script"
echo -e   ""
echo -e "\e[36m ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e " $Lyellow Premium VPS by $username"$NC
echo -e " $Lyellow Thank you for using script by PAKYAVPN"$NC
echo -e "\e[36m ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e ""
read -p "  Select From Options [1-10 or x] :  "  opt
echo -e   ""
case $opt in
1)
menu-ssh
;;
2)
menu-wg
;;
3)
menu-v2ray
;;
4)
menu-trojan
;;
5)
menu-ssr
;;
6)
menu-pptp
;;
7)
system-menu
;;
8)
change-port
;;
9)
menu-change
;;
10)
ram
;;
11)
reboot
;;
12)
running
;;
x)
clear
exit
;;
*)
echo " Tolong masukkan nombor yang betul!!"
sleep 2 
menu
;;
esac