export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.config"

eval "$(devbox global shellenv)"
eval "$(intelli-shell init zsh)"
eval "$(zoxide init zsh)"
eval "$(mise activate zsh)"

INTELLI_SEARCH_HOTKEY=ctrl+i

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="apple"

export EDITOR="nvim"

# Oh My Zsh uto-update frequency (in days)
zstyle ':omz:update' frequency 1

plugins=(git)

source $ZSH/oh-my-zsh.sh

source ~/.zsh_aliases
