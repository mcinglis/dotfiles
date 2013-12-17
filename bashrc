# ~/.bashrc
# Bash configuration; aliases, functions, and options.
# Executed by non-login shells.

[ -r /etc/bashrc ] && source /etc/bashrc

# Set up ls colors.
eval "$(dircolors -b)"

alias o='xdg-open'
alias ls="ls --color=auto --human-readable --group-directories-first"
alias grep="grep --color=auto"
alias g="git"
alias rt="sudo systemctl restart tor"

alias cpsc404="cd ~/Resources/Databases/Advanced\ Relational\ Databases\ \(UBC\ 2013\)/"
alias cpsc421="cd ~/Resources/Computer\ Science/Theory\ of\ Computer\ Science\ \(UBC\ 2013\)"

# Interpreted C!
function runc() {
    local OUTPUT="/tmp/runc.out"
    gcc -o $OUTPUT --std=gnu11 -Wall -g $1
    [ -r $OUTPUT ] && $OUTPUT ${@:2}
    rm -f $OUTPUT
}

# Write throwaway bash code in Vim, and evaluate it.
function ebash() {
    local SCRIPT="/tmp/ebash.sh"
    $EDITOR $SCRIPT
    [ -r $SCRIPT ] && cat $SCRIPT
    [ -r $SCRIPT ] && source $SCRIPT
    [ -r $SCRIPT ] && rm $SCRIPT
}

# Type the name of a directory to `cd` into it.
shopt -s autocd

# Correct minor errors when spelling directories for `cd`.
shopt -s cdspell

# Save multiple-line commands in the same history entry.
shopt -s cmdhist

# Correct minor errors when spelling directories.
shopt -s dirspell

# Enable operators like ?, *, + to work on pattern lists.
shopt -s extglob

# Allow use of ** for recursive pathname expansion.
shopt -s globstar

# Use case-insensitive pathname expansion.
shopt -s nocaseglob
