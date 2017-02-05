# ~/.bashrc
# Bash configuration; aliases, functions, and options.
# Executed by non-login shells.

if [ -r /etc/bashrc ]; then
    source /etc/bashrc
fi

# Wayland as of F25 doesn't source the profile script, so:
# (https://bugzilla.gnome.org/show_bug.cgi?id=736660)
if [ -r ~/.profile ]; then
    source ~/.profile
fi

# Set LS_COLORS to show appropriate colors for different file types.
eval "$(dircolors --sh)"

alias ls='LC_COLLATE=C ls --color=auto --human-readable --group-directories-first --quoting-style=literal'
alias ll='ls -la'
alias grep='grep --color=auto'
alias g='git'
alias gs='git status'
alias e='$EDITOR'
alias o='xdg-open'

# Write throwaway bash code, and evaluate it.
function ebash() {
    local SCRIPT=~/.local/share/ebash.bash
    $EDITOR "$SCRIPT"
    cat "$SCRIPT"
    echo '----------'
    source "$SCRIPT"
}

# Repeatedly attempt to ssh into the given host.
function sshpoll() {
    while ! ssh -o ConnectTimeout=3 $*; do
        sleep 1
    done
}

# Shortcut to downloading best audio from a youtube-dl URL:
function audio-dl() {
    local url="$1"; shift
    youtube-dl --extract-audio --format bestaudio "$@" "$url"
}

# Easily create Python virtualenvs in a central location.
function pyvenv_create() {
    local name="$1"
    if [[ "$name" == '' ]]; then
        echo "Usage: $FUNCNAME NAME" 2>&1
        return 1
    elif [[ "$PYTHON_VIRTUALENVS" == '' ]]; then
        echo "Error: PYTHON_VIRTUALENVS is unset." 2>&1
        return 1
    fi
    mkdir -p "$PYTHON_VIRTUALENVS"
    python3 -m venv "$PYTHON_VIRTUALENVS/$name"
}

# Easily activate Python virtualenvs stored in a central location.
function pyvenv_activate() {
    local name="$1"
    if [[ "$name" == '' ]]; then
        echo "Usage: $FUNCNAME NAME" 2>&1
        return 1
    elif [[ "$PYTHON_VIRTUALENVS" == '' ]]; then
        echo "Error: PYTHON_VIRTUALENVS is unset." 2>&1
        return 1
    fi
    mkdir -p "$PYTHON_VIRTUALENVS"
    local venv="$PYTHON_VIRTUALENVS/$name"
    if [ ! -d "$venv" ]; then
        echo "Error: Python virtualenv '$name' does not exist." 2>&1
        return 1
    fi
    source "$venv/bin/activate"
}

# List all available Python virtualenvs.
function pyvenv_list() {
    if [[ "$PYTHON_VIRTUALENVS" == '' ]]; then
        echo "Error: PYTHON_VIRTUALENVS is unset." 2>&1
        return 1
    fi
    mkdir -p "$PYTHON_VIRTUALENVS"
    ls "$PYTHON_VIRTUALENVS"
}

# Correct minor errors when spelling directories for `cd`.
shopt -s cdspell

# Update $LINES and $COLUMNS after every command.
shopt -s checkwinsize

# Save multiple-line commands in the same history entry.
shopt -s cmdhist

# Correct minor errors when spelling directories.
shopt -s dirspell

# Enable operators like ?, *, + to work on pattern lists.
shopt -s extglob

# Allow use of ** for recursive pathname expansion.
shopt -s globstar

# Append to history file on exit rather than overwriting it.
shopt -s histappend

# Use case-insensitive pathname expansion.
shopt -s nocaseglob

