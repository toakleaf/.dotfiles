#!/bin/bash

function linkDotfile {
  filename=$(basename ${1})
  dest="${HOME}/${filename}"
  dateStr=$(date +%Y-%m-%d-%H%M)

  if [ -h "${dest}" ]; then
    # Existing symlink 
    echo "Removing existing symlink: ${dest}"
    rm ${dest} 

  elif [ -f "${dest}" ]; then
    # Existing file
    echo "Backing up existing file: ${dest}"
    mv ${dest}{,.${dateStr}}
  fi

  echo "Creating new symlink: ${dest}"
  ln -s ${1} ${dest}
}

for filepath in $(find $(pwd)/links -type f); do
  echo "For dotfile ${filepath}:"
  linkDotfile $filepath
done
