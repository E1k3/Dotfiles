#!/bin/bash

[[ $# == 1 ]] && sleeptime=$1 || sleeptime=5

~/.config/i3/lockscreen.sh	

sleep $sleeptime

pgrep i3lock > /dev/null && xset dpms force off && sleep 60 && systemctl suspend
