#!/bin/bash

dotfiles=$(dirname $0)
echo "aaaa"
echo $dotfiles

for file in $dotfiles/.*
do
  filename=$(basename $file)


  [[ $filename == "." ]] && continue
  [[ $filename == ".." ]] && continue
  [[ $filename == ".git" ]] && continue
  [[ $filename == ".DS_Store" ]] && continue

  unlink $HOME/$filename
  ln -s $dotfiles/$file $HOME/$filename
done
