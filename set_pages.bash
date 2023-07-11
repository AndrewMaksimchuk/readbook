#!/usr/bin/env bash


projectdir=$(dirname $0)


. $projectdir/config.bash


info=$(. $projectdir/info.bash)


pages=$(echo "$info" | grep "Pages" | awk '{print $2}')


config_put 'pages' "$pages"
