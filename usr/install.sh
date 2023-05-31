#! /bin/bash

osname=`head --lines=3 /etc/os-release | grep ID`
osname=`expr substr "$osname" 4 4`
if [ "$osname" == "arch" ] || [ "$osname" == "manjaro" ]
then
	sudo pacman -S clang nodejs python yarn jedi-language-server npm jedi-language-server autopep8 js-beautify lua
elif [ "$osname" == "ubuntu" ]
then
	sudo apt install clang nodejs python yarn jedi-language-server npm jedi-language-server autopep8 js-beautify lua
fi
