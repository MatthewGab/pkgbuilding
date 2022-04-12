#!/bin/bash
set -e

clear
ALP=$(pwd)"/ALP"
AUR=$(pwd)"/3rdparty"

(cd ${ALP}; ./status-repos.sh && ./build.sh)
(cd ${AUR}; ./auto-build.sh)

case `./pkgcount` in
	0)
		echo ""
		echo "######################################"
		echo "##### Package Count Complete!... #####"
		echo "######################################"
		echo ""
		;;
	1)
		echo ""
		echo "########################################"
		echo "##### Package Count Incomplete!... #####"
		echo "########################################"
		echo ""
		exit 1
		;;
esac

./upload_pkgs.sh pkgupdater pkgtest
