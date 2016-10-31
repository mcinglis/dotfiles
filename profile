# ~/.profile
# Executed by login shells.

export PATH="$PATH:$HOME/.local/bin"

export EDITOR='vim'

export PS1='\[\e[1;34m\]\w\[\e[m\]\$ '

# Order special characters before uppercase before lowercase.
export LC_COLLATE='C'

export PYTHONSTARTUP="$HOME/.python/startup.py"
export PYTHON_VIRTUALENVS="$HOME/.python/virtualenvs"

