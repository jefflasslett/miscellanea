#!/bin/bash

# Get the absolute path of this script.  It should be kept with the
# conf files that are to be installed.
conf_d=$(cd `dirname "${BASH_SOURCE[0]}"` && pwd)

echo "Config dir is \"$conf_d\""

OP_SYS="$(uname)"

if [ ! -d $HOME/.bash.d ]
then
  (
    cd $HOME
    ln -s $conf_d/bash/bash.d .bash.d
    [[ ! -e $HOME/.bash_profile ]] && ln -s $conf_d/bash/bash_profile .bash_profile
    [[ ! -e $HOME/.profile ]] && ln -s $conf_d/bash/bash_profile .profile
    [[ ! -e $HOME/.bashrc ]] && ln -s $conf_d/bash/bashrc .bashrc
    [[ ! -e $HOME/.bash_logout ]] && ln -s $conf_d/bash/bash_logout .bash_logout
  )

[[ ! -e $HOME/.tmux.conf ]] && (cd $HOME; ln -s $conf_d/tmux.conf .tmux.conf)

if [ ! -d $HOME/bin ]
then
  mkdir $HOME/bin
  (cd $HOME/bin; ln -s $conf_d/gssb.pl gssb.pl)
fi


