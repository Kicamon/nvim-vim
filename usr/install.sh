#! /bin/bash

osname=`head --lines=3 /etc/os-release | grep ID`
len=`expr length ${osname}`
osname=`expr substr "$osname" 4 4`
if [ "$osname" == "arch" ]
then
	sudo pacman -S clang nodejs python yarn jedi-language-server npm autopep8 js-beautify lua
fi
