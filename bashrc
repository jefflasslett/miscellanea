set -o vi

source $HOME/.aliases
source $HOME/term_colours.sh

function prompt() {

  gs_out=$($HOME/bin/gssb.pl)

  if [ "$gs_out" != "n/a" ]
  then
    __GIT_BRANCH=${gs_out% *}
    __GIT_STATUS=${gs_out#* }
    case $__GIT_STATUS in
      'dirty')
        PS1="\[$Blue\][\u@\h]\[$Color_Off\] git:\[$IRed\]$__GIT_BRANCH\[$Color_Off\]\n\w \[$Cyan\][$RAILS_ENV]\[$Color_Off\]> "
        ;;
      *)
        PS1="\[$Blue\][\u@\h]\[$Color_Off\] git:\[$Blue\]$__GIT_BRANCH\[$Color_Off\]\n\w \[$Cyan\][$RAILS_ENV]\[$Color_Off\]> "
        ;;
    esac
  else
    PS1="\[$Blue\][\u@\h]\[$Color_Off\] git:[n/a]\n\w \[$Cyan\][$RAILS_ENV]\[$Color_Off\]> "
  fi
}

export PROMPT_COMMAND='prompt'
# export PROMPT_COMMAND=${PROMPT_COMMAND:+$PROMPT_COMMAND; }'prompt;'

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

export PATH=$HOME/bin:$PATH

# PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
