#!/bin/bash

for i in ./*/; do (echo "$i"; cd "$i"; git status && git pull); done
