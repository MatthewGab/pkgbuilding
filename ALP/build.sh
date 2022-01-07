#!/bin/bash

# create path if not exists
synergy_pkg_path="synergy/os/x86_64"
if [[ ! -d "../$synergy_pkg_path" ]]; then
    mkdir -p "../$synergy_pkg_path"
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
    
    mv *.pkg.tar.zst ../../synergy/os/x86_64/)
done
