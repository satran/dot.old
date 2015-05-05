#
# ~/.bashrc
#

# If not running interactively, don't do anything
#[[ $- != *i* ]] && return

# Change font when on a TTY
if [ $TERM = linux ]; then
    setfont ter-924n
fi

PLAN9=/usr/local/plan9
export PLAN9

export EDITOR='emacs'
export VISUAL='emacs'

export GOPATH=$HOME
GOROOT=/usr/local/go
export GOROOT
export DOCKER_HOME=$HOME/docker
export PATH=$PATH:$HOME/scripts:$HOME/bin:$GOROOT/bin:$PLAN9/bin

export XDG_CONFIG_HOME=~/.local
export TERM=xterm-256color

export tabstop=8
export devdrawretina=1

if [[ `uname` = "Darwin" ]]; then
	export font="/mnt/font/Menlo-Regular/24a/font"
else
	export font='/mnt/font/Terminus (TTF)/12/font'
fi


if [[ $termprog = "9term" || $termprog = "win" ]]; then
   TERM=dumb
   PAGER=nobs
fi

# GIT branch 
source /usr/share/git-core/contrib/completion/git-prompt.sh
PS1='$(__git_ps1 "(%s)") % '
export GIT_PS1_SHOWDIRTYSTATE='*'

# Dont accidently delete something
# For linux machines.
function rm() { 
	mv "$@" ~/.local/share/Trash/files/; 
}

function cd {
	builtin cd "$@" && awd $sysname 
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
