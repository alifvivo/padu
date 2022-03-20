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

             if [ ! -e /usr/local/bin/reboot ]; then
             echo '#!/bin/bash' > /usr/local/bin/reboot 
             echo 'tanggal=$(date +"%m-%d-%Y")' >> /usr/local/bin/reboot 
             echo 'waktu=$(date +"%T")' >> /usr/local/bin/reboot 
             echo 'echo "Server telah berhasil direboot pada tanggal $tanggal pukul $waktu." >> /root/log-reboot.txt' >> /usr/local/bin/reboot
             echo '/sbin/shutdown -r now' >> /usr/local/bin/reboot 
             chmod +x /usr/local/bin/reboot
             fi

             echo -e "${green} ══════════════════════════════════════════${NC}"
             echo -e " ${BGBLUE}         Auto Reboot Server               ${NC}"
             echo -e "${green} ══════════════════════════════════════════${NC}"
             echo -e "$green (•1) $NC Set Auto-Reboot 1 jam sekali"
             echo -e "$green (•2) $NC Set Auto-Reboot 6 jam sekali"
             echo -e "$green (•3) $NC Set Auto-Reboot 12 jam sekali"
             echo -e "$green (•4) $NC Set Auto-Reboot 1 hari sekali"
             echo -e "$green (•5) $NC Set Auto-Reboot 1 minggu sekali"
             echo -e "$green (•6) $NC Set Auto-Reboot 1 bulan sekali"
             echo -e "$green (•7) $NC Matikan Auto-Reboot"
             echo -e "$green (•8) $NC Lihat log reboot"
             echo -e "$green (•9) $NC Hapus log reboot"
             echo -e "${green} ══════════════════════════════════════════${NC}"
             echo -e   ""
             echo -e "Press CTRL+C to Return/Exit"
             read -p "Please Enter The Correct Number : "

             if test $x -eq 1; then
             echo "10 * * * * root /usr/local/bin/reboot" > /etc/cron.d/reboot
             echo "Auto-Reboot telah berhasil diset 1 jam sekali."
             elif test $x -eq 2; then
             echo "10 */6 * * * root /usr/local/bin/reboot" > /etc/cron.d/reboot
             echo "Auto-Reboot telah berhasil diset 6 jam sekali."
             elif test $x -eq 3; then
             echo "10 */12 * * * root /usr/local/bin/reboot" > /etc/cron.d/reboot
             echo "Auto-Reboot telah berhasil diset 12 jam sekali."
             elif test $x -eq 4; then
             echo "10 0 * * * root /usr/local/bin/reboot" > /etc/cron.d/reboot
             echo "Auto-Reboot telah berhasil diset 1 hari sekali."
             elif test $x -eq 5; then
             echo "10 0 */7 * * root /usr/local/bin/reboot" > /etc/cron.d/reboot
             echo "Auto-Reboot telah berhasil diset 1 minggu sekali."
             elif test $x -eq 6; then
             echo "10 0 1 * * root /usr/local/bin/reboot" > /etc/cron.d/reboot
             echo "Auto-Reboot telah berhasil diset 1 bulan sekali."
             elif test $x -eq 7; then
             rm -f /etc/cron.d/reboot
             echo "Auto-Reboot telah berhasil dimatikan."
             elif test $x -eq 8; then
             if [ ! -e /root/log-reboot.txt ]; then
	         echo "Belum ada aktivitas reboot yang ditemukan"
	         else 
	         echo 'LOG REBOOT'
         	 echo "-------"
	         cat /root/log-reboot.txt
             fi
             elif test $x -eq 9; then
             echo "" > /root/log-reboot.txt
             echo "Log Auto Reboot berhasil dihapus!"
             else
             echo "Pilihan Tidak Terdapat Di Menu."
             exit
             fi
