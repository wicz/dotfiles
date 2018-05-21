export ANTIBODY_HOME="$HOME/.cache/antibody"

antibody bundle < "$ZSH/antibody/bundles.txt" > "$HOME/.zsh_plugins.sh"
antibody update
