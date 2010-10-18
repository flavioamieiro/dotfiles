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

source ~/.git-completion.bash
export PS1='[\u@\h \w$(__git_ps1 "(%s)")]\$ '

# Change urxvt font size
function fontsize() {
    printf '\33]50;%s\007' "xft:Monaco:pixelsize=$1"
}

source $HOME/.coderc
