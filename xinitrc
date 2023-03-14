xrdb $HOME/.Xresources

# systemctl start --user emacs

case "${DESKTOP_ENV}" in
'XMONAD')
  export SAL_USE_VCLPLUGIN=gen
  export SSH_ASKPASS=ssh-askpass

  $HOME/prj/miscellanea/nocaps.sh
  xsetroot -solid black -cursor_name left_ptr
  xautolock -time 30 -locker slock &
  i3status | xmobar &
  ssh-add exec xmonad
  ;;

'GNOME')
  export GDK_BACKEND=x11
  export XDG_SESSION_TYPE=x11

  exec gnome-session
  ;;

*)
  ;;
esac

