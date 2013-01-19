# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

###
### User specific environment and startup programs
###

PATH=$PATH:$HOME/.local/bin

# Set up rbenv
PATH=$HOME/.rbenv/bin:$PATH
eval "$(rbenv init -)"

# Set up sbt
# PATH=$HOME/Code/scalafunc/sbt/bin:$PATH

# export $(gnome-keyring-daemon -s)

export PATH
export EDITOR=vim
export VIMRC=~/.vimrc
export SHELLRC=~/.bashrc

# list dotfiles first
export LC_COLLATE=C

# prompt
export PS1='\[\033[01;34m\]\w\[\033[00m\]\$ '

# change directories by typing their name
shopt -s autocd

###
### User specific aliases and functions
###

alias ls='ls --color -h --group-directories-first'
alias l='ls'
alias la='ls -a'
alias ll='ls -l'

# Always colorize tree output
alias tree='tree -C'

# Override rm for safer alternative
alias rm='trash-put'

# Use GitHub shortcuts automatically
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

alias getvideo='youtube-dl'
function getmp3() {
  youtube-dl $1 --extract-audio --title --audio-format mp3
}

# gc this is my commit message
# Stages all modified files in the Git repo, commits them with the arguments
# as a commit message, and pushes.
function gc() {
  git aa
  git cm "$*"
  git p
}

# mvsl <oldpath> <newpath>
# Moves the file and creates a symbolic link from <oldpath> to <newpath>.
function mvsl() {
  mv $1 $2
  ln -s $2 $1
}
