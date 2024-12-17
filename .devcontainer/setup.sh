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

apt-get update
apt-get install -y jq ripgrep

# install git-delta
LATEST_GIT_DELTA_VERSION=$(curl -s https://api.github.com/repos/dandavison/delta/releases/latest | jq -r '.name')
wget "https://github.com/dandavison/delta/releases/download/${LATEST_GIT_DELTA_VERSION}/git-delta-musl_${LATEST_GIT_DELTA_VERSION}_amd64.deb"
apt-get install ./git-delta-musl_${LATEST_GIT_DELTA_VERSION}_amd64.deb
