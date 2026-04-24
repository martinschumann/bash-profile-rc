#!/usr/bin/env bash

#   !/bin/bash

cd $HOME

file=$0
directory=$(dirname $file)

red="\\033[0;31m"
reset="\\033[0m"

[ -f "$HOME/.bash_profile" ] && printf "\\r${red}[FAIL]${reset} %s\\n" 'Start up file ".bash_profile" already exists. Cannot link.' && exit 1

ln -s "$directory/.bash_profile"

exit 0