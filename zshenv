manpath=($manpath)
fpath=(~/.zsh/functions $fpath)

export NODE_PATH=/usr/local/lib/node_modules

export GOROOT=/usr/local/go
#export GOPATH=~/gocode
path=(~/bin ~/.rbenv/bin /usr/local/go/bin /usr/local/nginx/sbin /usr/local/bin /usr/local/sbin $path)

if (( $+commands[rbenv] )) ; then
  eval "$(rbenv init - zsh)"
fi
if (( $+commands[chruby-exec] )) ; then
  source /usr/local/share/chruby/chruby.sh
  chruby ruby-2.1
fi
