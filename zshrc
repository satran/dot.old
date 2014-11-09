# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded
ZSH_THEME="terminalparty"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git python)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=$HOME/scripts:$HOME/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/git/bin:$PATH

PROMPT='%{$fg[green]%}%# '
RPS1='%{$fg[cyan]%}%c $(git_prompt_info)%{$reset_color%}'

# Vim bindings.
# bindkey -v
# bindkey 'jk' vi-cmd-mode
bindkey '^R' history-incremental-search-backward
bindkey '\e.' insert-last-word
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

alias vi='vim'
alias em='emacs -nw'
alias gly='cd ~/src/bitbucket.org/mquotient/glyfix'
# For Linux
alias o='nautilus .'
# alias o='open .'
alias gd="git diff --color"
alias d='dmenu_run -fn "-*-terminus-medium-r-*-*-16-*-*-*-*-*-*-*"'

alias review='vim ~/Workspace/mquotient/reviews/satyajit/`date +%Y`/daily-review/`date +%m`-`date +%B | tr "[A-Z]" "[a-z]"`.md'

# Disable auto corrections
unsetopt correct_all

# Homebrew completion
# fpath=($HOME/.zsh/func $fpath)
# typeset -U fpath

# Shortcut for ps and grep
function psgrep() { ps aux | grep -v grep | grep "$@" -i --color=auto;}

# Shortcut for histroy and grep
function hisgrep() { history | grep -v grep | grep "$@" -i --color=auto;}

# Dont accidently delete something
# For linux machines.
function rm() { mv "$@" ~/.local/share/Trash/files/; }
# function rm() { mv "$@" ~/.Trash; }

# Move to the MQuotient workspace
function mq() { cd ~/src/bitbucket.org/mquotient/$@;}

export XDG_CONFIG_HOME=~/.local
export TERM=xterm-256color

# Virtualenv wrapper for Python
# export WORKON_HOME=~/.local/share/pyenvs
# source /usr/local/bin/virtualenvwrapper.sh

# Keep it simple if running in emacs.
#if [ -n "$INSIDE_EMACS" ]; then
#   PROMPT='%# '
#   RPS1='%c'
#fi

if [[ $termprog = "9term" || $termprog = "win" ]]; then
   TERM=dumb
   PROMPT='%% '
   RPS1=''
   PS1='%% '
fi

PLAN9=/usr/local/plan9 export PLAN9
PATH=$PATH:$PLAN9/bin export PATH
export tabstop=8

export GOPATH=$HOME
export GOROOT=/usr/local/go
export PATH=$PATH:$GOROOT/bin:$PGPATH

export font="/mnt/font/DejaVu Sans Mono/18a/font"

