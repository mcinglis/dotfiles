# ~/.profile
# Executed by login shells.

[[ -r ~/.bashrc ]] && source ~/.bashrc

export EDITOR="vim"

export PS1="\[\e[1;34m\]\w\[\e[m\]$ "

# Order special characters before uppercase before lowercase.
export LC_COLLATE="C"
