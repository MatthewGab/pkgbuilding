#!/bin/bash

# colors
c_red="\033[1;31m"
c_green="\033[1;32m"
c_blue="\033[1;34m"
c_reset="\033[0m"

# Github Personal Token
_token=""
_url="https://dgcrepotool:$_token@github.com/DamianoGlobal"

# DGnet Product Repositories
declare -a systems=(
1
2
)

# Clones everything in the repositories list
for OS in ${systems[@]}; do
    if [[ ! -d "DGnet_Operating_System$OS" ]]; then
        git clone ${_url}"/DGnet_Operating_System"${OS}
    else
        printf "${c_red}DGnet_Operating_System$OS already cloned.${c_reset}\n"
    fi
done
