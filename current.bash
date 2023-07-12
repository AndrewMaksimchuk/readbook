#!/usr/bin/env bash


projectdir=$(dirname $0)


. $projectdir/history.bash


save=$(echo "$projectdir/book/current_page.png")


if [[ ! -e $save ]]; then
    echo "You don\`t read now? Page not exist"
    exit
fi


history_change_last_page
xdg-open "$save"
