. ~/.zsh/config
. ~/.zsh/aliases
. ~/.zsh/completion

# use .localrc for setting specific to one system
[[ -f ~/.localrc ]] && . ~/.localrc

# add Pulumi to the PATH
export PATH=$PATH:$HOME/.pulumi/bin
