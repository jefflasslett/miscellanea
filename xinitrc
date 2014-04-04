#!/bin/sh

# xrandr --setprovideroutputsource modesetting NVIDIA-0
# xrandr --auto

xsetroot -solid black -cursor_name left_ptr

/home/jeff/prj/miscellanea/nocaps.sh
i3status | xmobar &
exec xmonad

