defaults write com.googlecode.iterm2 PrefsCustomFolder -string "$ZSH/iterm2"
defaults write com.googlecode.iterm2 LoadPrefsFromCustomFolder -int 1

mkdir -p "$HOME/Library/Application Support/iTerm2/"
rm -rf "$HOME/Library/Application Support/iTerm2/DynamicProfiles" && \
  ln -s "$ZSH/iterm2/profiles" "$HOME/Library/Application Support/iTerm2/DynamicProfiles"
