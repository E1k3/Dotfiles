#!/bin/bash

dfdirectory="/home/eike/fakedotfiles"
homedirectory="/home/eike/fakehome"
backupdirectory="/home/eike/fakebackups"

[ "$dfdirectory" == "$homedirectory" ] && echo "ERROR: same directory" && exit

files="$(find "$dfdirectory" -type f)"

echo "The following files will be linked to their respective folders:"
printf "$files \n"

[ "$1" == "-y" ] || (echo -n "Continue? (n)" && read yn)
[ "$yn" == "n" ] && exit

for filename in $files; do
	relpath="$(realpath --relative-to="$dfdirectory" "$filename")"

	if [ "$(basename filename)" == ".directory" ]; then
		continue
	fi
	
	if [ -e "${homedirectory}/$relpath" ]; then

		echo "${homedirectory}/$relpath"
		echo "This file already exists."
		[ "$1" == "-y" ] || (echo -n "Continue? (n)" && read yn)
		[ "$yn" == "n" ] && exit

		mv "${homedirectory}/$relpath" "${backupdirectory}/$relpath"
	fi

	ln -s "${dfdirectory}/$relpath" "${homedirectory}/$relpath"
done
