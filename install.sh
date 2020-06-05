#!/bin/bash
SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"

declare -a INSTALL_FILES=(
.bashrc
.tmux.conf
tools
.vim
.vimrc
)

for file in "${INSTALL_FILES[@]}"; do
	path="${SCRIPT_DIR}/${file}"
	installPath="$HOME/$file"

	if [[ -h "$installPath" ]]; then
		echo "Remove $installPath" 
		rm -f "$installPath"
	elif [[ -f "$installPath" ]]; then
		echo "Rename $installPath in ${installPath}.old" 
		mv "$installPath" "${installPath}.old"
	fi

	echo "Create link for $file"
	ln -s "$path" "$installPath"
done
