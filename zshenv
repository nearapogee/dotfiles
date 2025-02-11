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
  chruby 3.3.6
fi

#if (( $+commands[/home/linuxbrew/.linuxbrew/bin/brew] )) ; then
if [[ -x /home/linuxbrew/.linuxbrew/bin/brew ]]; then
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

# needs to be after brew setup if installed with brew
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"


path=(~/bin ~/.npm-global/bin /usr/local/go/bin /usr/local/nginx/sbin /usr/local/apache-maven/bin /usr/local/bin /usr/local/sbin ~/.local/bin $path)

if (( $+commands[cargo] )) ; then
  source "$HOME/.cargo/env"
fi
