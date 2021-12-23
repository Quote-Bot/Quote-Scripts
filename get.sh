#!/bin/bash
BASE=$PWD
echo ""
echo "$(tput setaf 6)Initiated...$(tput setaf 7)"
echo ""

sudo apt-get upgrade
echo "Downloading Quote Linux Launcher......."
curl https://raw.githubusercontent.com/Quote-Bot/Quote-Scripts/master/quote_launcher.sh -o quote_launcher.sh
dos2unix quote_launcher.sh
echo "Done! Self eliminating..."

rm -rf "$BASE"/get.sh

exit 1
