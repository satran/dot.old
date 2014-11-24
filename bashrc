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
export devdrawretina=1
if [[ `uname` = "Darwin" ]]; then
	export font="/mnt/font/Menlo-Regular/24a/font"
else
	export font="/mnt/font/DejaVu Sans Mono/18a/font"
fi

export XDG_CONFIG_HOME=~/.local
export TERM=xterm-256color


if [[ $termprog = "9term" || $termprog = "win" ]]; then
   TERM=dumb
   PAGER=nobs
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

bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'
bind '"\C-P": history-search-backward'
bind '"\C-N": history-search-forward'
