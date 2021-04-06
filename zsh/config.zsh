export LSCOLORS="exfxcxdxbxegedabagacad"
export CLICOLOR=true
export PATH="/usr/local/opt/openssl/bin:/usr/local/opt/curl/bin:/usr/local/sbin:$PATH"
export FZF_PREVIEW_PREVIEW_BAT_THEME=Dracula

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

setopt COMPLETE_IN_WORD
setopt APPEND_HISTORY
setopt INC_APPEND_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_REDUCE_BLANKS
setopt CORRECT
unsetopt CASE_GLOB

# Case-insensitive completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
