#!/usr/bin/env bash

function addSymlink {
  local src="$1"
  local dest_dir="$2"
  local fname
  local dateStr
  local dest

  fname=$(basename "${src}")
  dateStr=$(date +%Y-%m-%d-%H%M)
  dest="${dest_dir}/${fname}"
  mkdir -p "${dest_dir}"

  if [ -h "${dest}" ]; then
    echo "Removing existing symlink: ${dest}"
    rm "${dest}"
  elif [ -e "${dest}" ]; then
    echo "Backing up existing file: ${dest}"
    mv "${dest}" "${dest}.${dateStr}"
  fi

  echo "Creating new symlink from ${src} to ${dest}"
  ln -s "${src}" "${dest}"
}

function linkDotfiles {
  local src_dir="$1"
  local dest_root="$2"
  local absPath
  local fname
  local fpath
  local destPath

  while IFS= read -r -d '' absPath; do
    fname=$(basename "${absPath}")
    fpath=${absPath#"${src_dir}"}
    fpath=${fpath%%"/${fname}"}
    destPath="${dest_root}${fpath}"
    addSymlink "${absPath}" "${destPath}"
  done < <(find "${src_dir}" -mindepth 1 -type f -print0)
}

linkDotfiles "${HOME}/.dotfiles/links" "${HOME}"
linkDotfiles "${HOME}/.dotfiles/VSCode" "${HOME}/Library/Application Support/Code/User"
linkDotfiles "${HOME}/.dotfiles/VSCode" "${HOME}/Library/Application Support/Cursor/User"

# For italics and true color in tmux
# see: https://medium.com/@dubistkomisch/how-to-actually-get-italics-and-true-colour-to-work-in-iterm-tmux-vim-9ebe55ebc2be
tic -x ~/xterm-256color-italic.terminfo
tic -x ~/tmux-256color.terminfo
