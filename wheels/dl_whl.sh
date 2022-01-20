#!/bin/bash
set -e

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
(mv ./whl ./${name}; tar -czvf ./${name}.tar.gz ./${name}; rm -rf ./${name})

# move compressed files to repo/libs
libs_path="repo/libs"
if [[ ! -d "../$libs_path" ]]; then
    mkdir -p "../$libs_path"
fi

mv ./*.tar.gz ../${libs_path}
