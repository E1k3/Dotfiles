#!/bin/bash

dfdirectory="/home/eike/Documents/Dotfiles/dotfiles/files"
homedirectory="/home/eike"
backupdirectory="/home/eike/Documents/Dotfiles/backup"

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

		mkdir -p "$(dirname "${backupdirectory}/$relpath")"
		mv "${homedirectory}/$relpath" "${backupdirectory}/$relpath"
	fi
	

	mkdir -p "$(dirname "${homedirectory}/$relpath")"
	ln -s "${dfdirectory}/$relpath" "${homedirectory}/$relpath"
done
