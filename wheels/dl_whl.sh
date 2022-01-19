#!/bin/bash

python -m venv ./venv
source ./venv/bin/activate

pip install --upgrade pip

pip download --only-binary :all: --dest ./ --no-cache "$@"

deactivate

if [[ -d ./whl/ ]]; then
    rm -rf ./whl && mkdir -p ./whl
    mv -f *.whl ./whl
else
    mkdir -p ./whl
    mv -f *.whl ./whl
fi

rm -rf ./venv

# Compress the whl directory
printf "\n"
read -p "Compressing the whl directory. Enter a name for it: " name
(cd ./whl ; tar -czvf ../${name}.tar.gz .)
