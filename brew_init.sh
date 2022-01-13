#!/usr/bin/env bash

# Install command-line tools using Homebrew.
# see: https://github.com/mathiasbynens/dotfiles/blob/master/brew.sh

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Save Homebrew’s installed location.
BREW_PREFIX=$(brew --prefix)

# Install GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
ln -s "${BREW_PREFIX}/bin/gsha256sum" "${BREW_PREFIX}/bin/sha256sum"

# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed --with-default-names
# Install a modern version of Bash.
brew install bash

# Switch to using brew-installed bash as default shell
if ! fgrep -q "${BREW_PREFIX}/bin/bash" /etc/shells; then
  echo "${BREW_PREFIX}/bin/bash" | sudo tee -a /etc/shells;
  chsh -s "${BREW_PREFIX}/bin/bash";
fi;

# Install `wget` with IRI support.
brew install wget --with-iri

# Install GnuPG to enable PGP-signing commits.
brew install gnupg

# Install more recent versions of some macOS tools.
brew install vim --with-override-system-vi
brew install neovim
brew install grep
brew install openssh
brew install screen
brew install php
brew install gmp
brew install ripgrep
brew install ag
brew install bat
# brew install autojump
arch -arm64 brew install autojump
arch -arm64 brew install zsh-vi-mode

# Install other useful binaries.
brew install tmux
brew install ack
brew install git
brew install tldr
brew install tree
brew install zsh-syntax-highlighting
brew install thefuck
brew install ctags
brew install derailed/k9s/k9s

# Install Apps via Cask.
# https://formulae.brew.sh/cask/
brew install --cask google-chrome
brew install --cask virtualbox
brew install --cask 1password
brew install --cask slack
brew install --cask vscodium
brew install --cask tableplus
brew install --cask insomnia
brew install --cask iterm2
brew install --cask zoom
brew install --cask soundsource
brew install --cask insomnia

# Remove outdated versions from the cellar.
brew cleanup
