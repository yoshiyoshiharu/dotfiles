# My dotfiles

## Setup
```sh
ansible-playbook setup.yml
```

## Build Neovim HEAD
```sh
bash scripts/build_neovim_head.sh
```

## Requires
```sh
git clone https://github.com/zsh-users/antigen.git ~/.zsh/antigen/
```

## TreeSitters
If you need erb treesitter, run below.

```vim
:TSInstall erb
```
