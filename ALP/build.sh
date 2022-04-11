#!/bin/bash

# colors
c_red="\033[1;31m"
c_green="\033[1;32m"
c_blue="\033[1;34m"
c_reset="\033[0m"

# create path if not exists
repo_pkg_path="repo/os/x86_64"
if [[ ! -d "../$repo_pkg_path" ]]; then
    mkdir -p "../$repo_pkg_path"
fi

echo ""
echo "######################################"
echo "##### Building DGnet Packages... #####"
echo "######################################"
echo ""

for i in ./DGnet_ALP_*/; do

    #clear
    if [[ -f ${i}"/PKGBUILD" ]]; then
        (printf "\n\n${c_green}$(basename "$i" | sed 's/DGnet_ALP_//g')${c_reset}\n"

        #figlet $(basename "$i" | sed 's/DGnet_ALP_//g' | lolcat ;
        cd "$i" ;
    
        #git checkout dev-stable &&
        #git status &&
	git pull ;

        makepkg --skipinteg \
                --skipchecksums \
                --skippgpcheck \
                --syncdeps \
                --force \
                --clean \
                --noconfirm ;

        mv *.pkg.tar.zst ../../${repo_pkg_path})
	#sleep 5
    else

      printf "\n\n${c_red}[!] No PKGBUILD file found in $(basename "$i")${c_reset}\n"
    fi
done
