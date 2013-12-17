# ~/.profile
# Executed by login shells.

[[ -r ~/.bashrc ]] && source ~/.bashrc

PATH="$HOME/.cabal/bin:$PATH"
PATH="$HOME/software/.data/bin:$PATH"
export PATH

export EDITOR="vim"

export PS1="\[\e[1;34m\]\w\[\e[m\]$ "

# Order special characters before uppercase before lowercase.
export LC_COLLATE=C

