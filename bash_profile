# ~/.bash_profile

###
### ENVIRONMENT VARIABLES
###

# Sort strings by special characters before uppercase before lowercase
export LC_COLLATE=C

export EDITOR=vim
export EDITOR_CONFIG=~/.vimrc
export VIMRC=$EDITOR_CONFIG

export SHELL_CONFIG=~/.bash_profile

export IDEAS_DIR=~/dev/ideas

# Simple, clean prompt
export PS1='\[\033[01;34m\]\w\[\033[00m\]\$ '

# Change the terminal title to be the current working directory
export PROMPT_COMMAND='echo -ne "\033]0;${PWD/$HOME/~}\007"'

export GOROOT=~/.local/lib/go
export GOBIN=$GOROOT/bin

export PATH=~/.local/bin:~/.rbenv/bin:$GOBIN:$PATH

eval "$(rbenv init -)"

###
### OPTIONS
###

shopt -s autocd
shopt -s cdspell
shopt -s cmdhist
shopt -s dirspell
shopt -s histappend
shopt -s globstar
shopt -s nocaseglob

###
### ALIASES AND FUNCTIONS
###

alias s='sudo'

alias e=$EDITOR
alias se='sudo $EDITOR'

alias o='xdg-open'

alias c='cd'

alias ls='ls --color --human-readable --group-directories-first'
alias l='ls'
alias la='l -a'
alias ll='l -l'
alias l.='l -d .*'
alias lr='tree -C | less -R'

# Make rm send things to the trash, and not permanently delete them.
alias rm='trash-put'

# Tmux shortcuts
alias tn='tmux new -s'
alias td='tmux detach'
alias ta='tmux attach -t'
alias ts='tmux list-sessions'

# Extend Git with GitHub shortcuts
alias git='hub'

alias g='git'

alias be='bundle exec'

# Get to my notes directory easily
alias n='cd ~/notes && e .'

# Open up my editor's config file
alias erc='e $EDITOR_CONFIG'
alias shrc='e $SHELL_CONFIG'
alias ideas='e $IDEAS_DIR'

alias y='sudo yum'
alias yi='y install'
alias yr='y remove'
alias ys='y search'
alias yu='y update'
alias yif='y info'

# Colorful cowful fortune
alias lol='fortune | cowsay | lolcat'

# Get your external IP
alias ip="curl -s http://checkip.dyndns.com | sed 's/[^0-9\.]//g'"

# easy file server for the current directory
alias serve='python -m SimpleHTTPServer'

# download videos (or music) from various video sites
alias getvideo='youtube-dl'
function getmp3() {
  youtube-dl $1 --extract-audio --title --audio-format mp3
}

# gc <commit message ...>
# Stages all modified files in the Git repo, commits them with the arguments
# as a commit message, and pushes.
function gc() {
  git add .
  git add -u
  git status
  git commit -m "$*"
  git push
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

# Query Wikipedia from the command line
function wikipedia() {
  dig +short txt $1.wp.dg.cx | sed -e 's/^"//' -e 's/"$//'
}
alias wp='wikipedia'

# Automatically activate virtualenv on directories with a "venv" subdirectory
function cd() {
  builtin cd "$@"
  # If changing the directory didn't work, don't do anything else.
  if [ $? -ne 0 ]; then
    return
  fi
  if [ -d "venv" ]; then
    source venv/bin/activate
  fi
  # List the contents every time you cd into a directory
  echo
  ls
}

# alarm <when> <message...>
# A simple command-line alarm scheduler.
function alarm() {
  when="$1"
  message="${*:2}"
  echo "notify-send Alarm $message" | at "$when"
}

