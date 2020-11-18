#!/bin/sh
# This script will clone the dotfiles from github and then symlink them to
# your home directory.
INSTALL_TO=~

warn() {
    echo "$1" >&2
}

die() {
    warn "$1"
    exit 1
}

if [ -e "$INSTALL_TO/dotfiles" ]; then
    echo -n "$INSTALL_TO/dotfiles already exists. Do you want to continue with symlinking files? (Y/n) "
    read answer
    if [ "$answer" == "n" ]; then
        die "Exiting."
    fi
else
    cd "$INSTALL_TO"
    git clone https://github.com/sumpygump/dotfiles.git
fi

symlink_with_checks() {
    targetname="$1"
    sourcepath="$2"
    echo
    echo "Symlinking $targetname..."
    cd ~
    if [ -e "$targetname" ]; then
        warn "$targetname file already exists."
        diff -u "$sourcepath" $targetname > /dev/null
        if [ $? -eq 0 ]; then
            echo "It looks like the files are identical. Skipping."
        else
            echo -n "The files are not the same. Wanna see a diff? (y/N) "
            read answer
            if [ "$answer" == "y" ]; then
                diff -u "$sourcepath" $targetname | less
                echo -n "Wanna delete this file and then use the symlink? (y/N) "
                read answer
                if [ "$answer" == "y" ]; then
                    rm $targetname
                    ln -v -s "$sourcepath"
                fi
            fi
        fi
    else
        ln -v -s "$sourcepath" "$targetname"
    fi
}

symlink_with_checks ".screenrc" "$INSTALL_TO/dotfiles/screen/.screenrc"
symlink_with_checks ".profile" "$INSTALL_TO/dotfiles/bash/.profile"
symlink_with_checks ".bashrc" "$INSTALL_TO/dotfiles/bash/.bashrc"
symlink_with_checks ".bash_aliases" "$INSTALL_TO/dotfiles/bash/.bash_aliases"
symlink_with_checks ".gitconfig" "$INSTALL_TO/dotfiles/git/.gitconfig"
symlink_with_checks ".tmux.conf" "$INSTALL_TO/dotfiles/tmux/.tmux.conf"

echo "You should also do the following."
echo "$ mkdir ~/.fonts"
echo "$ cp $INSTALL_TO/dotfiles/fonts/Envy* ~/.fonts"
echo "$ sudo fc-cache -f -v"
echo

echo "If you haven't already, you should run this too:"
echo "wget -O - https://github.com/sumpygump/vimrc/raw/master/autoinstall.sh | sh"
echo

echo "Done."
