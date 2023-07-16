#!/usr/bin/env bash


projectdir=$(dirname $0)


. $projectdir/config.bash


info=$(. $projectdir/info.bash)


title=$(echo "$info" | grep -e "^Title" | tr -s '[:blank:]')
author=$(echo "$info" | grep -e "^Author" | tr -s '[:blank:]')
pages=$(echo "$info" | grep -e "^Pages" | tr -s '[:blank:]')
current_page=("On page: "`config_get "current_page"`)


out="${title}\n${author}\n${pages}\n${current_page}\n"

echo -e "\033[1;4mAbout book\033[0m"
echo -e "$out" | column -t -s:
