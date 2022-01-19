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
declare -a products=(
ID1
ID4
)

# Clones everything in the repositories list
for repo in ${products[@]}; do
    if [[ ! -d "DGnet_Product_$repo" ]]; then
        git clone ${_url}"/DGnet_Product_"${repo}
    else
        printf "${c_red}DGnet_Product_$repo already cloned.${c_reset}\n"
    fi
done
