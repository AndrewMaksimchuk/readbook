#!/usr/bin/env bash


projectdir=$(dirname $0)
file=$(echo $projectdir/config)
content=$(cat $file)


function config_get
{   # $1 - key
    echo "$content" | grep -w $1 | cut -d "=" -f 2
}


function config_put
{   # $1 - key $2 - value
    sed -i -e "s|^${1}=.*|${1}=${2}|" $file
}
