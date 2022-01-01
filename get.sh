#!/bin/bash
BASE=$PWD
echo ""
echo "$(tput setaf 6)Initiated...$(tput setaf 7)"
echo ""

sudo apt-get upgrade

echo "$(tput setaf 3)Starting force download of Python 3.9..."
sudo apt install software-properties-common
sudo add-apt-repository ppa:deadsnakes/ppa
sudo apt install python3.9
echo "$(tput setaf 2)Python installed!$(tput setaf 7)"

echo "$(tput setaf 3)Downloading pip..."
sudo apt install python3-pip
echo "$(tput setaf 2)Pip installed!$(tput setaf 7)"

if type git > /dev/null;
  then
    echo "$(tput setaf 2)Git is installed$(tput setaf 7)"
  else
    echo "$(tput setaf 3)Git is not installed$(tput setaf 7)"
    sudo apt-get install git
fi
sleep 1s

if type pipenv > /dev/null;
  then
    echo "$(tput setaf 2)Pipenv is installed$(tput setaf 7)"
  else
    echo "$(tput setaf 3)Pipenv is not installed$(tput setaf 7)"
    sudo pip3 install pipenv
fi
sleep 1s

echo "Downloading Quote Linux Launcher......."
curl https://raw.githubusercontent.com/Quote-Bot/Quote-Scripts/master/quote_launcher.sh -o quote_launcher.sh
dos2unix quote_launcher.sh
echo "Done! Self eliminating..."

rm -rf "$BASE"/get.sh

exit 1
