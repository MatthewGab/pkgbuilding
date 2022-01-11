#!/bin/bash

# create path if not exists
repo_pkg_path="repo/os/x86_64"
if [[ ! -d "../$repo_pkg_path" ]]; then
    mkdir -p "../$repo_pkg_path"
fi

for i in ./*/; do 
    (cd "$i" ;
    git checkout dev-stable && git pull ;

    makepkg --skipinteg \
            --skipchecksums \
            --skippgpcheck \
            --syncdeps \
            --force \
            --clean \
            --noconfirm ; 
    
    mv *.pkg.tar.zst ../../${repo_pkg_path})
done
