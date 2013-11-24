#!/bin/bash

# Get the absolute path of this script.  It should be kept with the 
# conf files that are to be installed.
conf_d=$(cd `dirname "${BASH_SOURCE[0]}"` && pwd)

echo "Config dir is \"$conf_d\""

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
fi

if [ ! -e $HOME/.tmux.conf ]
then
  (cd $HOME; ln -s $conf_d/tmux.conf .tmux.conf)
fi

if [ ! -e $HOME/.Xdefaults ]
then
  (cd $HOME; ln -s $conf_d/Xdefaults .Xdefaults)
fi

if [ ! -d $HOME/.spf13-vim-3 ]
then
  if [ ! -e $HOME/.vimrc ]
  then
    (cd $HOME; ln -s $conf_d/vimrc .vimrc)
  fi

  if [ ! -d $HOME/.vim/colors ]
  then
    mkdir -p $HOME/.vim/colors
  fi

  if [ ! -e $HOME/.vim/colors/mycolours.vim ]
  then
    ln -s $conf_d/mycolours.vim $HOME/.vim/colors/mycolours.vim
  fi
else
  if [ ! -e $HOME/.vimrc.local ]
  then
    (cd $HOME; ln -s $conf_d/vimrc .vimrc.local)
  fi
fi

if [ ! -d $HOME/.xmonad ]
then
  mkdir $HOME/.xmonad
  (cd $HOME/.xmonad; ln -s $conf_d/xmonad.hs xmonad.hs)
fi
  
if [ ! -d $HOME/.yi ]
then
  mkdir $HOME/.yi
  (cd $HOME/.yi; ln -s $conf_d/yi.hs yi.hs)
fi

if [ ! -d $HOME/bin ]
then
  mkdir $HOME/bin
  (cd $HOME/bin; ln -s $conf_d/gssb.pl gssb.pl)
fi


