if  [[ "$OSTYPE" == "darwin"* ]]; then
  ## OSX has crappier versions of commands so we're using those provided by `brew install coreutils`
  alias ls='gls --color=auto'
  alias la='gls --color=auto -AC'
  alias ll='gls --color=auto -alF'
  alias ldir="gls --color=auto -al | grep ^d"
  alias grep='ggrep --color=auto'
  alias cp='gcp -rv'
  alias mv='gmv -v'
  alias mkdir='gmkdir -pv'
else
  alias ls='ls --color=auto'
  alias la='ls --color=auto -AC'
  alias ll='ls --color=auto -alF'
  alias ldir="ls --color=auto -al | grep ^d"
  alias cp='cp -rv'
  alias mv='mv -v'
  alias mkdir='mkdir -pv'
fi

alias wget='wget -c'
alias o="open ."
alias ip="curl icanhazip.com"
alias h='history'
alias k='kubectl'
alias :q="exit"
alias tree='tree -C'

alias cd..='cd ..'
alias ..='cd ..'
alias ...='cd ../../../'
alias ....='cd ../../../../'
alias .....='cd ../../../../'
alias .3='cd ../../../'
alias .4='cd ../../../../'
alias .5='cd ../../../../..'

## Docker
alias dc='docker-compose'
alias dcr='docker-compose run --rm'

## Python/Django
alias pytox='tox -e py36'
alias pym='python3 manage.py'
alias mkenv='python3 -m venv venv'
alias startenv='source venv/bin/activate && which python3'
alias stopenv='deactivate'
