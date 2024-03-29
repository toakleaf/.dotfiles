#!/usr/bin/env bash

# Update App Store apps
sudo softwareupdate -i -a

# Update Homebrew (Cask) & packages
brew update
arch -arm64 brew upgrade

# Update npm & packages
npm install npm -g
npm update -g

# Update Ruby & gems
# sudo gem update —system
# sudo gem update
