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
