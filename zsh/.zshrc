export ZSH=$HOME/.oh-my-zsh
export ZSH_DISABLE_COMPFIX="true"
source $ZSH/oh-my-zsh.sh

plugins=(git vi-mode)

# ensure needed directories exist
[[ ! -d "${HOME}/.hist" ]] && { mkdir "${HOME}/.hist"; }

export EDITOR=vim
export VISUAL=$EDITOR
export PAGER=less
export TERM='xterm-256color'

export PROMPT='🐔 %3~ %B»%b '
eval "$(direnv hook zsh)"

# we replace the tools shipped by default.
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"

# set up fzf preferences
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='fd --type f --color=never'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND='fd --type d . --color=never'
export FZF_DEFAULT_OPTS="--bind shift-up:preview-up,shift-down:preview-down"
bindkey '^r' fzf-history-widget
bindkey '^t' fzf-file-widget

# setup command history
HISTSIZE=60000
HISTFILE=${HOME}/.hist/${HOST}
SAVEHIST=10000

# quote names for the shell if they contain shell metacharacters or would cause
# ambiguous output
export QUOTING_STYLE=shell

# load supplementary configs if available
[[ -f ${HOME}/.zalias && -r ${HOME}/.zalias ]] && { source ${HOME}/.zalias; }
[[ -f ${HOME}/.zkube && -r ${HOME}/.zkube ]] && { source ${HOME}/.zkube; }
[[ -f ${HOME}/.zfunc && -r ${HOME}/.zfunc ]] && { source ${HOME}/.zfunc; }

# load secret stuff if available
[[ -f ${HOME}/.zsecret && -r ${HOME}/.zsecret ]] && { source ${HOME}/.zsecret }

# some colors
eval $(dircolors -b "${HOME}/.zsh/LS_COLORS")
