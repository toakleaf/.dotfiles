# .dotfiles

![https://xkcd.com/1205/](https://imgs.xkcd.com/comics/is_it_worth_the_time_2x.png)

## Do it!

1. `cd ~`
2. `git clone git@github.com:toakleaf/.dotfiles.git`
3. `cd .dotfiles`
4. `source link.sh`

## Change it/Add new dotfiles:

Anything file dropped in `/links/`, `VSCode/`, or `.config/` will get symlinked to `~/` when you execute link.sh.

Any existing symlinks will get overwritten.

Any existing files will get copied in place with date stamps and replaced with symlink.

## Setup a new computer:

Run `source mac_init.sh` to set system defaults.

Run `source brew_init.sh` to install apps (via brew and cask).

Run `source mac_update.sh` to update apps in brew/npm/app store

## Other Stuff

- reload zsh `source ~/.zshrc`
- change node versions `nvm install [whole number of version for latest]`

### Install Node properly
1. Install Node.js from https://nodejs.org/en/download/
2. Update to the latest version of npm `npm install npm -g`
3. Make a new folder for the npm global packages `mkdir ~/.npm-packages`
4. Tell npm where to find/store them `npm config set prefix ~/.npm-packages`
5. Verify the install `node -v` & `npm -v`
