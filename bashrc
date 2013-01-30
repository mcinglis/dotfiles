# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

###
### User specific environment and startup programs
###

PATH=~/.local/bin:~/.cabal/bin:$PATH

# Set up rbenv
PATH=$HOME/.rbenv/bin:$PATH
eval "$(rbenv init -)"

# Set up sbt
# PATH=$HOME/Code/scalafunc/sbt/bin:$PATH

# export $(gnome-keyring-daemon -s)

export PATH
export EDITOR=vim

export HISTSIZE=10000
export HISTFILESIZE=10000

# list dotfiles first
export LC_COLLATE=C

# prompt
export PS1='\[\033[01;34m\]\w\[\033[00m\]\$ '

export VIMRC=~/.vimrc
export SHELLRC=~/.bashrc

export GITHUB_USER=zenmunki

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob

# Append to the Bash history file, rather than overwriting it.
shopt -s histappend

# change directories by typing their name
shopt -s autocd

# autocorrect typos in path names when using `cd`
shopt -s cdspell

# recursive globbing
shopt -s globstar

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring
# wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2)" scp sftp ssh

###
### User specific aliases and functions
###

if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi
