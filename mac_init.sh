#!/usr/bin/env bash

## More at: https://github.com/mathiasbynens/dotfiles/blob/master/.macos

# Finder: show hidden files by default
defaults write com.apple.finder AppleShowAllFiles -bool true

# Automatically hide and show the Dock
defaults write com.apple.dock autohide -bool true

# Don’t automatically rearrange Spaces based on most recent use
defaults write com.apple.dock mru-spaces -bool false

# Don't scroll like an ipad
defaults write -g com.apple.swipescrolldirection -bool NO


sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# see: https://github.com/junegunn/fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
# see: https://gist.github.com/kevin-smets/8568070
git clone https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k
# see: https://github.com/jeffreytse/zsh-vi-mode
git clone https://github.com/jeffreytse/zsh-vi-mode $ZSH/custom/plugins/zsh-vi-mode
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

pip3 install --user neovim

sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

source $HOME/.dotfiles/code_extensions.sh
