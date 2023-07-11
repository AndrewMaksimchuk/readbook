#!/usr/bin/env bash


cwd=$(dirname $0)
path=$(readlink -f $cwd)


function addpath() {
    user=$(who -s | head -1 | awk '{print $1}')
    config=$(echo "/home/$user/$1")

    [[ ! -e $config ]] && return 0

    is_set_env=$(cat $config | grep "READBOOK_INSTALL")
    [[ -n $is_set_env ]] && return 0

    echo >> $config
    echo "export READBOOK_INSTALL=\"$path\"" >> $config
    echo 'export PATH="$PATH:$READBOOK_INSTALL"' >> $config
}


function addcompletion() {
    cp -f $cwd/_readbook_completion /etc/bash_completion.d/

    if [[ -d /usr/share/zsh/vendor-completions/ ]]; then
        cp -f $cwd/_readbook /usr/share/zsh/vendor-completions/
    fi
}


addpath ".bashrc"
addpath ".zshrc"


addcompletion


execfiles=$(echo $cwd/*.bash)
chmod +x $execfiles
