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
	echo "Choose $(tput setaf 3)[3] $(tput setaf 7)to $(tput setaf 6)Update $(tput setaf 7)the $(tput setaf 6)Core $(tput setaf 7)and run $(tput setaf 6)Quote$(tput setaf 7)"
	echo "Choose $(tput setaf 3)[4] $(tput setaf 7)to $(tput setaf 6)Update $(tput setaf 7)the $(tput setaf 6)Modules $(tput setaf 7)and run $(tput setaf 6)Quote$(tput setaf 7)"
	echo "Choose $(tput setaf 3)[5] $(tput setaf 7)to $(tput setaf 1)Exit$(tput setaf 7)"

BASE=$PWD

find_or_create_quote()
{
	if [ ! -d "QuoteBot" ]
	then
		echo "$(tput setaf 1)Cannot find Quote$(tput setaf 7)"
		echo "Creating directory..."
		mkdir QuoteBot
	else
		echo "$(tput setaf 2)Old Quote found!"
		if [ ! -d "QuoteBotOld" ]
		then
			echo "$(tput setaf 1)QuoteBotOld not found. $(tput setaf 3)QuoteBot => QuoteBotOld$(tput setaf 7)"
			mv $BASE/QuoteBot $BASE/QuoteBotOld
		else
			echo "$(tput setaf 2)QuoteBotOld found. $(tput setaf 1)QuoteBotOld >X<$(tput setaf 7)"
			rm -rf $BASE/QuoteBotOld
			mkdir $BASE/QuoteBot
			cd $BASE/QuoteBot
			cd $BASE
		fi
	fi
}

while [ $choice = 6 ]; do
	read choice

	if [ $choice -eq 1 ]; then
		echo "$(tput setaf 3)[1] $(tput setaf 7) Launch $(tput setaf 6)Quote$(tput setaf 7)"
		sleep 3s
		
		if [ ! -d $BASE/QuoteBot ]
		then
			cd $BASE/QuoteBotOld/QuoteBot
		else
			cd $BASE/QuoteBot/QuoteBot
		fi
		pipenv run bot
	else

	if [ $choice -eq 2 ]; then
		echo "$(tput setaf 3)[2] $(tput setaf 7)Download $(tput setaf 6)Quote$(tput setaf 7)"
		echo ""
		sleep 1s
		find_or_create_quote
		cd $BASE/QuoteBot
		git clone git://github.com/Quote-Bot/QuoteBot
		sleep 5s
		echo "$(tput setaf 3)Waiting for download..."
		cd QuoteBot/QuoteBot
		pipenv install
		cd $BASE
		sleep 1s
		echo "$(tput setaf 3)Downloaded $(tput setaf 7)Quote!$(tput setaf 7)"
	else

	if [ $choice -eq 3 ]; then
		echo "$(tput setaf 3)[3] $(tput setaf 6)Update $(tput setaf 7)the $(tput setaf 6)Core$(tput setaf 7)"
		echo ""
		sleep 3s
		find_or_create_quote
		echo "$(tput setaf 1)Removing old core..$(tput setaf 7)"
		rm -rf $BASE/QuoteBotOld/QuoteBot/bot.py
		echo "$(tput setaf 2)Installing new core..$(tput setaf 7)"
		curl https://raw.githubusercontent.com/Quote-Bot/QuoteBot/master/bot.py -o $BASE/QuoteBotOld/QuoteBot/bot.py
		echo "$(tput setaf 2)Successfully installed new core.$(tput setaf 7)"
		echo "Running $(tput setaf 6)Quote $(tput setaf 7)in 3 seconds.."
		sleep 3s
		cd $BASE/QuoteBotOld/QuoteBot && pipenv run bot
	else

	if [ $choice -eq 4 ]; then
		echo "$(tput setaf 3)[4] $(tput setaf 6)Update $(tput setaf 7)the $(tput setaf 6)Modules$(tput setaf 7)"
		echo ""
		sleep 3s
		find_or_create_quote
		echo "$(tput setaf 1)Removing old modules..$(tput setaf 7)"
		rm -rf $BASE/QuoteBotOld/QuoteBot/cogs
		git clone git://github.com/Quote-Bot/QuoteBot NewModules
		echo "$(tput setaf 2)Installing new modules..$(tput setaf 7)"
		mv $BASE/NewModules/cogs $BASE/QuoteBotOld/QuoteBot/
		echo "$(tput setaf 2)Successfully installed new modules.$(tput setaf 7)"
		echo "Running $(tput setaf 6)Quote $(tput setaf 7)in 3 seconds.."
		sleep 3s
		cd $BASE/QuoteBotOld/QuoteBot && pipenv run bot
	else
	
	if [ $choice -eq 5 ]; then
		echo "$(tput setaf 3)[5] $(tput setaf 1)Exit$(tput setaf 7)"
		echo "Exiting.."
		break
	fi
	fi
	fi
	fi
	fi
done
exit 0
