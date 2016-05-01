#!/bin/sh

export SSH_ASKPASS=ssh-askpass
export SAL_USE_VCLPLUGIN=gen

# xrandr --setprovideroutputsource modesetting NVIDIA-0
# xrandr --auto

xrdb $HOME/.Xresources
xsetroot -solid black -cursor_name left_ptr

/home/jeff/prj/miscellanea/nocaps.sh
i3status | xmobar &
ssh-add
exec xmonad

