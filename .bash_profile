file=$(realpath "$0")
directory=$(dirname "$file")

# If running bash
if [ -n "$BASH_VERSION" ]; then
    # include .profile if it exists
    if [ -f "$HOME/.profile" ]; then
        . "$HOME/.profile"
    else
        exit 0;
    fi;
else
    exit 0;
fi;

declare -a files;

if [ -d "${directory}/rc-enabled" ]; then
    for file in $(/usr/bin/bash -c "ls ${directory}/rc-enabled/*.rc 2>/dev/null");
        do
          if [ -f "${file}" ]; then
            files+=("${file}");
          fi;
        done;
fi;

for file in "${files[@]}"
    do
        source "${file}"
    done;
