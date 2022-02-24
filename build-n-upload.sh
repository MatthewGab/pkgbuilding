#!/bin/bash
set -e

ALP=$(pwd)"/ALP"
AUR=$(pwd)"/3rdparty"

build_ALP() {
	(cd ${ALP}; ./build.sh)
}

build_AUR() {
	(cd ${AUR}; ./auto-build.sh)
}

upload_pkgs() {
	./upload_pkgs.sh pkgupdater pkgtest
}

build_ALP
build_AUR
upload_pkgs
