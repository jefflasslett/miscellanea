#!/bin/sh

export SSH_ASKPASS=ssh-askpass
export SAL_USE_VCLPLUGIN=gen

# xrandr --setprovideroutputsource modesetting NVIDIA-0
# xrandr --auto

xrdb $HOME/.Xresources
xsetroot -solid black -cursor_name left_ptr

xautolock -time 30 -locker slock &

# if [ -d /etc/X11/xinit/xinitrc.d ] ; then for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do [ -x "$f" ] && . "$f"
#   done
#   unset f
# fi

$HOME/prj/miscellanea/nocaps.sh
i3status | xmobar &
ssh-add
exec xmonad

