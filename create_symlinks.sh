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
link .git-completion.bash
link .fehbg
link .fehrc
link .fonts.conf
link .gitconfig
link .screenrc
link .skippyrc
link .tint2rc
