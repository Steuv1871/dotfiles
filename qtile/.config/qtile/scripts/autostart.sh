#!/bin/sh
# echo "login: $(date +%Y-%m-%d:%H%M%S)" >> ~/qtile-temp.log # Debug trace

# Screen config for Penkesu
if [ "$(hostname)" = "rpiz2" ] || [ "$(hostname)" = "penkesu" ]
then
  # Wayland actions
  if [ "$XDG_SESSION_TYPE" = "wayland" ]
  then
    wlr-randr --output HDMI-A-1 --transform 270 &
    qtile cmd-obj -o core -f hide_cursor & # Hide mouse cursor, to unhide: qtile cmd-obj -o core -f unhide_cursor
  fi

  # X11 actions
  if [ "$XDG_SESSION_TYPE" = "tty" ]
  then
    # Launch Urxvt Daemon
    xrdb ~/.Xresources # Load config
    urxvtd -q -f -o & # Launch Daemon
    #picom &
  fi
fi