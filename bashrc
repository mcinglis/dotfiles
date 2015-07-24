# ~/.bashrc
# Bash configuration; aliases, functions, and options.
# Executed by non-login shells.

if [ -r /etc/bashrc ]; then
    source /etc/bashrc
fi

export EDITOR="vim"
export PS1="\[\e[1;34m\]\w\[\e[m\]\$ "
export PYTHONSTARTUP="$HOME/.python/startup.py"
export JEKYLL_SITE_PATH="$HOME/minglis.id.au"

export PATH="$HOME/.local/bin:$PATH"

export PW_FILE="$HOME/.pw"

export CPPFLAGS="-DHAVE_ATTRIBUTE_FORMAT"

# Set up ls colors.
eval "$(dircolors -b)"

alias e="$EDITOR"
alias o="xdg-open"
alias ls="ls --color=auto --human-readable --group-directories-first"
alias grep="grep --color=auto"
alias g="git"

# Push to everything to all of a Git repository's remotes.
function git-push-everything() {
    for remote in $(git remote); do
        echo "::: Pushing all branches to remote: $remote"
        git push $remote --all
        echo "::: Pushing all tags to remote: $remote"
        git push $remote --tags
        echo ""
    done
}

# Download a list of YouTube URLs, either as given as arguments, or as stdin.
function ytdl() {
    local f=$(mktemp)
    cat | sed "s/&.*$//" > $f
    while read line; do
        youtube-dl "$line"
    done < $f
    rm $f
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
    printf '%2x%2x%2x\n' $1 $2 $3
}


speedtest() {
    ping -c 5 mirror.aarnet.edu.au
    wget "http://mirror.aarnet.edu.au/pub/ubuntu/releases/14.10/ubuntu-14.10-desktop-amd64.iso" -O /dev/null
}


jl() {
    local link="$1"
    local title="${2:-$(title-from-url "$1")}"
    jekyll-link "$link" -t "$title"
    cd "$JEKYLL_SITE_PATH"
    git add .
    git commit -am "Add link \"$title\""
    git push
}


pw() {
    grep -i "^.*$@.*:" "$PW_FILE"
}


sshscan() {
    for n in `seq $2 $3`; do
        ssh -o ConnectTimeout=1 $1@192.168.1.$n
    done
}


sshpoll() {
    while ! ssh -o ConnectTimeout=3 $1; do
        true
    done
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

