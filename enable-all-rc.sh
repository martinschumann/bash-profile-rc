#!/bin/bash

file=$(realpath "$0")
directory=$(dirname "$file")

cd "$directory/rc-enabled"

for rc_file in $(/bin/ls "$directory/rc-available"); do
    ln -s "../rc-available/$rc_file"
done
