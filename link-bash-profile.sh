#!/bin/bash

file=$(realpath "${BASH_SOURCE[0]}")
directory=$(dirname $file)

source "$directory/lib.sh"

[ -h "${HOME}/.bash_profile" ] && _printMessage "Start up file \".bash_profile\" already symlinked." "info" && exit 1
[ -f "${HOME}/.bash_profile" ] && _printMessage "Start up file \".bash_profile\" already exists. Cannot symlink." "error" && exit 1

cd "${HOME}" && /bin/ln -s -r "${directory}/.bash_profile" && _printMessage "Symlinked start up file \".bash_profile\" to repo's start up file." "success" && exit 0
