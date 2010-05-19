# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi
alias ls='ls --color=auto'
export HISTCONTROL=ignoreboth
setterm -bfreq 0
export EDITOR=vim

#this fucks up the control+key shortcuts
#set -o vi
