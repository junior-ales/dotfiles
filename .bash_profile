# Aliases
alias ls='ls -G'
alias lt='tree -C'
alias ll='ls -lh'
alias la='ll -a'
alias grep='grep --color=auto'
alias ip="system_profiler SPNetworkDataType | grep 'IPv4 Addresses'"

# Loading personal functions
source ~/bin/customFunctions.bash

export PATH=/usr/local/bin:/usr/bin/ruby:$PATH:$HOME/bin

# Custom command prompt line
PS1='\n\[\e[0;37m\]\u\[\e[0m\]@\h: \[\e[0;31m\]\w\n\[\e[0m\] -> '

# Terminal start up screen (requires `brew install archey`)
archey -c
