#!/bin/bash
# Bash helper functions

# Stands for "open project"
function op() {
  projectDir="$HOME/Project"
  dir="$projectDir/$1"
  redTxt='\e[0;31m'
  clearColor='\e[0m'

  if [ $# -eq 0 ]; then
    echo "Wrong number of arguments. Usage: op <dir-name>"
  else
    if [ -d $dir ]; then
      cd $dir
    else
      printf "\n$redTxt Project $1 not found$clearColor. Check the list of available projects:\n\n"
      ls $projectDir
    fi
  fi
}

# Quickly navigate your filesystem from the command-line. Thanks @jeroenhjanssens
export MARKPATH=$HOME/.marks

function jump {
  cd -P "$MARKPATH/$1" 2>/dev/null || echo "No such mark: $1"
}

function mark {
  mkdir -p "$MARKPATH"; ln -s "$(pwd)" "$MARKPATH/$1"
}

function unmark {
  rm -i "$MARKPATH/$1"
}

function marks {
  \ls -l "$MARKPATH" | tail -n +2 | sed 's/  / /g' | cut -d' ' -f9- | awk -F ' -> ' '{printf "%-10s -> %s\n", $1, $2}'
}
