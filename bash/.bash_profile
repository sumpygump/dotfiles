# versions of fbi and fbgs when in GNU Screen
alias sfbi='sudo openvt -sw -- fbi'
alias sfbgs='sudo openvt -sw -- fbgs'

# Execute the bashrc
if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi

export HAXE_LIBRARY_PATH=/usr/local/haxe/std:. # the ':.' part is important
export HAXE_HOME=/usr/local/haxe
export PATH=$PATH:$HAXE_LIBRARY_PATH:$HAXE_HOME/bin
