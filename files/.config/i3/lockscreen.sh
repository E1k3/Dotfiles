#!/bin/bash

pgrep i3lock > /dev/null

if [ $? -ne 0 ]; then
	scrot /tmp/screen_locked.png

	convert /tmp/screen_locked.png -scale 4% -scale 2500% -blur 5x2 -brightness-contrast -20,0 /tmp/screen_blurred.png

	rm /tmp/screen_locked.png

	pgrep i3lock > /dev/null
	if [ $? -ne 0 ]; then
		i3lock -n -i /tmp/screen_blurred.png
	fi
fi
