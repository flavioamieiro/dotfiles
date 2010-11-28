#!/bin/bash
RELDIR=$(dirname $0)
CURDIR=`cd $RELDIR && pwd` #workaround to print the entire path

link() {
    # Creates a symbolic link to the file you pass in your home
    # If you have a file in a subdirectory, you should mirror
    # that structure here. This is on purpose
    FILEPATH=$1
    TARGET="$CURDIR/$FILEPATH"
    LINKNAME="$HOME/$FILEPATH"
    ln -is $TARGET $LINKNAME
}

link .conkyrc
link .bashrc
link .coderc
link .emacs
link .fehbg
link .fehrc
link .fonts.conf
link .git-completion.bash
link .gitconfig
link .irbrc
link .screenrc
link .skippyrc
link .tint2rc
link .vimrc
link .Xdefaults
link .Xmodmap
link .xinitrc

if [ -d $HOME/.config/openbox/ ]
then
    link .config/openbox/autostart.sh
    link .config/openbox/menu.xml
    link .config/openbox/rc.xml
else
    echo "$HOME/.config/openbox/ not found!"
fi

if [ -d $HOME/bin/ ]
then
    link bin/volume_control
else
    echo "$HOME/bin/ not found!"
fi
