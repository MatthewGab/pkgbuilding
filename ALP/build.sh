#!/bin/bash

for i in ./*/; do 
    (cd "$i" ;
    #git checkout dev-stable && git pull ;

    makepkg --skipinteg \
            --skipchecksums \
            --skippgpcheck \
            --syncdeps \
            --clean ;
    
    mv *.pkg.tar.zst ../../synergy/os/x86_64/)
done
