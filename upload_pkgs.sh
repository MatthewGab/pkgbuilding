#!/bin/bash

if [[ ! -n "$1" && ! -n "$2" ]]; then
    echo "Please specify a user & repo name"
    exit 1
fi

user="$1@pkgserver"
repo="$2"
repo_path="./repo/os/x86_64"
server_repo="./${repo}/os/x86_64"
path="/mnt/packages_scrapped/archlinux/$repo"

# get current package repository from server
scp -r ${user}:${path} .

# update packages and database files
(mv ${repo_path}/* ${server_repo} ;
cd ${server_repo} ;
repo-add $repo.db.tar.gz *.pkg.tar.zst ;
rm -f *.old)

# transfer packages & db files to package server
scp ${server_repo}/* ${user}:${path}/os/x86_64

# Remove all files in local dir: os/x86_64
rm -rf ${repo_path} ${repo}
