# Some useful aliases.

# Clean temporary files created by TeX and friends
alias texclean='rm -fv *.toc *.aux *.log *.cp *.fn *.tp *.vr *.pg *.ky'

alias h='history'

# Function which adds an alias to the current shell and to
# the ~/.bash_aliases file.
add-alias ()
{
   local name=$1 value="$2"
   echo alias $name=\'$value\' >>~/.bash_aliases
   eval alias $name=\'$value\'
   alias $name
}

# get current host related info
function ii()
{
    echo -e "\nHello ${RED}$USER"
    echo -e "\nSystem information:$NC " ; uname -a
    echo -e "\n${RED}Machine stats :$NC " ; uptime
    echo -e "\n${RED}Storage stats :$NC " ; df -h | grep -v /var/run | grep -v /var/lock | grep -v ureadahead | grep -v /dev/shm
    #echo -e "\n${RED}Memory stats :$NC " ; free -m
    echo -en "\n${RED}Local IP Address :$NC " ; ifconfig | grep 'inet ' | grep -v '127.0.0.1' | cut -d: -f2 | awk '{ printf "%s",$2}'
    echo -en "\n${RED}ISP Address :$NC " ; wget http://quantalideas.com/service/ipaddress.php?ip -O - -q
    echo ""
}

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Aliases for ls
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Additional aliases
#alias ack='ack-grep'
alias ltr='ls -ltr'
