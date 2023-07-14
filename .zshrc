source ~/.zsh.antigen

## ls alias
alias ls='ls -G'
alias ll='ls -lG'
alias la='ls -laG'

## Docker alias
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

function dex () {
  docker exec -it $1 /bin/bash
}

function dexw () {
  web_container_id=`docker ps -a | grep web | awk '{print $1}'`
  docker exec -it $web_container_id /bin/bash
}

## Docker Compose alias
alias dc='docker-compose'
alias dcu='docker-compose up -d'
alias dcd='docker-compose down'
alias dcp='docker-compose ps'
alias dcr='docker-compose run'
alias dcrw='docker-compose run --rm web'
alias dcrs='docker-compose down && docker-compose up -d'

## Original alias
alias cdp='cd ~/project'
alias cdd='cd ~/project/dotfiles'
alias cds='cd ~/ga/supplier-article'
alias cdc='cd ~/ga/common-db-docker'
alias vz='nvim ~/.zshrc'
alias vv='nvim ~/.vimrc'
alias sz='source ~/.zshrc'

function mcd () {
  mkdir $1
  cd $1
}

## zsh plugins
plugins=(
  zsh-autosuggestions
)


## M1 brew
export PATH=/opt/homebrew/bin:$PATH
export PATH="/opt/homebrew/sbin:$PATH"

## rbenv
export RBENV_ROOT=/opt/homebrew/opt/rbenv
export PATH=$RBENV_ROOT/bin:$PATH
eval "$(rbenv init -)"

## openssl
export PATH="/opt/homebrew/opt/openssl@1.1/bin:$PATH"
export LDFLAGS="-L/opt/homebrew/opt/openssl@1.1/lib"
export CPPFLAGS="-I/opt/homebrew/opt/openssl@1.1/include"
export PKG_CONFIG_PATH="/opt/homebrew/opt/openssl@1.1/lib/pkgconfig"
export RUBY_CONFIGURE_OPTS="--with-openssl-dir=/opt/homebrew/opt/openssl@1.1"


## Go
export GOENV_ROOT="$HOME/.goenv"
export PATH="$HOME/go/bin:$PATH"
eval "$(goenv init -)"

## Git
autoload -Uz vcs_info
setopt prompt_subst
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{magenta}!"
zstyle ':vcs_info:git:*' unstagedstr "%F{yellow}+"
zstyle ':vcs_info:*' formats "%F{cyan}%c%u[%b]%f"
zstyle ':vcs_info:*' actionformats '[%b|%a]'
precmd () { vcs_info }

# Prompt customize
PROMPT='
%n@%m%f%b:%F{white}%~%f $ '

RPROMPT=' %F{cyan}$vcs_info_msg_0_%f'
