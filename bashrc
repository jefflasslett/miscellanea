set -o vi

source $HOME/.aliases

export PS1="\e[1;34m[\u@\h]\e[m git:\$(\$HOME/bin/gssb.pl)\n\w \e[1;31m[\$RAILS_ENV]\e[m> "

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

export PATH=$HOME/bin:$PATH

# PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
