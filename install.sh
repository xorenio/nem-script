#!/bin/bash

# THIS SCRIPT IS NOT FINISHED RUNAT YOUR OWN RISH!

# remeber this
#
# curl http://bob.nem.ninja/ -s | w3m -dump -T text/html
#

# If you are auto this script
# Set a default user
defaultUser="thing-4" 
defaultnemVersion="http://bob.nem.ninja/nis-ncc-0.6.28.zip"
# If you dont like how this script is written don't use it 
# I wanted this script to have colors ^_^
red='\033[0;31m'
blue='\033[0;34m'
cyan='\033[0;36m'
green='\033[0;32m'
yellow='\033[1;30m'
grey='\033[1;30m'
purple='\033[0;35m'
NC='\033[0m'
CVar="$#"
ACTION="$1"
nemUSER="$2"
nemVersion="$3"
nemWeb="curl http://bob.nem.ninja -s | w3m -dump -T text/html"
noWarming=false # Set to 1 to disable the usage warning
question=false # Set to true to disable the questions 

# do I really need to explain this? 
function install {
			if [ "$CVar" -ge "3" ]; then
			echo ""
			echo -e "${red}Warning Incorrect usage of this bash file${NC}"
			echo ""
			echo -e "$0 ${yellow}<action> ${cyan}<username> ${purple}<Link to ncc.zip>${NC}"
			echo ""
			echo "example"
			echo ""
			echo -e "$0 ${yellow}install ${cyan}user ${purple}$nemVersion${NC}"
			echo ""
			exit
		fi

	echo ""
	echo "Hello and welcome"
	echo ""
	sleep 1
	echo "this script should setup eveything for you"

	if [ "$4" == "nem" ]; then # This is for xorenio for only installling nem

			echo ""
			echo "Now going to install nem"
			echo ""
			su $nemUSER <<'EOF'
			cd 
			if [ -d "$HOME/nis-ncc-$nemVersion.zip" ]; then
			  echo "Aaaww theres life in there."
			else
				wget_output=$(wget -q "$nemVersion")
					if [ $? -ne 0 ]; then
					    echo "Error 404 nem version you entered is wrong"
					else
						echo "Downloaded now unziping"
						unzip nis-ncc-*.zip
						echo "Downloaded the nem program files and unzipped to the following"
						echo "$HOME/package"
					fi
			fi

			cd package
			script /dev/null

			if ! screen -list | grep -q "nem_nis"; then
				#If there is no screen with the name $server not running
				screen -dmS nem_ncc ./nix.runNcc.sh
				sleep 10
				screen -dmS nem_nis ./nix.runNis.sh
				echo ""
				echo "please use the following connect to connect to the running programs"
				echo ""
				echo "screen -x nem_ncc"
				echo ""
				echo "screen -x nem_nis"
			else
				#If there is a screen with the name $server already running
				echo ""
				echo "The screens for the servers are running"
				echo ""
				echo "please use the following connect to connect to the running programs"
				echo ""
				echo "screen -x nem_ncc"
				echo ""
				echo "screen -x nem_nis"
			fi
			exit
EOF
	fi

	echo ""
	echo "Now installing java 8"
	echo ""

	if apt-get -qq install python-software-properties; then
		echo "python-software-properties is already installed"
	else
		echo "Now installing dependency for java 8 (python-software-properties)"
		apt-get -y install python-software-properties
		add-apt-repository -y ppa:webupd8team/java
		apt-get update
	fi

	echo ""
	echo "Now checking for java"
	echo ""
	sleep 1
	if apt-get -qq install oracle-java8-installer; then
		echo "java 8 is already installed"
	else
		echo "Now installing java 8"
		apt-get -y install oracle-java8-installer
	fi

	echo ""
	echo "Now checking for fail2ban"
	echo ""
	sleep 1
	if apt-get -qq install fail2ban; then
		echo "fail2ban is already installed"
	else
		echo "Now installing fail2ban"
		apt-get -y install fail2ban
	fi


	echo ""
	echo "Now checking for zip"
	echo ""
	sleep 1
	if apt-get -qq install zip; then
		echo "zip is already installed"
	else
		echo "Now installing zip"
		apt-get -y install zip
	fi

	echo ""
	echo "Now checking for screen"
	echo ""
	sleep 1
	if apt-get -qq sacreen zip; then
		echo "screen is already installed"
	else
		echo "Now installing zip"
		apt-get -y screen zip
	fi

	echo ""
	echo "Now going to install nem"
	echo ""
	su $nemUSER <<'EOF'
	cd 
	if [ -d "$HOME/nis-ncc-$nemVersion.zip" ]; then
	  echo "Aaaww theres life in there."
	else
		wget_output=$(wget -q "http://bob.nem.ninja/nis-ncc-$nemVersion.zip")
			if [ $? -ne 0 ]; then
			    echo "Error 404 nem version you entered is wrong"
			else
				echo "Downloaded now unziping"
				unzip nis-ncc-$nemVersion.zip
				echo "Downloaded the nem program files and unzipped to the following"
				echo "$HOME/package"
			fi
	fi

	cd package
	script /dev/null

	if ! screen -list | grep -q "nem_nis"; then
		#If there is no screen with the name $server not running
		screen -dmS nem_ncc ./nix.runNcc.sh
		sleep 10
		screen -dmS nem_nis ./nix.runNis.sh
		echo ""
		echo "please use the following connect to connect to the running programs"
		echo ""
		echo "screen -x nem_ncc"
		echo ""
		echo "screen -x nem_nis"
	else
		#If there is a screen with the name $server already running
		echo ""
		echo "The screens for the servers are running"
		echo ""
		echo "please use the following connect to connect to the running programs"
		echo ""
		echo "screen -x nem_ncc"
		echo ""
		echo "screen -x nem_nis"
	fi
	
EOF

} # End of install function

function apt {

	if [ -d "/var/lib/apt/lists.old" ]; then
			echo ""
			echo "apt-get is already fixed."
			echo ""
		else
			echo ""
			echo "Cleaning up apt-get"
			echo ""
			rm /var/lib/apt/lists/* -vf
			sleep 1

			apt-get clean
			apt-get -y autoremove
			apt-get -y update
			apt-get -y dist-upgrade 

			apt-get clean
			cd /var/lib/apt
			mv lists lists.old
			mkdir -p lists/partial
			apt-get clean
			apt-get update

			apt-get -y dist-upgrade
			apt-get -y install linux

			echo "Fixed APT-GET"
	fi
}

# Start of update function
function update {
	echo ""
	echo " This feature is nor done"
	echo ""

} # End of update function

# This tells you who made the script
function credit {
	echo ""
	echo -e " ${green}Welcome to a script made for thingamajigs${NC}"
	echo ""
	echo -e " made by ${red}xoren.io${NC}"
	echo ""
	echo " github - https://github.com/xorenio/nem-script"
	echo ""
	echo -e " If you would like to donate I only take ${red}NEX${NC}"
	echo ""
	echo -e " ${yellow}NAQO5T-G6X3Q7-4OR3HX-3C2NH5-IR5Y4L-2E75P3-SQCR${NC}"
	echo ""
	exit
} # End of credit function

# This will explain how to use this script
function usage {
		if [ "$CVar" != "2" ]; then
		echo ""
		echo -e "${red}Warning Incorrect usage of this bash file${NC}"
		echo ""
		echo -e "$0 ${yellow}<action> ${cyan}<username> ${purple}<Link to ncc.zip>${NC}"
		echo ""
		echo "Examples:"
		echo ""
		echo -e "sub out ${yellow}<action>${NC} with start | stop | restart | install"
		echo ""
		echo -e "sub out ${cyan}<username>${NC} with nem user"
		echo ""
		echo -e "${purple}<nem_version>${NC} is only needed if your installing nem"
		echo ""
		echo -e "$0 ${yellow}install ${cyan}user ${purple}http://bob.nem.ninja/nis-ncc-0.6.28.zip${NC}"
		echo ""
	fi
} # End of usage function 

# This is used to start up nem wallet
function start {
	if [ "$CVar" != "2" ]; then
		echo -e "$0 ${yellow}start ${cyan}nem-user${NC}"
		echo ""
		exit
	fi
	echo "You want to $1 nem with $nemUSER user."
	echo "starting nem as $nemUSER"
	su $nemUSER <<'EOF'
		if ! screen -list | grep -q "nem_ncc"; then

			#If there is no screen with the name nem_ncc not running
			screen -dmS nem_ncc
			sleep 1

			screen -S nem_ncc -p 0 -X stuff 'cd $HOME'$(echo -ne '\015')
			screen -S nem_ncc -p 0 -X stuff './package/nix.runNcc.sh'$(echo -ne '\015')

			echo "The NCC has been started"
			echo ""
		else
			#If there is a screen with the name nem_ncc already running
			echo "The NCC screen is still running, killing the screen now"
			killd () {
			for session in $(screen -ls | grep -o '[0-9]\{4\}')
			do
			screen -S "${session}" -X quit;
			done
			}
			killd
			#Starting NCC now
			screen -dmS nem_ncc
			sleep 1

			screen -S nem_ncc -p 0 -X stuff 'cd $HOME'$(echo -ne '\015')
			screen -S nem_ncc -p 0 -X stuff './package/nix.runNcc.sh'$(echo -ne '\015')

			echo "The NCC has been started"
			echo ""
		fi
		if ! screen -list | grep -q "nem_nis"; then

			#If there is no screen with the name nem_ncc not running
			screen -dmS nem_nis
			sleep 1

			screen -S nem_nis -p 0 -X stuff 'cd $HOME'$(echo -ne '\015')
			screen -S nem_nis -p 0 -X stuff './package/nix.runNis.sh'$(echo -ne '\015')

			echo "The NIS has been started"
			echo ""
		else
			#If there is a screen with the name $server already running
			echo "The NIS screen is still running, killing the screen now"
			screen -X -S nem_nis quit
			#starting NIS now
			screen -dmS nem_nis
			sleep 1

			screen -S nem_nis -p 0 -X stuff 'cd $HOME'$(echo -ne '\015')
			screen -S nem_nis -p 0 -X stuff './package/nix.runNis.sh'$(echo -ne '\015')
		fi
		exit
EOF

echo "Done installing"
} # End of start function 

# This will stop the nem wallet
function stop {
	echo ""
	echo -e "${yellow}This WILL kill all running screens for $nemUSER user but only $nemUSER's screens${NC}"
	echo ""
	read -p "Are you sure you want to do this ? (y/n) " -n 1 -r && echo ""
	if [[ $REPLY =~ ^[y]$ || ! $REPLY ]]; then
		su $nemUSER <<'EOF'
			killd () {
			for session in $(screen -ls | grep -o '[0-9]\{4\}')
			do
			screen -S "${session}" -X quit;
			done
			}
			killd
			echo "checking to see if there is any screens left"
			echo ""
			screen -ls
		exit
EOF
	echo "All of the screen now have been killed"
	echo ""
	elif [[ $REPLY =~ ^[n]$ || ! $REPLY ]]; then
	echo "stopping script"
	echo ""
	exit
	fi
} # End of stop function

# This will restart the nem wallet
function restart {
	echo ""
	echo "Restart nem"
	echo ""
	exit
	killnem
	sleep 1
	start
} # End of restart function

# This will stop the nem wallet and kill the screens, the fast way to kill the wallet
function killnem {
	su $nemUSER <<'EOF'
	screen -ls
	killd () {
	for session in $(screen -ls | grep -o '[0-9]\{4\}')
	do
		screen -S "${session}" -X quit;
	done
	}
	killd
	screen -ls
	exit
	echo "All of the screens should be killed now!"
	echo ""
	echo "If not run this again"
	echo ""
EOF
} # End of killnem function

function connect_ncc {
	echo ""
	echo -e "${yellow}This WILL kill all running screens for $nemUSER user but only $nemUSER's screens${NC}"
	echo ""
	read -p "Are you sure you want to do this ? (y/n) " -n 1 -r && echo ""
	if [[ $REPLY =~ ^[y]$ || ! $REPLY ]]; then
		su $nemUSER <<'EOF'
			killd () {
			for session in $(screen -ls | grep -o '[0-9]\{4\}')
			do
			screen -S "${session}" -X quit;
			done
			}
			killd
			echo "checking to see if there is any screens left"
			echo ""
			screen -ls
		exit
EOF
	echo "All of the screen now have been killed"
	echo ""
	elif [[ $REPLY =~ ^[n]$ || ! $REPLY ]]; then
	echo "stopping script"
	echo ""
	exit
	fi
}

# You wanna know how to use the easy way
function checkNem {
	echo ""

	if [ -z $nemUSER ]; then
		nemUSER=$defaultUser
		echo "Using the default user $nemUSER"
	fi
	
	if [ -z $nemVersion ]; then
		nemVersion=$defaultnemVersion
		echo "Using the fault nem link $nemVersion"
	fi

	CVar="3"
}

# You wanna know how to use the easy way
function explain {
	echo ""
	echo "Welcome to question time"
	echo ""
	echo "This can be fully disabled by changing to "
	echo ""
	questions
}

function questions {
	read -p "Choose 1:help 2:start 3:Stop 4:Kill 5:Install 6:quit ? (1/2/3/4/5/6) " -n 1 -r && echo ""
	if [[ $REPLY =~ ^[1]$ || ! $REPLY ]]; then
		explain
	elif [[ $REPLY =~ ^[2]$ || ! $REPLY ]]; then
		checkNem
		start
	elif [[ $REPLY =~ ^[3]$ || ! $REPLY ]]; then
		checkNem
		killnem
	elif [[ $REPLY =~ ^[4]$ || ! $REPLY ]]; then
		checkNem
		killnem
	elif [[ $REPLY =~ ^[5]$ || ! $REPLY ]]; then
		checkNem
		install
	elif [[ $REPLY =~ ^[6]$ || ! $REPLY ]]; then
		exit
	elif [[ $REPLY -ge "7" || ! $REPLY ]]; then
		questions
	fi
}

if [ "$EUID" -ne 0 ]; then 
	echo ""
	echo -e "${red}Please run as root${NC}"
	echo "As this scrit might be used to install"
	echo ""
	exit
fi

if [ "$1" = "credit" ]; then
	credit # Line 249
fi

if [ "$noWarming" = "false" ]; then
	usage # line 265
fi

if [ "$1" = "start" ]; then
	start
fi

if [ "$1" == "stop" ]; then
	stop
fi

if [ "$1" == "restart" ]; then
	restart
fi

if [ "$1" == "kill" ]; then
	killnem
fi

if [ "$1" == "install" ]; then
	install
fi

if [ "$1" == "apt" ]; then
	apt
fi

if [ "$question" == "false" ]; then

	if [ "$CVar" == "0" ]; then
		questions
	fi
fi

exit  
