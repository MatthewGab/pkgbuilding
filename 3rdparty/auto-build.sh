#!/bin/bash

check_pkgbuild() {
 echo "[!] Checking if PKGBUILD is present. --------------------"

 local pkgpath="$1"
 if [[ ! -f "$pkgpath/PKGBUILD" ]]; then
   echo "[!!] $(basename $pkgpath)'s PKGBUILD file is not present. Removing. --------------------"
   rm -rf "$pkgpath"

   echo "Deleted: $(basename $pkgpath). No PKGBUILD present" >> ./errors.txt
 fi 
}

build_pkg() {
  local BUILD_PATH="$1"
  
  echo "[!] Begin Build Process. --------------------"
  (cd "$BUILD_PATH"; ./build_pkg.sh)
}

check_dir() {
  local pkgname="$1"
  local partydir="$PWD/3rdparty"
  
  if [[ -d "$partydir/$pkgname" ]]; then
    echo "[*] $pkgname repository is cloned. --------------------"
    check_pkgbuild "$partydir/$pkgname" && build_pkg "$partydir/$pkgname"
  else
    echo "[!!] $pkgname has not been cloned. --------------------"
  fi
}

main() {
  if [[ ! -d ./3rdparty ]]; then
    # Get Packages from `aurpackages` file
    ./get-pkgs.sh

    for i in $(cat ./aurpackages); do (check_dir "$i"); done

    echo "[!] Deleting 3rdparty repositories directory. --------------------"
    rm -rf ./3rdparty
  fi
}


main
