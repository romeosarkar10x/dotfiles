PATH=$PATH:/home/romeo/.local/bin
PATH=$PATH:/home/romeo/.local/bin/exercism

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
# PS1='[\u@\h \W]\$ '
#
export XCURSOR_SIZE=48
export HYPRCURSOR_SIZE=48

if [ -f ~/.config/exercism/exercism_completion.bash ]; then
  source ~/.config/exercism/exercism_completion.bash
fi
