#!/usr/bin/env bash


# Show one next page(default behavior)
# Arguments:
    # $1 - page to show(number)


projectdir=$(dirname $0)


. $projectdir/config.bash
. $projectdir/history.bash


book=$(config_get 'book')
pages=$(config_get 'pages')
current_page=$(config_get 'current_page')
save=$(echo "$projectdir/book/current_page")


function get_page
{
    if [[ -n "$1" ]]; then
        new_page=$1
    else
        new_page=$((current_page + 1))
    fi

    if [[ $new_page -ge $pages ]]; then
        echo "You read the last page of book"
        echo "Ready for a new one?"
        exit
    fi

    if [[ $new_page -lt 1 ]]; then
        echo "Start read book from first page"
        new_page=1
    fi

    config_put 'current_page' "$new_page"
    pdftocairo -singlefile -png \
        -f "$new_page" \
        -l "$new_page" \
        "$book" "$save"
    echo "You read $new_page page"
}


if [[ -n "$1" ]]; then
    get_page "$1"
else
    get_page
fi


history_change_last_page
xdg-open "$save.png"
