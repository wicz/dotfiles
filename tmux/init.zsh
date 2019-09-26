tmux start-server

if ! tmux has-session 2> /dev/null; then
  tmux new-session -d
fi

tmux -CC attach-session -d
