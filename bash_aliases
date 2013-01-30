#!/usr/bin/bash
# bash_aliases

alias s='sudo'

# easy way to open files
alias o='xdg-open'

alias ls='ls --color -h --group-directories-first'
alias l='ls'
alias la='ls -a'
alias ll='ls -l'
alias l.='ls -d .*'

# Always colorize tree output
alias tree='tree -C'
alias lsr='tree | less -R'

# Override rm for safer alternative
alias rm='trash-put'

# Use GitHub shortcuts automatically
alias git='hub'
alias g='git'

alias v='vim'
alias sv='sudo vim'

alias n='cd ~/notes && $EDITOR .'

alias vimrc='$EDITOR $VIMRC'
alias shrc='$EDITOR ~/.bashrc'
alias shal='$EDITOR ~/.bash_aliases'

alias rfal='source ~/.bash_aliases'

alias y='sudo yum'
alias yi='y install'
alias ye='y erase'
alias ys='yum search'
alias yu='y upgrade'
alias yud='y update'
alias yif='yum info'

# colorful cowful fortune
alias lol='fortune | cowsay | lolcat'

# easy extraction of archives based on type
alias unpk='aunpack'
alias pk='apack'

# get your external IP
alias ip="curl -s http://checkip.dyndns.com | sed 's/[^0-9\.]//g'"

# easy file server for the current directory
alias serve='python -m SimpleHTTPServer'

# download videos (or music) from various video sites
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

# up ==> go up one directory
# up 3 ==> go three directories up
function up() {
  path=""
  count=0
  if [ $# -eq 0 ]; then
    cd ..
  else
    while [ "$count" -lt "$1" ]; do
      str=$str"../"
      let count=count+1
    done
    cd $str
  fi
}

# show the frequency of your shell history
function histfreq() {
  numlines="$1"
  if [ $# -eq 0 ]; then
    let numlines=10
  fi
  cut -f1 -d" " $HISTFILE | sort | uniq -c | sort -nr | head -n "$numlines"
}

# query Wikipedia from the command line
function wikipedia() {
  dig +short txt $1.wp.dg.cx | sed -e 's/^"//' -e 's/"$//'
}
alias wp='wikipedia'

# automatically activate virtualenv on directories with a "venv" subdirectory
function cd() {
  builtin cd "$@"
  if [ -d "venv" ]; then
    source venv/bin/activate
  fi
}

# simple command-line alarm application
function alarm() {
  when="$1"
  message="${*:2}"
  echo "notify-send Alarm $message" | at "$when"
}
