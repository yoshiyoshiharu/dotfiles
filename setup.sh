#!/bin/bash

dotfiles=$(dirname $0)

# zshに切り替え
chsh -s `which zsh`

for file in $dotfiles/.*
do
  filename=$(basename $file)

  [[ $filename == "." ]] && continue
  [[ $filename == ".." ]] && continue
  [[ $filename == ".git" ]] && continue
  [[ $filename == ".DS_Store" ]] && continue

  unlink $HOME/$filename
  ln -s $file $HOME/$filename
done
