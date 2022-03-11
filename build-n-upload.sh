#!/bin/bash
set -e

ALP=$(pwd)"/ALP"
AUR=$(pwd)"/3rdparty"

(cd ${ALP}; ./build.sh)
(cd ${AUR}; ./auto-build.sh)
./upload_pkgs.sh pkgupdater pkgtest
