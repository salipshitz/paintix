#!/bin/bash

clear

spix="█"

while true
do
	pixel=$spix
	read -s -n1 ui
	if [ "$ui" == "w" ]
	then
		printf "\033[1A"
	elif [ "$ui" == "s" ]
	then
		printf "\033[1B"
	elif [ "$ui" == "a" ]
	then
		printf "\033[1D"
	elif [ "$ui" == "d" ]
	then
		printf "\033[1C"
	elif [ "$ui" == "c" ]
	then
		clear
	elif [ "$ui" == "q" ]
	then
		echo -en "$pixel"
	elif [ "$ui" == "1" ]
	then
		tput sgr0
		tput setaf 1
	elif [ "$ui" == "2" ]
	then
		tput sgr0
		tput setaf 2
	elif [ "$ui" == "3" ]
	then
		tput sgr0
		tput setaf 3
	elif [ "$ui" == "4" ]
	then
		tput sgr0
		tput setaf 4
	elif [ "$ui" == "5" ]
	then
		tput sgr0
		tput setaf 5
	elif [ "$ui" == "6" ]
	then
		tput sgr0
		tput setaf 6
	elif [ "$ui" == "r" ]
	then
		echo -en " "
	elif [ "$ui" == '`' ]
	then
		tput sgr0
	elif [ "$ui" == "t" ]
	then
		tput sgr0
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
