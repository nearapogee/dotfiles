manpath=($manpath)
fpath=(~/.zsh/functions $fpath)

export NODE_PATH=/usr/local/lib/node_modules

export GOROOT=$HOME/go
export GOPATH=~/gocode
path=(~/bin ~/.rbenv/bin ~/gocode/bin ~/go/bin /usr/local/nginx/sbin /usr/local/bin /usr/local/sbin $path)

eval "$(rbenv init -)"
