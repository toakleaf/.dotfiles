export GIT_EDITOR=nvim
export GIT_DEFAULT_BRANCH=main
export PATH=$PATH:$(npm get prefix)/bin
# export COMPOSE_FILE=local.yml
export FZF_BASE=~/.fzf
export BAT_CONFIG_PATH=~/.config/bat/bat.conf
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
