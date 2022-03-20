#!/usr/bin/env bash
# https://www.elliotdenolf.com/posts/backup-restore-vs-code-extensions

#  Adds new command options to "code" command
# `code save-ext` will output your extensions to file
# `code install-ext` will install them from file

if command -v code >/dev/null 2>&1; then
  code() {
    case "$1" in
    save-ext)
      echo "Saving code extensions..."
      code --list-extensions > ~/.dotfiles/VSCode/extensions.txt
      ;;
    install-ext)
      echo "Installing code extensions..."
      cat ~/.dotfiles/VSCode/extensions.txt | xargs -L 1 code --install-extension
      ;;
    *)
      command code "$@"
      ;;
    esac
  }
fi
