# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

# User specific aliases and functions

export EDITOR=vim
export VIMRC=~/.vimrc
export SHELLRC=~/.bashrc

# list dotfiles first
export LC_COLLATE=C

# prompt
PS1='\[\033[01;34m\]\w\[\033[00m\]\$ '

alias ls='ls --color -h --group-directories-first'
alias l='ls'
alias la='ls -a'

alias rm='trash-put'

alias git='hub'
alias g='git'

alias v='vim'
alias sv='sudo vim'

alias vimrc='$EDITOR $VIMRC'
alias shrc='$EDITOR $SHELLRC'

alias shrf='exec $SHELL -l'

alias y='sudo yum'
alias yi='y install'
alias ye='y erase'
alias ys='yum search'
alias yu='y upgrade'
alias yud='y update'
alias yif='yum info'

alias ip='curl -s http://checkip.dyndns.com | sed "s/[^0-9\.]//g"'

function gitd() {
  git aa
  git cm "$1"
  git p
}
