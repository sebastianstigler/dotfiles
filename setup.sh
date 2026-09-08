#!/usr/bin/env bash

# Select all directories not starting with an underscore
dirs=$(eza -D -1| grep -v ^_)

for dir in $dirs
  do
    echo stow -R --no-folding $dir
    stow -R --no-folding $dir
  done
