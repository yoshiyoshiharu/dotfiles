source ~/.zsh.antigen

## ls alias
alias ls='ls -G'
alias ll='ls -lG'
alias la='ls -laG'

## Git alias
alias ga='git add'
alias gc='git commit'
alias gd='git diff'
alias dgm='git diff master'
alias gsw='git switch'
alias gswm='git switch master'
alias gswd='git switch develop'
alias grsh='git reset --hard'
alias grss='git reset --soft'
alias gst='git stash'
alias gs='git status'
alias gl='git log --oneline'
alias gb='git branch'
alias gr='git rebase'
alias grc='git rebase --continue'
alias gpso='git push origin'
alias gpsoh='git push origin HEAD'
alias gplo='git pull origin'
alias gplom='git pull origin master'
alias gplod='git pull origin develop'
alias lg='lazygit'

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
alias cdga='cd ~/ga'
alias cds='cd ~/ga/supplier-article'
alias cdc='cd ~/ga/common-db-docker'
alias vd='nvim ~/project/dotfiles'
alias sz='source ~/.zshrc'

function mcd () {
  mkdir $1
  cd $1
}

## zsh plugins
plugins=(
  zsh-autosuggestions
)

## rbenv
eval "$(rbenv init - zsh)"

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

## edit command line
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey '^xe' edit-command-line


function left-prompt {
  name_t='179m%}'      # user name text clolr
  name_b='000m%}'    # user name background color
  path_t='255m%}'     # path text clolr
  path_b='031m%}'   # path background color
  arrow='087m%}'   # arrow color
  text_color='%{\e[38;5;'    # set text color
  back_color='%{\e[30;48;5;' # set background color
  reset='%{\e[0m%}'   # reset
  sharp="\uE0B0"      # triangle

  user="${back_color}${name_b}${text_color}${name_t}"
  dir="${back_color}${path_b}${text_color}${path_t}"
  echo "${user}%n%#@%m${back_color}${path_b}${text_color}${name_b}${sharp} ${dir}%~${reset}${text_color}${path_b}${sharp}${reset} ${text_color}${arrow}> ${reset}"
}

PROMPT=`left-prompt`
RPROMPT=' %F{cyan}$vcs_info_msg_0_%f'
