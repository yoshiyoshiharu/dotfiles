## alias
alias ls='ls -G'
alias ll='ls -lG'
alias la='ls -laG'

## github alias
alias ga='git add'
alias gc='git commit -m'
alias gch='git checkout'
alias gchm='git checkout master'
alias gp='git push'
alias gs='git status'
alias gl='git log --oneline'
alias gb='git branch'
alias gr='git reset'
alias grh='git reset --hard'
alias grs='git restore --staged'
alias gpso='git push origin'
alias gplo='git pull origin'
alias gplom='git pull origin master'

## Docker
alias dp='docker ps -a'
alias di='docker images'

function deb () {
  docker exec -it $1 /bin/bash
}

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
