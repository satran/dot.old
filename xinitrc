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

#feh --bg-fill $HOME/Pictures/Linux-Mint-14-wallpapers-10.jpg 

xset +dpms
xset dpms 0 0 300

xsetroot -solid "#333333"
xbindkeys
exec i3
