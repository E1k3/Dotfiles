#!/bin/bash

pgrep i3lock > /dev/null && echo "i3lock is already running" && exit 0

FORKING=false
SUSPEND=false
SUSPENDMINS="10"
SCREENOFF=false
SCREENOFFSECS="5"

#parse flags
while [[ $# -gt 0 ]]
do
	key="$1"

	case $key in
		-f|--forking)
			FORKING=true
			;;
		
		-s|--suspend)
			SUSPEND=true
			;;

		--suspendmins)
			SUSPENDMINS="$2"
			shift
			;;
		
		-o|--screenoff)
			SCREENOFF=true
			;;
		
		--screenoffsecs)
			SCREENOFFSECS="$2"
			shift
			;;
	esac
	shift
done

if !($SUSPEND); then
	SUSPENDMINS="0"
fi

if ($SUSPEND) || ($SCREENOFF); then
	FORKING=true
fi

#screenshot and processing
scrot /tmp/screen_locked.png

convert /tmp/screen_locked.png -scale 4% -scale 2500% -blur 5x2 -brightness-contrast -20,0 /tmp/screen_blurred.png

rm /tmp/screen_locked.png

#start i3lock
if ($FORKING); then
	pgrep i3lock > /dev/null || i3lock -i /tmp/screen_blurred.png
else
	pgrep i3lock > /dev/null || i3lock -n -i /tmp/screen_blurred.png
fi

#screenoff
if ($SCREENOFF); then
	sleep "${SCREENOFFSECS}"
	pgrep i3lock > /dev/null && xset dpms force off
fi

#suspend
if ($SUSPEND); then
	sleep "$[1 + ${SUSPENDMINS} * 60]"
	pgrep i3lock > /dev/null && systemctl suspend
fi
