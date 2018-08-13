#!/bin/bash

clear

fname=tempx

touch $fname

clear > $fname

cc="█"
sym="█"

echo -e "\e[31m█\e[32m█\e[34m█\e[0m \e[1m[WASD] MOVE | [Q] DRAW | [O] OPEN | [V] SAVE | [T] QUIT | [B] BRUSH | [N] COLOR\e[0m"
echo -e "[$cc] [$sym]\n"
echo -e " " >> $fname
echo -e " " >> $fname
echo -e " " >> $fname
tput cup 3 0

spix="█"

while true
do
	pixel=$spix
	read -s -n1 ui
	if [ "$ui" == "w" ] || [ "$ui" == "i" ]
	then
		printf "\033[1A"
		echo -en "\033[1A" >> $fname
	elif [ "$ui" == "s" ] || [ "$ui" == "k" ]
	then
		printf "\033[1B"
		echo -en "\033[1B" >> $fname
	elif [ "$ui" == "a" ] || [ "$ui" == "j" ]
	then
		printf "\033[1D"
		echo -en "\033[1D" >> $fname
	elif [ "$ui" == "d" ] || [ "$ui" == "l" ]
	then
		printf "\033[1C"
		echo -en "\033[1C" >> $fname
	elif [ "$ui" == "c" ]
	then
		clear
		clear >> $fname

		echo -e "\e[1m[WASD] MOVE | [Q] DRAW | [O] OPEN | [V] SAVE | [T] QUIT\e[0m"
		echo -e "$cc $sym\n"
		echo -e " " >> $fname
		echo -e " " >> $fname
		echo -e " " >> $fname
		tput cup 3 0
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
		clear >> $fname
		cat $pfile
		cat $pfile > $fname
		tput cup 0 0
		tput cup 0 0 >> $fname
		echo -e "\e[1m[WASD] MOVE | [Q] DRAW | [O] OPEN | [V] SAVE | [T] QUIT | [B] BRUSH | [N] COLOR\e[0m"
		echo -e "[$cc] [$sym]\n"
		echo -e " " >> $fname
		echo -e " " >> $fname
		tput cup 3 0
		tput cup 3 0 >> $fname
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
	elif [ "$ui" == "b" ]
	then
		tput sc
		tput sc >> $fname
		linesx=$(tput lines)
		lines="$((linesx - 2))"
		tput cup $lines 0		
		tput cup $lines 0 >> $fname
		echo -en "\e[0m"
		echo -en "Brush: "			
		read brush
		spix=$brush
		printf "\033[1A"
		printf "\033[2K"
		tput rc
		tput rc >> $fname
		tput sc
		tput cup 1 5
		echo -en "\e[0m$brush\e[0m"
		sym="\e[0m$brush\e[0m"
		tput rc
	elif [ "$ui" == "n" ]
	then
		 tput sc
                 tput sc >> $fname
                 linesx=$(tput lines)
                 lines="$((linesx - 2))"
                 tput cup $lines 0
                 tput cup $lines 0 >> $fname
                 echo -en "\e[0m"
                 echo -en "Color: "                      
                 read color
                 printf "\033[1A"
                 printf "\033[2K"
                 tput rc
                 tput rc >> $fname
                 tput sc
                 tput cup 1 1
                 echo -en "\e[38;5;${color}m█\e[0m"
                 cc="\e[38;5;${color}m█\e[0m"
		 tput rc
		 tput setaf $color
		 tput setaf $color >> $fname

	elif [ "$ui" == "1" ]
	then
		tput sgr0
		tput setaf 1
		tput setaf 1 >> $fname
		tput sc
		tput cup 1 1
		echo -en "\e[31m█\e[0m"
		cc="\e[31m█\e[0m"
		tput rc
	elif [ "$ui" == "2" ]
	then
		tput sgr0
		tput setaf 2
		tput setaf 2 >> $fname
		tput sc
		tput cup 1 1
		echo -en "\e[32m█\e[0m"
		cc="\e[32m█\e[0m"
		tput rc
	elif [ "$ui" == "3" ]
	then
		tput sgr0
		tput setaf 3
		tput setaf 3 >> $fname
		tput sc
		tput cup 1 1
		echo -en "\e[33m█\e[0m"
		cc="\e[33m█\e[0m"
		tput rc
	elif [ "$ui" == "4" ]
	then
		tput sgr0
		tput setaf 4
		tput setaf 4 >> $fname
		tput sc
		tput cup 1 1
		echo -en "\e[34m█\e[0m"
		cc="\e[34m█\e[0m"
		tput rc
	elif [ "$ui" == "5" ]
	then
		tput sgr0
		tput setaf 5
		tput setaf 5 >> $fname
		tput sc
		tput cup 1 1
		echo -en "\e[35m█\e[0m"
		cc="\e[35m█\e[0m"
		tput rc
	elif [ "$ui" == "6" ]
	then
		tput sgr0
		tput setaf 6
		tput setaf 6 >> $fname
		tput sc
		tput cup 1 1
		echo -en "\e[36m█\e[0m"
		cc="\e[36m█\e[0m"
		tput rc
	elif [ "$ui" == "r" ]
	then
		echo -en " "
		echo -en " " >> $fname
	elif [ "$ui" == '`' ]
	then
		tput sgr0
		tput sgr0 >> $fname
		tput sc
		tput cup 1 1
		echo -en "\e[0m█\e[0m"
		cc="\e[0m█\e[0m"
		tput rc
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
		tput sc
		tput cup 1 5
		echo -en "\e[0m█\e[0m"
		sym="\e[0m█\e[0m"
		tput rc
	elif [ "$ui" == "0" ]
	then
		spix="*"
		tput sc
		tput cup 1 5
		echo -en "\e[0m*\e[0m"
		sym="\e[0m*\e[0m"
		tput rc
	elif [ "$ui" == "9" ]
	then
		spix="."
		tput sc
		tput cup 1 5
		echo -en "\e[0m.\e[0m"
		sym="\e[0m.\e[0m"
		tput rc
	elif [ "$ui" == "8" ]
	then
		spix="|"
		tput sc
		tput cup 1 5
		echo -en "\e[0m|\e[0m"
		sym="\e[0m|\e[0m"
		tput rc
	elif [ "$ui" == "7" ]
	then
		spix="_"
		tput sc
		tput cup 1 5
		echo -en "\e[0m_\e[0m"
		sym="\e[0m_\e[0m"
		tput rc
	fi
done
