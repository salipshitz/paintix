#!/bin/bash

clear

fname=tempx

touch $fname

spix="█"

while true
do
	pixel=$spix
	read -s -n1 ui
	if [ "$ui" == "w" ]
	then
		printf "\033[1A"
		echo -en "\033[1A" >> $fname
	elif [ "$ui" == "s" ]
	then
		printf "\033[1B"
		echo -en "\033[1B" >> $fname
	elif [ "$ui" == "a" ]
	then
		printf "\033[1D"
		echo -en "\033[1D" >> $fname
	elif [ "$ui" == "d" ]
	then
		printf "\033[1C"
		echo -en "\033[1C" >> $fname
	elif [ "$ui" == "c" ]
	then
		clear
		clear > $fname
	elif [ "$ui" == "q" ]
	then
		echo -en "$pixel"
		echo -en "$pixel" >> $fname
	elif [ "$ui" == "o" ]
	then		
		linesx=$(tput lines)
		lines="$((linesx - 2))"
		tput cup $lines 0		
		tput cup $lines 0 >> $fname		
		echo -en "\e[0m"
		echo -en "File Name: "		
		read pfile
		clear
		clear > $fname
		cat $pfile
		cat $pfile > $fname
	elif [ "$ui" == "v" ]
	then			
		if [ -f tempx ]
		then					
			tput sc
			tput sc >> $fname
			linesx=$(tput lines)
			lines="$((linesx - 2))"
			tput cup $lines 0		
			tput cup $lines 0 >> $fname
			echo -en "\e[0m"
			echo -en "File Name: "			
			read psfile
			printf "\033[1A"
			printf "\033[2K"
			tput rc
			tput rc >> $fname
			fname=$psfile
			mv tempx $psfile
			cfile=$psfile
		else		
								
			tput sc
			tput sc >> $fname
			linesx=$(tput lines)
			lines="$((linesx - 2))"
			tput cup $lines 0			
			tput cup $lines 0 >> $fname			
			echo -en "\e[0m"
			echo -en "File Name: "
			read psfile
			printf "\033[1A"
			printf "\033[2K"
			tput rc
			tput rc >> $fname
			fname=$psfile
			if [ "$cfile" == "$psfile" ]
			then
				cfile=$psfile			
			else
				mv $cfile $psfile
				cfile=$psfile
			fi
		fi
	elif [ "$ui" == "1" ]
	then
		tput sgr0
		tput setaf 1
		tput setaf 1 >> $fname
	elif [ "$ui" == "2" ]
	then
		tput sgr0
		tput setaf 2
		tput setaf 2 >> $fname
	elif [ "$ui" == "3" ]
	then
		tput sgr0
		tput setaf 3
		tput setaf 3 >> $fname
	elif [ "$ui" == "4" ]
	then
		tput sgr0
		tput setaf 4
		tput setaf 4 >> $fname
	elif [ "$ui" == "5" ]
	then
		tput sgr0
		tput setaf 5
		tput setaf 5 >> $fname
	elif [ "$ui" == "6" ]
	then
		tput sgr0
		tput setaf 6
		tput setaf 6 >> $fname
	elif [ "$ui" == "r" ]
	then
		echo -en " "
		echo -en " " >> $fname
	elif [ "$ui" == '`' ]
	then
		tput sgr0
		tput sgr0 >> $fname
	elif [ "$ui" == "t" ]
	then
		tput sgr0
		tput sgr0 >> $fname
		clear
		if [ -f "tempx" ]
		then
			rm tempx
		else
			:
		fi
		exit
	elif [ "$ui" == "-" ]
	then
		spix="█"
	elif [ "$ui" == "0" ]
	then
		spix="*"
	elif [ "$ui" == "9" ]
	then
		spix="."
	elif [ "$ui" == "8" ]
	then
		spix="|"
	elif [ "$ui" == "7" ]
	then
		spix="_"
	fi
done
