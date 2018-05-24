alias g='git'
alias gN='git-nuke'

# Log (l)
alias gll='git log'
alias gl='git log --topo-order --date=short --pretty=format:"${_git_log_brief_format}"'
alias gls='git log --topo-order --stat --pretty=format:"${_git_log_medium_format}"'
alias gld='git log --topo-order --stat --patch --full-diff --pretty=format:"${_git_log_medium_format}"'
alias glg='git log --topo-order --all --graph --pretty=format:"${_git_log_oneline_format}"'

# Branch (b)
alias gbc='git checkout -b'
alias gbl='git branch  --all --verbose'
alias gbx='git branch --delete'
alias gbX='git branch --delete --force'
alias gbm='git branch --move'
alias gbC='git branch --merged | egrep -v "(^\*|master)" | xargs git branch -d'

# Fetch (f)
alias gf='git fetch'
alias gfm='git pull'

# Push (p)
alias gp='git push'
alias gpf='git push --force-with-lease'
alias gpt='git push --tags'
alias gpc='git push --set-upstream origin HEAD'

# Rebase (r)
alias gri='git rebase --interactive'
alias gra='git rebase --abort'
alias grc='git rebase --continue'

# Stash (s)
alias gs='git stash'
alias gsl='git stash list'
alias gsp='git stash pop'
alias gsx='git stash drop'

# Working copy (w)
alias gwc='git clean -n'
alias gwC='git clean -f'

# Index (i)
alias gir='git reset'

# Conflict (C)
alias gCl='git --no-pager diff --name-only --diff-filter=U'
alias gCa='git add $(gCl)'
alias gCo='git checkout --ours --'
alias gCO='gCo $(gCl)'
alias gCt='git checkout --theirs --'
alias gCT='gCt $(gCl)'

# Remote (R)
alias gRl='git remote --verbose'
alias gRa='git remote add'
alias gRx='git remote rm'
alias gRm='git remote rename'

# Merge (m)
alias gm='git merge'
alias gma='git merge --abort'
