#!/usr/bin/env bash

function addSymlink {
  fname=$(basename ${1})
  dateStr=$(date +%Y-%m-%d-%H%M)
  dest="$2/$fname"
  mkdir -p "$2"

  if [ -h "${dest}" ]; then
    # Existing symlink 
    echo "Removing existing symlink: $dest"
    rm ${dest} 

  elif [ -f "${dest}" ]; then
    # Existing file
    echo "Backing up existing file: $dest"
    mv ${dest}{,.${dateStr}}    
  fi

  echo "Creating new symlink from $1 to $dest\n"
  ln -s ${1} ${dest}
}

function linkDotfiles {
  for absPath in $(find "$1" -mindepth 1 -type f); do
    fname=$(basename $absPath)
    echo "For dotfile $fname in $absPath:"
    fpath=${absPath#"$1"}
    fpath=${fpath%%"/$fname"}
    destPath="${2}$fpath"
    addSymlink $absPath $destPath
  done
}

linkDotfiles "${HOME}/.dotfiles/links" "${HOME}"
linkDotfiles "${HOME}/.dotfiles/VSCode" "${HOME}/Library/Application Support/Code/User"
