#!/bin/bash

dfdirectory="$(realpath files)"
homedirectory="$(realpath $HOME)"
backupdirectory="$(realpath ../backup_dotfiles)"

[ "$dfdirectory" == "$homedirectory" ] && echo "ERROR: same directory" && exit

files="$(find "$dfdirectory" -type f)"

echo "The following files will be linked to their respective folders:"
printf "$files \n"

[ "$1" == "-y" ] || (echo -n "Continue? (*/n)" && read yn)
[ "$yn" == "n" ] && exit

for filename in $files; do
	relpath="$(realpath --relative-to="$dfdirectory" "$filename")"

	if [ "$(basename filename)" == ".directory" ]; then
		continue
	fi
	
	if [ -e "${homedirectory}/$relpath" ] || [ -L "${homedirectory}/$relpath" ]; then
		echo "$(ls -al ${homedirectory}/$relpath)"
		echo "This file already exists."
		[ "$1" == "-y" ] || (echo -n "Continue? (*/n)" && read yn)
		[ "$yn" == "n" ] && exit

		mkdir -p "$(dirname "${backupdirectory}/$relpath")"
		mv "${homedirectory}/$relpath" "${backupdirectory}/$relpath"
	fi
	

	mkdir -p "$(dirname "${homedirectory}/$relpath")"
	ln -s "${dfdirectory}/$relpath" "${homedirectory}/$relpath"
done
