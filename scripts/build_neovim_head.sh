#!/bin/bash

set -euo pipefail

CURRENT_DIR=`dirname $0`
NVIM_SOURCE_DIR=${HOME}/.local/neovim/neovim
NVIM_INSTALL_DIR=${HOME}/.local/nvim

cd ${NVIM_SOURCE_DIR}

git switch master
git pull origin master --ff-only

make \
  CMAKE_BUILD_TYPE=Release \
  CMAKE_INSTALL_PREFIX=${NVIM_INSTALL_DIR}

make install

cd ${CURRENT_DIR}
