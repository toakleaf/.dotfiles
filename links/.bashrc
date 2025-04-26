# Enable programmable completion features.
bind 'set show-all-if-ambiguous on'
bind 'TAB:menu-complete'

export PS1="\[\e[0;33m\]\w \[\e[m\e[0;34m\]\u \[\e[m\e[0;32m\]$ \[\e[m\]"

# Add bash aliases.
if [ -f ~/.bash_aliases ]; then
    source ~/.bash_aliases
fi

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
