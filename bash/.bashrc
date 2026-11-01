# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
# PS1='[\u@\h \W]\$ '
#
export XCURSOR_SIZE=48
export HYPRCURSOR_SIZE=48

eval "$(zoxide init bash --cmd cd)"
eval "$(fzf --bash)"

set -o vi
bind 'set show-mode-in-prompt on'
