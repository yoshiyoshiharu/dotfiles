#!/bin/bash

devcontainer up --workspace-folder . \
                --additional-features='{
                  "ghcr.io/duduribeiro/devcontainer-features/neovim:1": {},
                  "ghcr.io/georgofenbeck/features/lazygit-linuxbinary:1": {},
                  "ghcr.io/devcontainers/features/github-cli:1": {}
                }' \
                --dotfiles-repository "https://github.com/yoshiyoshiharu/dotfiles" \
                --dotfiles-install-command "./.devcontainer/setup.sh"
