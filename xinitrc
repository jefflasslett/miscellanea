#!/bin/sh

export SSH_ASKPASS=ssh-askpass

# xrandr --setprovideroutputsource modesetting NVIDIA-0
# xrandr --auto

xsetroot -solid black -cursor_name left_ptr

/home/jeff/prj/miscellanea/nocaps.sh
i3status | xmobar &
ssh-add
exec xmonad

