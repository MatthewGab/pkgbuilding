#!/bin/bash

for i in ./*/; do (cd "$i"; git checkout dev-stable && git pull); done
