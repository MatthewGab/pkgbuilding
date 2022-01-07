#!/bin/bash

# colors
c_red="\033[1;31m"
c_green="\033[1;32m"
c_blue="\033[1;34m"
c_reset="\033[0m"

# Github Personal Token
_token=""
_url="https://dgcrepotool:${_token}@github.com/DamianoGlobal"

# DGnet Arch Linux Package Repositories
declare -a repositories=(
DGnet_ALP_ID20
DGnet_ALP_ID37
)

# Clones everything in the repositories list 
for repo in ${repositories[@]}; do
    if [[ ! -d "$repo" ]]; then
        git clone ${_url}/${repo}
    else
        printf "${c_red}$repo already cloned.${c_reset}\n"
    fi
done
