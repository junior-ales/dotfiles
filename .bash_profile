shopt -s extglob
export JAVA_HOME=`/usr/libexec/java_home -v1.8`
export PATH=/bin:/usr/local/bin:/usr/bin/ruby:$PATH:$JAVA_HOME:$HOME/bin

# Loading personal functions
source $HOME/bin/customFunctions.bash

# Loading git prompt file and enabling some options
source $HOME/.git-prompt.sh

GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWUNTRACKEDFILES=1
GIT_PS1_SHOWCOLORHINTS=1

# Custom command prompt line
PS1='\n\[\e[0;37m\]\u\[\e[0m\]@\h: \[\e[0;31m\]\w\n\[\e[0m\]$(__git_ps1 " (%s)") -> '

# Boxen config
[ -f /opt/boxen/env.sh ] && source /opt/boxen/env.sh
export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/9.4/bin
export ANDROID_HOME=/opt/boxen/homebrew/Cellar/android-sdk/24.0.1

# NVM config
export NVM_DIR="/opt/boxen/homebrew/Cellar/nvm/0.30.1"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

# Terminal start up screen (requires `brew install archey`)
archey -c
