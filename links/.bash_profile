# Load .profile, containing login, non-bash related initializations.
source ~/.profile

# Load .bashrc, containing non-login related bash initializations.
source ~/.bashrc
eval "$(/opt/homebrew/bin/brew shellenv)"

 # Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
 export PATH="$PATH:$HOME/.rvm/bin"
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

. "$HOME/.cargo/env"
