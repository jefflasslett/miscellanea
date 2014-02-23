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

[[ ! -e $HOME/.tmux.conf ]] && (cd $HOME; ln -s $conf_d/tmux.conf .tmux.conf)
[[ ! -e $HOME/.xinitrc ]] && (cd $HOME; ln -s $conf_d/xinitrc .xinitrc)
[[ ! -e $HOME/.xmobarrc ]] && (cd $HOME; ln -s $conf_d/xmobarrc .xmobarrc)
[[ ! -e $HOME/.i3status.conf ]] && (cd $HOME; ln -s $conf_d/i3status.conf .i3status.conf)
[[ ! -e $HOME/.Xdefaults ]] && (cd $HOME; ln -s $conf_d/Xdefaults .Xdefaults)

if [ ! -d $HOME/.spf13-vim-3 ]
then
  [[ ! -e $HOME/.vimrc ]] && (cd $HOME; ln -s $conf_d/vimrc .vimrc)

  [[ ! -d $HOME/.vim/colors ]] && mkdir -p $HOME/.vim/colors

  [[ ! -e $HOME/.vim/colors/mycolours.vim ]] && ln -s $conf_d/mycolours.vim $HOME/.vim/colors/mycolours.vim
else
  [[ ! -e $HOME/.vimrc.local ]] && (cd $HOME; ln -s $conf_d/vimrc .vimrc.local)
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


