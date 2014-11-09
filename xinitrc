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
sudo su -c "echo 80 > /sys/devices/pnp0/00:03/backlight/gmux_backlight/brightness"
# sudo su -c "echo 110 > /sys/devices/virtual/backlight/nvidia_backlight/brightness"

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

# The menu
# 9menu -teleport -popdown -font "-*-terminus-*-*-*-*-28-*-*-*-*-*-*-*" Firefox:firefox Web:dwb Emacs:emacs Acme:acme-rc Terminal:terminator &

#feh --bg-fill /usr/share/backgrounds/gnome/Blinds.jpg

xset +dpms
xset dpms 0 0 300

xbindkeys
exec $HOME/scripts/9rio
#exec /usr/local/bin/dwm
