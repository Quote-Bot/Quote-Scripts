#!/bin/bash
BASE=$PWD
echo ""
echo "$(tput setaf 6)Initiated...$(tput setaf 7)"
echo ""

sudo apt-get upgrade

if type python3 > /dev/null;
then
	echo "$(tput setaf 2)Python 3.5+ is installed$(tput setaf 7)"
else
	echo "$(tput setaf 3)Python 3.5+ is not installed$(tput setaf 7)"
	sudo apt-get install python3
fi
sleep 3s

if type git > /dev/null;
then
	echo "$(tput setaf 2)Git is installed$(tput setaf 7)"
else
	echo "$(tput setaf 3)Git is not installed$(tput setaf 7)"
	sudo apt-get install git
fi
sleep 3s

if type dos2unix > /dev/null;
then
	echo "$(tput setaf 2)dos2unix is installed$(tput setaf 7)"
else
	echo "$(tput setaf 3)dos2unix is not installed$(tput setaf 7)"
	sudo apt-get install dos2unix
fi
sleep 3s

if type pip3 > /dev/null;
then
	echo "$(tput setaf 2)pip is installed$(tput setaf 7)"
else
	echo "$(tput setaf 3)pip is not installed$(tput setaf 7)"
	sudo apt-get install python3-pip
fi
pip3 install aiohttp
sleep 3s

echo "Downloading Quote Linux Launcher......."
curl https://raw.githubusercontent.com/Quote-Bot/Quote-Scripts/master/quote_launcher.sh -o quote_launcher.sh
dos2unix quote_launcher.sh
echo "Done! Self eliminating..."

rm -rf "$BASE"/get.sh

exit 1