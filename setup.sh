#!/usr/bin/env bash

for dir in $(eza -D -1)
  do
    stow -R --no-folding $dir
  done
