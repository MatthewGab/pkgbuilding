#!/bin/bash
set -e

clear
ALP=$(pwd)"/ALP"
AUR=$(pwd)"/3rdparty"

(cd ${ALP}; ./status-repos.sh && ./build.sh)
(cd ${AUR}; ./auto-build.sh)

if [ $(./pkgcount) -eq 0 ]; then
	echo ""
	echo "######################################"
	echo "##### Package Count Complete!... #####"
	echo "######################################"
	echo ""
else
	echo ""
	echo "########################################"
	echo "##### Package Count Incomplete!... #####"
	echo "########################################"
	echo ""
	exit 1
fi

./upload_pkgs.sh pkgupdater pkgtest
