#!/usr/bin/env bash


projectdir=$(dirname $0)


save=$(echo "$projectdir/book/current_page.png")


if [[ ! -e $save ]]; then
    echo "You don\`t read now? Page not exist"
    exit
fi


xdg-open "$save"
