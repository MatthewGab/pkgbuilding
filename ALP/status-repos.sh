#!/bin/bash

echo ""
echo "###################################################"
echo "##### Updating DGnet Package Repositories... #####"
echo "###################################################"
echo ""
for i in ./*/; do (echo "$i"; cd "$i"; git status && git pull); done
