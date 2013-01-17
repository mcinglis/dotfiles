# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi

# User specific environment and startup programs

# Set up rbenv
export PATH=$HOME/.rbenv/bin:$PATH:$HOME/.local/bin:$HOME/bin
eval "$(rbenv init -)"

