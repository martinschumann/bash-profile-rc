#!/bin/bash

file=$(realpath "${BASH_SOURCE[0]}")
directory=$(dirname "$file")

red="\\033[0;31m"
green="\\033[0;32m"
reset="\\033[0m"

cd "$directory/rc-enabled"

for rc_file in $(/bin/ls "$directory/rc-available"); do
    ln -s "../rc-available/$rc_file" || printf "\\r${red}[FAIL]${reset} %s\\n" "Failed to symlink rc file. Aborting." && exit 1
done

printf "\\r${green}[SUCCESS]${reset} %s\\n" "Symlinked all rc files."
