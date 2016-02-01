# Aliases
alias ls='ls -G'
alias lt='tree -C'
alias ll='ls -lh'
alias la='ll -a'
alias grep='grep --color=auto'
alias ip="system_profiler SPNetworkDataType | grep 'IPv4 Addresses'"

shopt -s extglob
export JAVA_HOME=`/usr/libexec/java_home -v1.7`
export PATH=/bin:/usr/local/bin:/usr/bin/ruby:$PATH:$JAVA_HOME:$HOME/bin

# Loading personal functions
source $HOME/bin/customFunctions.bash
#source $HOME/bin/privateFunctions.bash
# Custom command prompt line
PS1='\n\[\e[0;37m\]\u\[\e[0m\]@\h: \[\e[0;31m\]\w\n\[\e[0m\] -> '

# Boxen config
[ -f /opt/boxen/env.sh ] && source /opt/boxen/env.sh
export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/9.4/bin
export ANDROID_HOME=/opt/boxen/homebrew/Cellar/android-sdk/24.0.1

# NVM config
export NVM_DIR="/opt/boxen/homebrew/Cellar/nvm/0.30.1"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

# Terminal start up screen (requires `brew install archey`)
archey -c
