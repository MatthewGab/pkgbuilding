#!/bin/bash

for i in ./*/; do (echo "$i"; cd "$i"; git checkout dev-stable && git pull); done
