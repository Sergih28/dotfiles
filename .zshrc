export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.config"

eval "$(devbox global shellenv)"
eval "$(intelli-shell init zsh)"
eval "$(zoxide init zsh)"
eval "$(mise activate zsh)"
eval "$(starship init zsh)"

INTELLI_SEARCH_HOTKEY=ctrl+i

export ZSH="$HOME/.oh-my-zsh"
# Empty theme so that starship is not overwritten by this
ZSH_THEME=""

export EDITOR="nvim"

# Oh My Zsh uto-update frequency (in days)
zstyle ':omz:update' frequency 1

plugins=(git)
source $(brew --prefix)/opt/zsh-vi-mode/share/zsh-vi-mode/zsh-vi-mode.plugin.zsh

source $ZSH/oh-my-zsh.sh

source ~/.zsh_aliases
