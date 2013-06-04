set -o vi

source $HOME/.aliases
source $HOME/term_colours.sh

function prompt() {

  $HOME/bin/gssb.pl  

  if [ $__GIT_STATUS ]
  then
    case $__GIT_STATUS in
      'dirty')
        PS1="\[$Blue\][\u@\h]\[$Color_Off\] git$__GIT_BRANCH\n\w \[$Cyan\][$RAILS_ENV]\[$Color_Off\]> "
        ;;
      *)
        PS1="\[$Blue\][\u@\h]\[$Color_Off\] git:$__GIT_BRANCH\n\w \[$Cyan\][$RAILS_ENV]\[$Color_Off\]> "
        ;;
    esac
  else
    PS1="\[$Blue\][\u@\h]\[$Color_Off\] git:$__GIT_BRANCH\n\w \[$Cyan\][$RAILS_ENV]\[$Color_Off\]> "
  fi
}

export PROMPT_COMMAND='prompt'
#PROMPT_COMMAND=${PROMPT_COMMAND:+$PROMPT_COMMAND; }'prompt();'


# export PS1='\[\e[1;34m\][\u@\h]\[$__clr\] git:\$(\$HOME/bin/gssb.pl)\n\w \[\e[0;36m\][\$RAILS_ENV]\[\e[m\]> '

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

export PATH=$HOME/bin:$PATH

# PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
