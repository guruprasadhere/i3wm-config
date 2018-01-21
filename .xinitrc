#!/bin/bash

[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources


#Dbus fix
if [ -z "$DBUS_SESSION_BUS_ADDRESS" ]; then
    eval "$(dbus-launch --sh-syntax --exit-with-session)"
fi

/usr/bin/xdg-user-dirs-update

session=${1:-i3}

case $session in
    openbox   ) exec openbox-session;;
    i3|i3wm           ) exec i3;;
    xfce|xfce4        ) exec startxfce4;;
    # No known session, try to run it as command
    *                 ) exec $1;;
esac

