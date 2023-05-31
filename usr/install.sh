#! /bin/bash

osname=`head --lines=3 /etc/os-release | grep ID`
len=`expr length ${osname}` - 3
osname=`expr substr "$osname" 4 ${len}`
if [ "$osname" == "arch" ] || [ "$osname" == "manjaro" ]
then
	sudo pacman -S clang nodejs python yarn jedi-language-server npm jedi-language-server autopep8 js-beautify lua
elif [ "$osname" == "ubuntu" ]
then
	sudo apt install clang nodejs python yarn jedi-language-server npm jedi-language-server autopep8 js-beautify lua
fi
