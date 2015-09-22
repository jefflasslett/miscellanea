#!/bin/bash

# Get the absolute path of this script.  It should be kept with the
# conf files that are to be installed.
conf_d=$(cd `dirname "${BASH_SOURCE[0]}"` && pwd)

echo "Config dir is \"$conf_d\""

OP_SYS="$(uname)"

# if [[ "$OP_SYS" = "Darwin" ]]
# then
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
# else
#   if [ ! -d $HOME/.zsh.d ]
#   then
#     (
#       cd $HOME
#       ln -s $conf_d/zsh/zsh.d .zsh.d
#       [[ ! -e $HOME/.zprofile ]] && ln -s $conf_d/zsh/zprofile .zprofile
#       [[ ! -e $HOME/.zshrc ]] && ln -s $conf_d/zsh/zshrc .zshrc
#       [[ ! -e $HOME/.zlogout ]] && ln -s $conf_d/zsh/zlogout .zlogout
#       [[ ! -e $HOME/.zlogin ]] && ln -s $conf_d/zsh/zlogin .zlogin
#       [[ ! -e $HOME/.zshenv ]] && ln -s $conf_d/zsh/zshenv .zshenv
#     )
#   fi
# fi

#[[ ! -e $HOME/.tmux.conf ]] && (cd $HOME; ln -s $conf_d/tmux.conf .tmux.conf)

# if [[ "$OP_SYS" = "Linux" ]]
# then
#   [[ ! -e $HOME/.xinitrc ]] && (cd $HOME; ln -s $conf_d/xinitrc .xinitrc)
#   [[ ! -e $HOME/.xmobarrc ]] && (cd $HOME; ln -s $conf_d/xmobarrc .xmobarrc)
#   [[ ! -e $HOME/.i3status.conf ]] && (cd $HOME; ln -s $conf_d/i3status.conf .i3status.conf)
#   [[ ! -e $HOME/.Xdefaults ]] && (cd $HOME; ln -s $conf_d/Xdefaults .Xdefaults)
# 
#   if [ ! -d $HOME/.xmonad ]
#   then
#   mkdir $HOME/.xmonad
#   (cd $HOME/.xmonad; ln -s $conf_d/xmonad.hs xmonad.hs)
#   fi
# 
#   if [ ! -d $HOME/.yi ]
#   then
#   mkdir $HOME/.yi
#   (cd $HOME/.yi; ln -s $conf_d/yi.hs yi.hs)
#   fi
# fi

if [ ! -d $HOME/bin ]
then
  mkdir $HOME/bin
  (cd $HOME/bin; ln -s $conf_d/gssb.pl gssb.pl)
fi


