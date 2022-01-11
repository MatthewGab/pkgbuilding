#!/bin/bash

if [[ ! -n "$1" && ! -n "$2" ]]; then
    echo "Please specify a user & repo name"
    exit 1
fi

user="$1@pkgserver"
repo="$2"
repo_path="./repo/os/x86_64"
path="/mnt/packages_scrapped/archlinux/$repo/os/x86_64/"

# create repo db files
(cd ${repo_path} ; 
repo-add $repo.db.tar.gz *.pkg.tar.zst ;
rm -rf *.old)

# transfer packages & db files to package server
scp ${repo_path}/* ${user}:${path}

# Remove all files in local dir: os/x86_64
rm -rf ${repo_path}/*
