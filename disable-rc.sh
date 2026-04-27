#!/bin/bash

directory="${BASH_SOURCE%/*}"
if [[ ! -d "$directory" ]]; then directory="$PWD"; fi;

source "$directory/lib.sh"

declare -a commands;
commands+=('all')

if [[ -d "${directory}/rc-enabled" ]]; then
    for file in $(/bin/bash -c "/bin/ls ${directory}/rc-enabled/*.rc 2>/dev/null");
        do
            if [ -f "${file}" ]; then
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

if [[ ! -f "${directory}/rc-enabled/${1}.rc" && "${1}" != "all" ]]; then
    _printMessage "Unknown command \"${1}\". Please provide one of:" "error"
    printf '    * %s\n' "${commands[@]}"
fi;

cd "$directory/rc-enabled"

# Clean up dereferenced symlinks 
find . -xtype l -delete &> /dev/null

if [[ "${1}" == "all" ]]; then
    for command in ${commands[@]}; do
        if [[ "${command}" == 'all' ]]; then continue; fi;

        if [[ -h "${command}.rc" ]]; then 
            /bin/rm -f "${command}.rc" && _printMessage "Command \"${command}\" has been unlinked." "success";
        fi;
    done
else
    if [[ -h "${1}.rc" ]]; then 
        /bin/rm -f "${1}.rc" && _printMessage "Command \"${command}\" has been unlinked." "success";
    fi;
fi;

exit 0;
