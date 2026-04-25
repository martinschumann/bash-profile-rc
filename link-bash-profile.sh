#!/bin/bash

file=$(realpath "${BASH_SOURCE[0]}")
directory=$(dirname $file)

red="\\033[0;31m"
green="\\033[0;32m"
reset="\\033[0m"

[ -f "${HOME}/.bash_profile" ] && printf "\\r${red}[FAIL]${reset} %s\\n" "Start up file \".bash_profile\" already exists. Cannot symlink." && exit 1

cd "${HOME}" && ln -s -r "$directory/.bash_profile" && printf "\\r${green}[SUCCESS]${reset} %s\\n" "Symlinked start up file \".bash_profile\" to repo's start up file."

exit 0
