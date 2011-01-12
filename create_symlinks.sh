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

create_dir_if_it_does_not_exist() {
    # Checks for the existence of a directory named "$1". If $1
    # doesn't exist asks the user if it should be created.
    #
    # Returns 1 without creating the directory if the user answers no.
    # Returns 0 after creating the directory if the user answers yes
    # or if the directory already existed.
    DIR="$1"
    if [ ! -d "$DIR" ]
    then
	read -p "$DIR not found. create it? [Y/n] " ANSWER
	# FIXME: There should be a better way to do this
	if [ $ANSWER = "y" -o $ANSWER = "Y" ]
	then
	    echo "Creating $DIR ..."
	    mkdir -p "$DIR"
	else
	    return 1
	fi
    fi
    return 0
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

create_dir_if_it_does_not_exist "$HOME/.config/openbox/"
if [ $? -eq 0 ]
then
    link .config/openbox/autostart.sh
    link .config/openbox/menu.xml
    link .config/openbox/rc.xml
else
    echo "$HOME/.config/openbox/ not found!"
fi

create_dir_if_it_does_not_exist "$HOME/bin/"
if [ $? -eq 0 ]
then
    link bin/volume_control
else
    echo "$HOME/bin/ not found!"
fi
