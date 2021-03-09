#!/bin/bash -e

# link dotfiles
dotfiles=$(cd $(dirname $0); cd ../; pwd)
untarget_files=(
  "."
  ".."
  ".git"
  ".gitattributes"
  "README.md"
  "setup.sh"
)

for file in $(ls -a $dotfiles)
do
  filename=$(basename $file)

  [[ ${untarget_files[@]} =~ $filename ]] && continue

  echo $filename
  unlink $HOME/$filename
  ln -s $dotfiles/$filename $HOME/$filename
done

# install brew packages
brew bundle --global

# intsall pgcli
pip install -U pgcli
