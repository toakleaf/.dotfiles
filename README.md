# .dotfiles

## Do it:

1. `cd ~`
2. `git clone git@github.com:toakleaf/.dotfiles.git`
3. `cd .dotfiles`
4. `source setup.sh`

## Change it/Add new dotfiles:

Anything file dropped in `/links` will get symlinked to `~/` when you execute setup.sh.

Any existing symlinks will get overwritten.

Any existing files will get copied in place and replaced with symlink.

## Setup a new computer:

Run `source mac_init.sh` to set system defaults.

Run `source brew_init.sh` to install apps (via brew and cask).

Run `source mac_update.sh` to update apps in brew/npm/app store
