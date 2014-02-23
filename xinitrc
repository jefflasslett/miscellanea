#!/bin/sh

xsetroot -solid black -cursor_name left_ptr

/home/jeff/prj/miscellanea/nocaps.sh
i3status | xmobar &
exec xmonad

