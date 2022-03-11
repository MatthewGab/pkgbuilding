#!/bin/bash

# colors
c_red="\033[1;31m"
c_green="\033[1;32m"
c_blue="\033[1;34m"
c_reset="\033[0m"

# Github Personal Token
_token=""
_url="https://dgcrepotool:${_token}@github.com/DamianoGlobal"

# DGnet Program IDs
declare -a IDs=(
1
14
15
19
2
20
21
22
29
3
33
35
37
38
39
4
40
41
42
43
5
6
7
8
)

# Clones Program Repositories in the IDs list
for ID in ${IDs[@]}; do
    if [[ ! -d "DGnet_Program_$ID" ]]; then
        git clone ${_url}"/DGnet_Program_ID"${ID}
    else
        printf "${c_red}DGnet_Program_ID${ID} already cloned.${c_reset}\n"
    fi
done
