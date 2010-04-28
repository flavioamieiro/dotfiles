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

#export PYTHONPATH="$HOME/workspace/shop/modules/:$HOME/bin/"

export WORKON_HOME=$HOME/.virtualenvs
source /usr/bin/virtualenvwrapper.sh

_fab_list(){
    # auto completion for fabfiles
    KEYWORDS=$(fab -l | grep '^ ' | awk '{ print $1 }')
    local cur="${COMP_WORDS[COMP_CWORD]}"
    COMPREPLY=( $(compgen -W "$KEYWORDS" -- ${cur}) )
}
complete -o default -o nospace -F _fab_list fab

_virtualenvs()
{
    PROJECTS=$((cd "$WORKON_HOME"; for f in */bin/activate; do echo $f; done) 2>/dev/null | sed 's|^\./||' | sed 's|/bin/activate||' | sort)
    local cur="${COMP_WORDS[COMP_CWORD]}"
    COMPREPLY=( $(compgen -W "$PROJECTS" -- ${cur}) )
}
complete -o default -o nospace -F _virtualenvs work

function work () {
    # A wrapper for workon (which is already a wrapper)
    # this assumes you have a 'src' dubdir in your
    # virtualenv
    #
    # This creates a rcfile for a virtualenv, creates a
    # subshell using it as rcfile, and goes to the src
    # dir in your virtualenv


    typeset env_name="$1"
    if [ "$env_name" = "" ]
    then
        virtualenvwrapper_show_workon_options
        return 1
    fi

    virtualenvwrapper_verify_workon_environment $env_name || return 1

    echo "source ~/.bashrc
          workon $env_name
          cdvirtualenv
          cd src
          " > ~/.virtualenvrc

    bash --rcfile ~/.virtualenvrc
}
