## ls alias
alias ls='ls -G'
alias ll='ls -lG'
alias la='ls -laG'

## Git alias
alias ga='git add'
alias gc='git commit -m'
alias gd='git diff'
alias dgm='git diff master'
alias gch='git checkout'
alias gchm='git checkout master'
alias gs='git status'
alias gl='git log --oneline'
alias gb='git branch'
alias grc='git rebase --continue'
alias gpso='git push origin'
alias gpsoh='git push origin HEAD'
alias gplo='git pull origin'
alias gplom='git pull origin master'

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

function deb () {
  docker exec -it $1 /bin/bash
}

## Docker Compose alias
alias dc='docker-compose'
alias dcu='docker-compose up -d'
alias dcd='docker-compose down'
alias dcp='docker-compose ps'
alias dcr='docker-compose run'
alias dcrw='docker-compose run web'
alias dcrs='docker-compose down && docker-compose up -d'

## original alias
alias cdp='cd ~/project'
alias cdb='cd ~/project/bootcamp'
alias cdd='cd ~/project/dotfiles'
alias cdba='cd ~/project/bootcamp-app'
alias vz='vim ~/.zshrc'
alias sz='source ~/.zshrc'

function gpsd () {
  cd ~/project/dotfiles
  git add -u
  git commit -m $1
  git push origin master
}

function mcd () {
  mkdir $1
  cd $1
}

## For bootcamp alias
function deba () {
  id=$(docker ps -aqf "name=bootcamp-app-web-1")
  docker exec -it $id /bin/bash
}

## Ruby alias
alias rb='ruby'
alias rs='rspec'
alias b='bundle'
alias be='bundle exec'


## Rails alias
alias r='rails'
alias rdb='rails db'
alias rdbm='rails db:migrate'
alias dbrs='dcrw rails db:reset'

## M1 brew
export PATH=/opt/homebrew/bin:$PATH
export PATH="/opt/homebrew/sbin:$PATH"

## anyenv
eval "$(anyenv init -)"

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

## python3.9
export PATH=/opt/homebrew/bin:$PATH
export PATH=/opt/homebrew/opt/python@3.9/libexec/bin:$PATH

## Go
export GOENV_ROOT="$HOME/.goenv"
export PATH="$GOENV_ROOT/bin:$PATH"
eval "$(goenv init -)"
