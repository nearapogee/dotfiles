manpath=($manpath)
fpath=(~/.zsh/functions $fpath)

export NODE_DESCRIPTION="UX501V laptop"
export OBSIDIAN_ROOT=~/Documents/obsidian-matt-20220101
export OBSIDIAN_PERSONAL_ROOT=~/Documents/obsidian-matt-personal-20221101

export ANDROID_SDK_ROOT=/home/matt/Android/Sdk
export NODE_PATH=/usr/local/lib/node_modules

export GOROOT=/usr/local/go
#export GOPATH=~/gocode

if (( $+commands[rbenv] )) ; then
  eval "$(rbenv init - zsh)"
  path=(~/.rbenv/bin $path)
fi
if (( $+commands[chruby-exec] )) ; then
  source /usr/local/share/chruby/chruby.sh
  chruby 3.2.2
fi
if (( $+commands[brew] )) ; then
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
  #PKG_CONFIG_PATH=(/home/linuxbrew/.linuxbrew/lib/pkgconfig/ $PKG_CONFIG_PATH)
fi

path=(~/bin ~/.npm-global/bin /usr/local/go/bin /usr/local/nginx/sbin /usr/local/apache-maven/bin /usr/local/bin /usr/local/sbin $path)
