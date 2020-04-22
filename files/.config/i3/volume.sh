#!/bin/sh

# Script to prevent concurrent calls to amixer that mess up volume settings

[ ! -e "volume.lock" ] && touch volume.lock && amixer -q -D pulse sset Master $1 && pkill -RTMIN+10 i3blocks && rm -rf volume.lock

