#!/bin/bash -e

dotfiles=$(cd $(dirname $0); pwd)

for file in $dotfiles//.*
do
  filename=$(basename $file)
  echo $filename

  [[ $filename == "." ]] && continue
  [[ $filename == ".." ]] && continue
  [[ $filename == ".git" ]] && continue
  [[ $filename == ".DS_Store" ]] && continue

  unlink $HOME/$filename
  ln -s $dotfiles/$filename $HOME/$filename
done
