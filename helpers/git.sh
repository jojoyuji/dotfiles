# git functions
function gflowBeforeFinish(){
  curBranch=$(git rev-parse --abbrev-ref HEAD)
  echo "Fetching ${1}..."
  git checkout $1 &>/dev/null
  git pull &>/dev/null
  echo "Switching back to ${curBranch}..."
  git checkout $curBranch &>/dev/null
  echo "Merging ${1} into ${curBranch}..."
  git merge $1
}
function gmm() {
  gflowBeforeFinish master
}
function gmd() {
  gflowBeforeFinish develop
}

alias g="git"
alias gl="git pull"
#alias gf="~/Desktop/binds/git/gitflow/git-flow"
alias gt="git log --graph --pretty=oneline --abbrev-commit"
alias gb="git branch"
alias gup="git remote update origin --prune"
alias gf="git-flow"
alias gco="git checkout"
alias gcm="git checkout master"
alias gcd="git checkout develop"
alias gc='git commit -m'
# Undo a `git push`
alias undopush="git push -f origin HEAD^:master"
alias undocommit="git reset --soft HEAD~1"
# Git Status
alias gs='git status'
# git root
alias gr='[ ! -z `git rev-parse --show-cdup` ] && cd `git rev-parse --show-cdup || pwd`'
