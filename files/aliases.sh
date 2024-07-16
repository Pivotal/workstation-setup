#!/usr/bin/env sh

WORKSTATION_SETUP_HOME="$( cd "$( dirname "$0" )/.." >/dev/null 2>&1 && pwd )"

alias gs='git status '
alias ga='git add '
alias gb='git branch '
alias gc='git commit'
alias gd='git diff'
function gco() { git checkout "$@"; }
function gcm() { git commit -m "$@"; }
alias ll='ls -l'
alias gl='git lg'
alias gri='git rebase -i'
alias grc='git rebase --continue'
alias gpr='git pull --rebase'
alias gpf='git push --force-with-lease'
alias gaa='git add -A .'
alias gap='git add -p'
alias gra='git commit --amend --no-edit --reset-author'
alias wip="git add -A && git commit -m'WIP'"
alias unwip='git reset HEAD~'
alias main='git checkout main'
alias current_branch="git symbolic-ref -q HEAD | sed -e 's|^refs/heads/||'"
alias gpsup='git push --set-upstream origin $(current_branch)'
alias be='bundle exec'
alias current='cd ${RX_REVU_HOME}'
alias delete_branch='cb=$(current_branch) && gco master && git branch -D ${cb}'
alias mfa="${WORKSTATION_SETUP_HOME}/bin/mfa"
alias awsume="aws-sso-util login && . awsume -a"
alias gitcp="current_branch | pbcopy"


# Git aliases
git config --global alias.lg "log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative"
