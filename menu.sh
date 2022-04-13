#!/bin/bash
Lred='\e[1;91m'
LGREEN='\e[92m'
Lyellow='\e[93m'
GREEN='\e[32m'
RED='\033[0;31m'
NC='\033[0m'
BGBLUE='\e[1;44m'
BGWHITE='\e[0;47;30m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0;37m'
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
    sleep 1
else
    clear
		lan_net="eth0"
    typevps="premium"
    sleep 1
fi
clear
# DNS Patch
tipeos2=$(uname -m)
# OS Uptime
uptime="$(uptime -p | cut -d " " -f 2-10)"
# Download
download=`grep -e "lo:" -e "wlan0:" -e "eth0" /proc/net/dev  | awk '{print $2}' | paste -sd+ - | bc`
downloadsize=$(($download/1073741824))
# Upload
upload=`grep -e "lo:" -e "wlan0:" -e "eth0" /proc/net/dev | awk '{print $10}' | paste -sd+ - | bc`
uploadsize=$(($upload/1073741824))
# Getting CPU Information
cpu_usage1="$(ps aux | awk 'BEGIN {sum=0} {sum+=$3}; END {print sum}')"
cpu_usage="$((${cpu_usage1/\.*} / ${corediilik:-1}))"
cpu_usage+=" %"
# Shell Version
shellversion=""
shellversion=Bash
shellversion+=" Version" 
shellversion+=" ${BASH_VERSION/-*}" 
versibash=$shellversion
# Getting OS Information
source /etc/os-release
Versi_OS=$VERSION
ver=$VERSION_ID
Tipe=$NAME
URL_SUPPORT=$HOME_URL
basedong=$ID
ISP=$(curl -s ipinfo.io/org | cut -d " " -f 2-10 )
CITY=$(curl -s ipinfo.io/city )
WKT=$(curl -s ipinfo.io/timezone )
IPVPS=$(curl -s ipinfo.io/ip )
domain=$(cat /etc/v2ray/domain)
Sver=$(cat /home/version)
	cname=$( awk -F: '/model name/ {name=$2} END {print name}' /proc/cpuinfo )
	cores=$( awk -F: '/model name/ {core++} END {print core}' /proc/cpuinfo )
	freq=$( awk -F: ' /cpu MHz/ {freq=$2} END {print freq}' /proc/cpuinfo )
	tram=$( free -m | awk 'NR==2 {print $2}' )
	uram=$( free -m | awk 'NR==2 {print $3}' )
	fram=$( free -m | awk 'NR==2 {print $4}' )
	swap=$( free -m | awk 'NR==4 {print $2}' )
name=$(curl -sS https://raw.githubusercontent.com/alifvivo/ip/main/access | grep $IPVPS | awk '{print $2}')
exp=$(curl -sS https://raw.githubusercontent.com/alifvivo/ip/main/access | grep $IPVPS | awk '{print $3}')
modifyTime1=$(date +%s -d "${exp}")
currentTime=$(date +%s)
stampDiff=$(expr ${currentTime} - ${modifyTime1})
days=$(expr ${stampDiff} / 86400)
remainingDays=$(expr 90 - ${days})
remain=${remainingDays}
if [[ ${remainingDays} -le 0 ]]; then
	remain="expired"
fi
clear
echo -e ""
echo -e "$RED ██████╗ ██████╗ ██╗   ██╗ ██████╗ ██╗   ██╗██████╗ ███╗   ██╗$NC"
echo -e "$RED ██╔══██╗██╔══██╗██║   ██║██╔════╝ ██║   ██║██╔══██╗████╗  ██║$NC"
echo -e "$RED ██║  ██║██████╔╝██║   ██║██║  ███╗██║   ██║██████╔╝██╔██╗ ██║$NC"
echo -e "$RED ██║  ██║██╔══██╗██║   ██║██║   ██║╚██╗ ██╔╝██╔═══╝ ██║╚██╗██║$NC"
echo -e "$RED ██████╔╝██║  ██║╚██████╔╝╚██████╔╝ ╚████╔╝ ██║     ██║ ╚████║$NC"
echo -e "$RED ╚═════╝ ╚═╝  ╚═╝ ╚═════╝  ╚═════╝   ╚═══╝  ╚═╝     ╚═╝  ╚═══╝$NC"
echo -e "$Lyellow Premium Script"$NC
echo -e "${Lred}════════════════════════════════════════════════════════════${NC}"
echo -e "${BGWHITE}                      SERVER INFORMATION                    ${NC}"
echo -e "${Lred}════════════════════════════════════════════════════════════${NC}"
echo -e " $GREEN VPS Type             : $typevps"$NC
echo -e " $GREEN CPU Model            :$cname"$NC
echo -e " $GREEN CPU Frequency        :$freq MHz"$NC
echo -e " $GREEN Number Of Cores      : $cores"$NC
echo -e " $GREEN CPU Usage            : $cpu_usage"$NC
echo -e " $GREEN Operating System     : "`hostnamectl | grep "Operating System" | cut -d ' ' -f5-`$NC
echo -e " $GREEN Kernel               : `uname -r`"$NC
echo -e " $GREEN Bash Ver             : $versibash"$NC
echo -e " $GREEN ISP NAME             : $ISP"$NC
echo -e " $GREEN IP VPS               : $IPVPS"$NC
echo -e " $GREEN DOMAIN               : $domain"$NC
echo -e " $GREEN City                 : $CITY"$NC
echo -e " $GREEN SERVER               : $ISP"$NC
echo -e " $GREEN Script Version       : $Sver"$NC
echo -e " $GREEN Client Name          : $name"$NC
echo -e " $GREEN Expired On           : $exp"$NC
echo -e " $GREEN Expired In           : $remain Days"$NC
echo -e " $GREEN Provided By          : $@DruGzVpn"$NC
echo -e "${Lred}════════════════════════════════════════════════════════════${NC}"
echo -e "${BGWHITE}                     [ MAIN MENU ]                          ${NC}"
echo -e "${Lred}════════════════════════════════════════════════════════════${NC}"
echo -e " $PURPLE (•1) $NC $Lyellow PANEL SSH & OPENVPN       $PURPLE (•7) $NC $Lyellow SYSTEM MENU $NC"
echo -e " $PURPLE (•2) $NC $Lyellow PANEL WIREGUARDS          $PURPLE (•8) $NC $Lyellow CHANGE PORT VPN $NC"
echo -e " $PURPLE (•3) $NC $Lyellow PANEL VMESS & VLESS       $PURPLE (•9) $NC $Lyellow Info Script Auto $NC"
echo -e " $PURPLE (•4) $NC $Lyellow PANEL TROJAN              $PURPLE (10) $NC $Lyellow Check Usage $NC"
echo -e " $PURPLE (•5) $NC $Lyellow PANEL SS & SSR            $PURPLE (11) $NC $Lyellow REBOOT VPS $NC"
echo -e " $PURPLE (•6) $NC $Lyellow PANEL L2TP, PPTP, SSTP    $PURPLE (12) $NC $Lyellow CHECK RUNNING SC $NC"
echo -e "${Lred}════════════════════════════════════════════════════════════${NC}"
echo -e " $Lyellow Premium VPS by @DruGzVpn"$NC
echo -e " $Lyellow Thank you for using script by PAKYAVPN"$NC
echo -e "${Lred}════════════════════════════════════════════════════════════${NC}"
echo -e   ""
echo -e "$Lyellow    [Ctrl + C] For exit from main menu"
echo -e   ""
read -p "    Select From Options [1-12 or x: " menu
echo -e ""
case $menu in
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
about
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
