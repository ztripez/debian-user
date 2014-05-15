#!/bin/bash
#
# author: Ztripez Hellström
#
#


#----------
#
# Get the absolut path to where the script is located, source: 
# http://stackoverflow.com/questions/59895/can-a-bash-script-tell-what-directory-its-stored-in
#
#--------
SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
	  DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
	    SOURCE="$(readlink "$SOURCE")"
	      [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
      done
DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"


# Check for existing settings and moving them out of the way

if [ -d "$HOME/.vim" ]; then
	echo "Vim dir exists, renaming";
	mv "$HOME/.vim" "$HOME/vim.backup"
fi

if [ -f "$HOME/.vimrc" ]; then
	echo "vimrc exists, renaming"
	mv "$HOME/.vimrc" "$HOME/vimrc.backup"
fi

#Time to add vim-settings

ln -s "$DIR/vim/vimrc" "$HOME/.vimrc"
ln -s "$DIR/vim" "$HOME/.vim"
