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

export HISTSIZE=10000
export HISTFILESIZE=10000

# list dotfiles first
export LC_COLLATE=C

# prompt
export PS1='\[\033[01;34m\]\w\[\033[00m\]\$ '

# change directories by typing their name
shopt -s autocd

###
### User specific aliases and functions
###

if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi
