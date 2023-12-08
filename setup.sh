#!/bin/bash

dotfiles=$(dirname $0)
echo $dotfiles

for file in $dotfiles/.*
do
  filename=$(basename $file)
  echo $filename

  [[ $filename == "." ]] && continue
  [[ $filename == ".." ]] && continue
  [[ $filename == ".git" ]] && continue
  [[ $filename == ".DS_Store" ]] && continue

  unlink $HOME/$filename
  ln -s $dotfiles/$filename $filename
done
