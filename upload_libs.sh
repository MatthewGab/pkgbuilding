#!/bin/bash

if [[ ! -n "$1" && ! -n "$2" ]]; then
    echo "Please specify a user & repo name"
    exit 1
fi

user="$1@pkgserver"
repo="$2"
repo_path="./repo/libs"
path="/mnt/packages_scrapped/archlinux/$repo/libs"

# transfer packages & db files to package server
scp ${repo_path}/* ${user}:${path}

# Remove all files in local dir: os/x86_64
rm -rf ${repo_path}/*
