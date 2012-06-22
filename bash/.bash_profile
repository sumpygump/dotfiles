# set PATH so it includes user's private bin if it exists
if [ -d ~/bin ] ; then
    PATH=~/bin:"${PATH}"
fi

# Add current dir to path
export PATH=./:$PATH

# the default umask is set in /etc/profile
umask 002

# versions of fbi and fbgs when in GNU Screen
alias sfbi='sudo openvt -sw -- fbi'
alias sfbgs='sudo openvt -sw -- fbgs'

# Set preferred editor
export EDITOR=/usr/bin/vim

# Execute the bashrc
if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi

export HAXE_LIBRARY_PATH=/usr/local/haxe/std:. # the ':.' part is important
export HAXE_HOME=/usr/local/haxe
export PATH=$PATH:$HAXE_LIBRARY_PATH:$HAXE_HOME/bin
