manpath=($manpath)
fpath=(~/.zsh/functions $fpath)

export ANDROID_SDK_ROOT=/home/matt/Android/Sdk
export NODE_PATH=/usr/local/lib/node_modules

export GOROOT=/usr/local/go
#export GOPATH=~/gocode
path=(~/bin /home/linuxbrew/.linuxbrew/bin ~/.rbenv/bin ~/.yarn/bin ~/.npm-global/bin /usr/local/go/bin /usr/local/nginx/sbin /usr/local/apache-maven/bin /usr/local/bin /usr/local/sbin $path)

if (( $+commands[rbenv] )) ; then
  eval "$(rbenv init - zsh)"
fi
if (( $+commands[chruby-exec] )) ; then
  source /usr/local/share/chruby/chruby.sh
  #chruby 2.6.5
  chruby 2.7.2
fi
