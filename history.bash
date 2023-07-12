#!/usr/bin/env bash


# Struct of record about book:
# book name
# last read page
# empty line


projectdir=$(dirname $0)


. $projectdir/config.bash


history=$(echo "$projectdir/history")


function history_add_book
{
    local bookpath=$(config_get 'book')
    local bookname=$(basename "$bookpath")

    echo "$bookname" >> $history
    echo "last_page=1" >> $history
    echo >> $history
}


function history_change_last_page
{
    local bookpath=$(config_get 'book')
    local bookname=$(basename "$bookpath")
    local last_page=$(config_get 'current_page')

    local line_bookname=$(cat "$history" \
        | grep -n "$bookname" \
        | cut -d: -f1
    )
    local line_last_page=$(($line_bookname + 1))

    sed -i "${line_last_page}s/.*/last_page=${last_page}/" "$history"
}
