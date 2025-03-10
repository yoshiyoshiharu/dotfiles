source ~/.zsh.antigen

export EDITOR=nvim
bindkey -e

alias ls='ls -G'
alias ll='ls -lG'
alias la='ls -laG'

alias g='git'
alias d='docker'
alias dr='docker run'
alias dst='docker start'
alias dsp='docker stop'
alias dp='docker ps -a'
alias dct='docker container'
alias di='docker image'
alias dv='docker volume'
alias dn='docker network'
alias db='docker build'

alias dc='docker compose'
alias dcu='docker compose up -d'
alias dcd='docker compose down'
alias dcp='docker compose ps'
alias dcr='docker compose run'
alias dcrw='docker compose run --rm web'
alias dcrs='docker compose down && docker-compose up -d'

alias sz='source ~/.zshrc'
alias nv='nvim'

alias tm='tmux new -s ${PWD:t}'

## zsh plugins
plugins=(
  zsh-autosuggestions
)

## Git
autoload -Uz vcs_info
setopt prompt_subst
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{magenta}!"
zstyle ':vcs_info:git:*' unstagedstr "%F{yellow}+"
zstyle ':vcs_info:*' formats "%F{cyan}%c%u[%b]%f"
zstyle ':vcs_info:*' actionformats '[%b|%a]'
precmd () { vcs_info }

autoload -Uz edit-command-line
zle -N edit-command-line
bindkey '^xe' edit-command-line

## Neovim
export NEOVIM_HOME=$HOME/.local/nvim
if [ -d "${NEOVIM_HOME}" ]; then
  export PATH="${NEOVIM_HOME}/bin:$PATH"
fi

function left-prompt {
  name_t='179m%}'
  name_b='000m%}'
  path_t='255m%}'
  path_b='031m%}'
  arrow='087m%}'
  text_color='%{\e[38;5;'
  back_color='%{\e[30;48;5;'
  reset='%{\e[0m%}'
  sharp="\uE0B0"

  user="${back_color}${name_b}${text_color}${name_t}"
  dir="${back_color}${path_b}${text_color}${path_t}"
  echo "${user}%n%#@%m${back_color}${path_b}${text_color}${name_b}${sharp} ${dir}%~${reset}${text_color}${path_b}${sharp}${reset} ${text_color}${arrow}> ${reset}"
}

PROMPT=`left-prompt`
RPROMPT=' %F{cyan}$vcs_info_msg_0_%f'

eval "$(/opt/homebrew/bin/brew shellenv)"
eval "$(mise activate zsh)"

## Lazy git configfile path
export XDG_CONFIG_HOME="$HOME/.config"
eval "$(zoxide init zsh --hook prompt )"
