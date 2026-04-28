file=$(realpath "${BASH_SOURCE[0]}")
directory=$(dirname "${file}")

# If running bash
if [[ -n "$BASH_VERSION" ]]; then
    # Include .profile if it exists
    if [ -f "${HOME}/.profile" ]; then
        . "${HOME}/.profile"
    fi;
fi;

files=();

if [[ -d "${directory}/rc-enabled" ]]; then
    for file in $(/bin/bash -c "ls ${directory}/rc-enabled/*.rc 2>/dev/null");
        do
            if [[  -f "$file" ]]; then
                files+=("$file");
            fi;
        done;
fi;

if [[ -d "${directory}/rc.d" ]]; then
    for file in $(/bin/bash -c "ls ${directory}/rc.d/*.rc 2>/dev/null");
        do
            if [[  -f "$file" ]]; then
                files+=("$file");
            fi;
        done;
fi;

for file in "${files[@]}"
    do
        source "$file"
    done;
