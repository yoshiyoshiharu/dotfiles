#!/bin/bash

current_dir=$PWD

dotfiles=$(dirname $0)
echo $dotfiles

cd $dotfiles

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

cd $current_dir
