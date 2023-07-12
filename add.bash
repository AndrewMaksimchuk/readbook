#!/usr/bin/env bash


projectdir=$(dirname $0)


. $projectdir/config.bash


if [[ -z $1 ]]; then
    echo "Add path to book in single quote"
    echo "Example: readbook add '/home/user/books/unix.pdf'"
    exit
fi


cat "$projectdir/config_default" > "$projectdir/config"


config_put "book" $1


. $projectdir/set_pages.bash
