export LSCOLORS="exfxcxdxbxegedabagacad"
export CLICOLOR=true
export PATH="/usr/local/opt/openssl/bin:$PATH"

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

setopt COMPLETE_IN_WORD
setopt APPEND_HISTORY
setopt INC_APPEND_HISTORY SHARE_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_REDUCE_BLANKS
setopt SHARE_HISTORY
setopt CORRECT

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
