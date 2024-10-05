#!/bin/bash -e

echo "--------------link dotfiles--------------"
target_files=(
  ".gitconfig"
  ".config"
)

for file in ${target_files[@]}
do
  ln -s $HOME/dotfiles/$file $HOME/$file
done
