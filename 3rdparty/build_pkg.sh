#!/bin/bash

echo "################################################################"
echo "################### Making the package"
echo "################################################################"
makepkg -sc --noconfirm --skippgpcheck
mv *.pkg.tar.zst ../../../repo/os/x86_64
echo "################################################################"
echo "################### Moved the .zst file to x86_64 folder"
echo "################################################################"
find . -type d -not -path "." -exec sudo rm -r "{}" \;
find . -type f -not -name "*.sh" -not -name "*.install" -not -name PKGBUILD -not -name "*.pkg.tar.zst" -delete
echo "################################################################"
echo "################### Removed all redundant files and folders"
echo "################################################################"
