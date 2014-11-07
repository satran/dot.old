#
# ~/.bashrc
#

# If not running interactively, don't do anything
#[[ $- != *i* ]] && return


PS1='% '
PLAN9=/usr/local/plan9 export PLAN9
export GOPATH=$HOME
GOROOT=/usr/local/go
PATH=$PATH:$HOME/scripts:$HOME/bin:$GOROOT/bin:$PLAN9/bin export PATH
alias d='dmenu_run -fn "-*-terminus-medium-r-*-*-16-*-*-*-*-*-*-*"'
function rm() { 
	mv "$@" ~/.local/share/Trash/files/; 
}
function cd {
	builtin cd $1 && awd $sysname 
}
export tabstop=8
export font="/mnt/font/DejaVu Sans Mono/18a/font"
