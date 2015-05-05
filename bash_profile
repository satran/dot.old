# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx
if [ -e /home/satran/.nix-profile/etc/profile.d/nix.sh ]; then . /home/satran/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
