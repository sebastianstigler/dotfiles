#!/usr/bin/env bash

for dir in $(eza -D -1)
  do
    echo stow -R --no-folding $dir
    stow -R --no-folding $dir
  done
