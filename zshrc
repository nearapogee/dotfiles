. ~/.zsh/config
. ~/.zsh/aliases
. ~/.zsh/completion

# use .localrc for setting specific to one system
[[ -f ~/.localrc ]] && . ~/.localrc

# add Pulumi to the PATH
export PATH=$PATH:$HOME/.pulumi/bin

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/matt/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/matt/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/matt/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/matt/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


# >>> mamba initialize >>>
# !! Contents within this block are managed by 'mamba shell init' !!
export MAMBA_EXE='/home/matt/miniconda3/bin/mamba';
export MAMBA_ROOT_PREFIX='/home/matt/miniconda3';
__mamba_setup="$("$MAMBA_EXE" shell hook --shell zsh --root-prefix "$MAMBA_ROOT_PREFIX" 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__mamba_setup"
else
    alias mamba="$MAMBA_EXE"  # Fallback on help from mamba activate
fi
unset __mamba_setup
# <<< mamba initialize <<<
