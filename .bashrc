# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

alias ls='ls --color=auto'
export HISTCONTROL=ignoreboth
export HISTSIZE=100000
export HISTFILESIZE=100000
shopt -s histappend                      # append to history, don't overwrite it

setterm -bfreq 0
export EDITOR=vim

#this fucks up the control+key shortcuts
#set -o vi

source ~/.git-completion.bash
export PS1='[\u@\h \w$(__git_ps1 "(%s)")]\$ '
if [ $TERM = "screen" ]
then
    # If we're using screen, include <ESC>k<ESC>\
    # in the PS1 so the window title is updated
    # to the current running command.
    # This sequence itself has to be escaped,
    # otherwise commands longer than one line
    # are not displayed correctly.
    export PS1="\[\033k\]\[\033\ \]\[\033[G\]$PS1"
fi

# Change urxvt font size
function fontsize() {
    printf '\33]50;%s\007' "xft:Inconsolata:pixelsize=$1"
}

which rlwrap > /dev/null 2>&1 && alias guile="rlwrap guile"

#source $HOME/.coderc
