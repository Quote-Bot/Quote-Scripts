#!/bin/bash
BASE=$PWD
echo ""
echo "Initiated..."
echo ""

sudo apt update

if ! hash python3 2> /dev/null;
then
	echo "$(tput setaf 3)Python 3.5+ is not installed$(tput setaf 7)"
	sudo apt-get install python3
else
	echo "$(tput setaf 2)Python 3.5+ is installed$(tput setaf 7)"
fi

if ! hash git &> /dev/null;
then
	echo "$(tput setaf 3)Git is not installed$(tput setaf 7)"
	sudo apt-get install git
else
	echo "$(tput setaf 2)Git is installed$(tput setaf 7)"
fi

if ! hash dos2unix &> /dev/null;
then
	echo "$(tput setaf 3)dos2unix is not installed$(tput setaf 7)"
	sudo apt-get install dos2unix
else
	echo "$(tput setaf 2)dos2unix is installed$(tput setaf 7)"
fi

if ! hash pip &> /dev/null;
then
	echo "$(tput setaf 3)pip is not installed$(tput setaf 7)"
	sudo apt-get install python3-pip
else
	echo "$(tput setaf 2)pip is installed$(tput setaf 7)"
fi

if ! hash aiohttp &> /dev/null;
then
	echo "$(tput setaf 3)aiohttp is not installed$(tput setaf 7)"
	pip3 install aiohttp
else
	echo "$(tput setaf 2)aiohttp is installed$(tput setaf 7)"
fi

echo "Downloading Quote Linux Launcher......."
curl https://raw.githubusercontent.com/Quote-Bot/Quote-Scripts/master/quote_launcher.sh -o quote_launcher.sh
dos2unix quote_launcher.sh
echo "Done! Self eliminating..."

rm -rf $BASE/get.sh

exit 1