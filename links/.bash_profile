# Load .profile, containing login, non-bash related initializations.
source ~/.profile

# Load .bashrc, containing non-login related bash initializations.
source ~/.bashrc
eval "$(/opt/homebrew/bin/brew shellenv)"
