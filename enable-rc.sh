#!/bin/bash

directory="${BASH_SOURCE%/*}"
if [[ ! -d "$directory" ]]; then directory="$PWD"; fi;

source "${directory}/lib.message.sh"

commands=();
commands+=('all')

if [[ -d "${directory}/rc-available" ]]; then
    for file in $(/bin/bash -c "/bin/ls ${directory}/rc-available/*.rc 2>/dev/null");
        do
          if [ -f "$file" ]; then
            commands+=($(basename "${file%.rc}"));
          fi;
        done;
fi;

if [[ $# -gt 1 ]]; then
    _printMessage "Too many arguments, expecting exactly one. Must be one of:" "error";
    printf '    * %s\n' "${commands[@]}"
    exit 1
elif 
    [[ $# -eq 0 ]]; then
    _printMessage "Missing argument. Please provide one of:" "error";
    printf '    * %s\n' "${commands[@]}"
    exit 1
fi;

if [[ ! -f "${directory}/rc-available/${1}.rc" && "${1}" != "all" ]]; then
    _printMessage "Unknown command \"${1}\". Please provide one of:" "error"
    printf '    * %s\n' "${commands[@]}"
fi;

cd "${directory}/rc-enabled"

# Clean up dereferenced symlinks 
find . -type l -exec sh -c 'test -e {} || rm -f {}' ";"

if [[ "${1}" == "all" ]]; then
    for file in $(/bin/bash -c "/bin/ls ../rc-available/*.rc 2>/dev/null"); do
        filename=$(basename "$file")

        if [[ -h "${PWD}/${filename}" ]]; then 
            _printMessage "Command \"${filename%.rc}\" already symlinked." "info";
            continue;
        fi;

        /bin/ln -s "$file" && _printMessage "Command \"$(basename "${file%.rc}")\" symlinked." "success"
    done
else
    if [[ -h "${1}.rc" ]]; then 
        _printMessage "Command \"${1}\" already symlinked." "info";
    else
        /bin/ln -s "../rc-available/${1}.rc" && _printMessage "Command \"${1}\" symlinked." "success"
    fi;
fi;

exit 0;
