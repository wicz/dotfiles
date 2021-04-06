if [[ ! -d "$HOME/.config/nvim" ]]; then
  curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

  mkdir -p ~/.config/nvim/
  ln -sf "$ZSH/neovim/init.vim" ~/.config/nvim
  ln -sf "$ZSH/neovim/after" ~/.config/nvim
  pip3 install neovim
fi
