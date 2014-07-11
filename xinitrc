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

# Screen Brightness
sudo su -c "echo 110 > /sys/devices/virtual/backlight/nvidia_backlight/brightness"

# Keyboard Backlight
sudo su -c "echo 0 > /sys/devices/platform/applesmc.768/leds/smc::kbd_backlight/brightness"

# Colour profile
xcalib $HOME/.dot/macbook-pro-mid-2009-15.icc

# Call the key bindings
xmodmap $HOME/.dot/Xmodmap

# Bind the stupid Logitech's 133 middle button to actually middle click
# xkbset m
# xkbset exp =m
# xmodmap -e "keycode 133 = Pointer_Button2"

# Natural Scrolling for the Logitech Mouse
xinput set-button-map `xinput list | grep 'Logitech Unifying Device' | egrep -o 'id=[0-9]+' | egrep -o '[0-9]+'` 1 2 3 5 4 7 6 8 9 10 11 12

# Take a few breaks
workrave &

# The menu
9menu -teleport -popdown -font -*-terminus-medium-r-*-*-16-*-*-*-*-*-*-*  Firefox:firefox-nightly Web:dwb Emacs:emacs Vim:gvim Acme:acme-rc Terminal:terminator Nautilus:nautilus Settings:gnome-control-center More:d &

exec /usr/local/bin/9rio
