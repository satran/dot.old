#!/bin/bash
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

# feh --bg-fill $HOME/pics/327390-simple.jpg 

emacs --daemon

xset +dpms
xset dpms 0 0 300
xset b off

xsetroot -solid "#333333"
xbindkeys
exec /usr/local/bin/stumpwm

#exec /usr/bin/ratpoison
#exec emacs
#exec startxfce4
#gnome-terminal&
#terminator &
#exec /usr/bin/mutter
#exec marco -c
