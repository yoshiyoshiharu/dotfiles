#!/bin/bash -e

dotfiles=$(cd $(dirname $0); cd ../; pwd)

function link_files() {
  untarget_files=(
    "."
    ".."
    ".git"
    ".gitattributes"
    "README.md"
    "vscode"
    "scripts"
  )

  for file in $(ls -a $dotfiles)
  do
    filename=$(basename $file)

    [[ ${untarget_files[@]} =~ $filename ]] && continue

    rm -f $HOME/$filename
    ln -s $dotfiles/$filename $HOME/$filename
  done
}

function link_vscode_files() {
  vscode_dir="${HOME}/Library/Application Support/Code/User"

  rm -f "${vscode_dir}/settings.json" "${vscode_dir}/keybidings.json"

  ln -s $dotfiles/vscode/settings.json $HOME/Library/Application\ Support/Code/User/settings.json
  ln -s $dotfiles/vscode/keybidings.json $HOME/Library/Application\ Support/Code/User/keybidings.json
}

function setup_zshrc() {
  rm -rf $HOME/.zsh/antigen/
  git clone https://github.com/zsh-users/antigen.git $HOME/.zsh/antigen/
  exec $SHELL
}

echo "--------------link dotfiles--------------"
link_files

echo "--------------link vscode files--------------"
link_vscode_files

echo "--------------install brew packages--------------"
brew bundle --global

echo "--------------setup .zshrc--------------"
setup_zshrc
