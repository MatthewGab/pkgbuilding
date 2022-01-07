#!/bin/bash

user="matthewgabriel@pkgserver"
path="/mnt/packages_scrapped/archlinux/synergy/os/x86_64/"

# create repo db files
(cd ./synergy/os/x86_64/ ; 
repo-add synergy.db.tar.gz *.pkg.tar.zst ;
rm -rf *.old)

# transfer packages & db files to synergy package server
scp ./synergy/os/x86_64/* ${user}:${path}
