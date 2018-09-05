#!/bin/bash

if [ $(lsb_release -is) == "Ubuntu" ]
then
	echo "/usr/share/i3blocks";
elif [ $(lsb_release -is) == "Arch" ]
then
	echo "/usr/lib/i3blocks"
else
	?=-1
fi
