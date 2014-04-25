# ~/.bashrc
# Bash configuration; aliases, functions, and options.
# Executed by non-login shells.

[[ -r /etc/bashrc ]] && source /etc/bashrc

export EDITOR="vim"
export PS1="\[\e[1;34m\]\w\[\e[m\]$ "
export LC_COLLATE="C"
export PYTHONSTARTUP="$HOME/.pystartup"
export JEKYLL_SITE_PATH="$HOME/website"

# Set up ls colors.
eval "$(dircolors -b)"

alias o='xdg-open'
alias ls="ls --color=auto --human-readable --group-directories-first"
alias grep="grep --color=auto"
alias g="git"
alias pyi='python3-bpython'

# Interpreted C!
function runc() {
    local OUTPUT="/tmp/runc.out"
    gcc -o $OUTPUT --std=gnu11 -Wall -g $1
    [ -r $OUTPUT ] && $OUTPUT ${@:2}
    rm -f $OUTPUT
}

# Write throwaway bash code, and evaluate it.
function ebash() {
    local SCRIPT=~/.e.bash
    $EDITOR $SCRIPT
    cat $SCRIPT
    echo --------
    source $SCRIPT
}

# Convert RGB values to Hexadecimal.
rgb2hex() {
    printf '%x%x%x\n' $1 $2 $3
}

source ~/projects/shtag/shtag.sh

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

