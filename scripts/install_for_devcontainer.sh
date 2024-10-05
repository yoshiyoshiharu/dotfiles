#!/bin/bash -e

function setup_zshrc() {
  rm -rf $HOME/.zsh/antigen/
  git clone https://github.com/zsh-users/antigen.git $HOME/.zsh/antigen/
  exec $SHELL
}

echo "--------------setup .zshrc--------------"
setup_zshrc
