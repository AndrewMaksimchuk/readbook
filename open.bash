#!/usr/bin/env bash


projectdir=$(dirname $0)


. $projectdir/config.bash


path_to_book=$(config_get "book")


xdg-open "$path_to_book"
