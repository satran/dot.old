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

# Keyboard Backlight
sudo su -c "echo 0 > /sys/devices/platform/applesmc.768/leds/smc::kbd_backlight/brightness"

# Colour profile
#xcalib $HOME/.dot/macbook-pro-mid-2009-15.icc

# Call the key bindings
xmodmap $HOME/.dot/Xmodmap

# Set the mouse bindings
$HOME/scripts/set-mouse

# Take a few breaks
workrave &

feh --bg-fill $HOME/Pictures/Linux-Mint-14-wallpapers-10.jpg 

xset +dpms
xset dpms 0 0 300

xbindkeys
exec $HOME/scripts/9rio