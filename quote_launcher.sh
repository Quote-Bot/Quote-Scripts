#!/bin/bash
echo ""
echo ""
echo "$(tput setaf 6)___________________________________________________________________________________________________________________"
echo "$(tput setaf 6)___________________________________________________________________________________________________________________"
echo ""
echo ""
echo "  $(tput setaf 6)     QQQQQQQQQ                                                             tttt                              "
echo "  $(tput setaf 6)   QQ:::::::::QQ                                                        ttt:::t                              "
echo "  $(tput setaf 6) QQ:::::::::::::QQ                                                      t:::::t                              "
echo "  $(tput setaf 6)Q:::::::QQQ:::::::Q                                                     t:::::t                              "
echo "  $(tput setaf 6)Q::::::O   Q::::::Q    uuuuuu    uuuuuu         ooooooooooo       ttttttt:::::ttttttt            eeeeeeeeeeee    "
echo "  $(tput setaf 6)Q:::::O     Q:::::Q    u::::u    u::::u       oo:::::::::::oo     t:::::::::::::::::t          ee::::::::::::ee  "
echo "  $(tput setaf 6)Q:::::O     Q:::::Q    u::::u    u::::u      o:::::::::::::::o    t:::::::::::::::::t         e::::::eeeee:::::ee"
echo "  $(tput setaf 6)Q:::::O     Q:::::Q    u::::u    u::::u      o:::::ooooo:::::o    tttttt:::::::tttttt        e::::::e     e:::::e"
echo "  $(tput setaf 6)Q:::::O     Q:::::Q    u::::u    u::::u      o::::o     o::::o          t:::::t              e:::::::eeeee::::::e"
echo "  $(tput setaf 6)Q:::::O     Q:::::Q    u::::u    u::::u      o::::o     o::::o          t:::::t              e:::::::::::::::::e "
echo "  $(tput setaf 6)Q:::::O  QQQQ:::::Q    u::::u    u::::u      o::::o     o::::o          t:::::t              e::::::eeeeeeeeeee  "
echo "  $(tput setaf 6)Q::::::O Q::::::::Q    u:::::uuuu:::::u      o::::o     o::::o          t:::::t    tttttt    e:::::::e           "
echo "  $(tput setaf 6)Q:::::::QQ::::::::Q    u:::::::::::::::uu    o:::::ooooo:::::o          t::::::tttt:::::t    e::::::::e          "
echo "  $(tput setaf 6) QQ::::::::::::::Q      u:::::::::::::::u    o:::::::::::::::o          tt::::::::::::::t     e::::::::eeeeeeee  "
echo "  $(tput setaf 6)   QQ:::::::::::Q        uu::::::::uu:::u     oo:::::::::::oo             tt:::::::::::tt      ee:::::::::::::e  "
echo "  $(tput setaf 6)     QQQQQQQQ::::QQ        uuuuuuuu  uuuu       ooooooooooo                 ttttttttttt          eeeeeeeeeeeeee  "
echo "  $(tput setaf 6)             Q:::::Q                                                                             "
echo "  $(tput setaf 6)              QQQQQQ                                                                             "
echo ""
echo ""
echo "$(tput setaf 6)___________________________________________________________________________________________________________________"
echo "$(tput setaf 6)___________________________________________________________________________________________________________________"
echo ""
echo ""
echo "$(tput setaf 7)Welcome to $(tput setaf 6)Quote Linux Launcher$(tput setaf 7)."
echo ""

choice=6
	echo "Choose $(tput setaf 3)[1] $(tput setaf 7)to Launch $(tput setaf 6)Quote$(tput setaf 7)"
	echo "Choose $(tput setaf 3)[2] $(tput setaf 7)to Download $(tput setaf 6)Quote$(tput setaf 7)"
	echo "Choose $(tput setaf 3)[3] $(tput setaf 7)to $(tput setaf 6)Update $(tput setaf 7)the $(tput setaf 6)Core$(tput setaf 7)"
	echo "Choose $(tput setaf 3)[4] $(tput setaf 7)to $(tput setaf 6)Update $(tput setaf 7)the $(tput setaf 6)Modules$(tput setaf 7)"
	echo "Choose $(tput setaf 3)[5] $(tput setaf 7)to $(tput setaf 1)Exit$(tput setaf 7)"

find_or_create_quote()
{
	if [ ! -d "QuoteBot" ]
	then
		echo "$(tput setaf 1)Cannot find old Quote$(tput setaf 7)"
		echo "Creating directory..."
		mkdir QuoteBot
	else
		echo "Old Quote found!"
		if [ ! -d "QuoteBotOld" ]
		then
			mv QuoteBot/ QuoteBotOld/
		else
			rm -rf QuoteBotOld/ -f
			mkdir QuoteBot
		fi
	fi
}

move_core()
{
	if [ ! -d QuoteBot ]
	then
		echo "$(tput setaf 1)Quote not found!$(tput setaf 7)"
		sleep 3s
		echo "$(tput setaf 3)Please run option 2$(tput setaf 7)"
	else
		mv QuoteBotOld/QuoteBot/quote.py QuoteBot/QuoteBot
	fi
}

while [ "$choice" = "6" ]; do
	read choice

	if [ $choice -eq 1 ]; then
		echo "$(tput setaf 3)[1] $(tput setaf 7) Launch $(tput setaf 6)Quote$(tput setaf 7)"
		echo ""
		sleep 3s
		echo ""
		cd ..
		cd QuoteBot/QuoteBot
		python3 quote.py
	else

	if [ $choice -eq 2 ]; then
		echo "$(tput setaf 3)[2] $(tput setaf 7)Download $(tput setaf 6)Quote$(tput setaf 7)"
		echo ""
		sleep 1s
		find_or_create_quote
		cd QuoteBot
		git clone git://github.com/Quote-Bot/QuoteBot
		cd ..
		echo ""
		sleep 1s
		echo "Done!"
	else

	if [ $choice -eq 3 ]; then
		echo "$(tput setaf 3)[3] $(tput setaf 6)Update $(tput setaf 7)the $(tput setaf 6)Core$(tput setaf 7)"
		echo ""
		sleep 3s
		cd ..
		find_or_create_quote
		move_core
	fi
	fi
	fi
done