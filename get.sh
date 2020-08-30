#!/bin/bash
BASE=$PWD
echo ""
echo "Initiated..."
echo ""
echo "Downloading Quote Linux Launcher......."
curl https://raw.githubusercontent.com/Quote-Bot/Quote-Scripts/master/quote_launcher.sh -o quote_launcher.sh && trap dos2unix ERR
echo "Done! Self eliminating..."
rm -rf $BASE/get.sh
exit 1