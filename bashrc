#
# ~/.bashrc
#

# If not running interactively, don't do anything
#[[ $- != *i* ]] && return

PS1='% '

PLAN9=/usr/local/plan9
export PLAN9

export GOPATH=$HOME
GOROOT=/usr/local/go
export GOROOT

PATH=$PATH:$HOME/scripts:$HOME/bin:$GOROOT/bin:$PLAN9/bin export PATH

export tabstop=8
export font="/mnt/font/DejaVu Sans Mono/18a/font"

export XDG_CONFIG_HOME=~/.local
export TERM=xterm-256color

if [[ $termprog = "9term" || $termprog = "win" ]]; then
   TERM=dumb
   PS1='% '
fi

# Dont accidently delete something
# For linux machines.
function rm() { 
	mv "$@" ~/.local/share/Trash/files/; 
}

function cd {
	builtin cd $1 && awd $sysname 
}

# Shortcut for ps and grep
function psgrep() {
	ps aux | grep -v grep | grep "$@" -i --color=auto;
}

# Shortcut for histroy and grep
function hisgrep() { 
	history | grep -v grep | grep "$@" -i --color=auto;
}

