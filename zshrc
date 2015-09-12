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
DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git python)

source $ZSH/oh-my-zsh.sh

PROMPT='%{$fg[green]%}%# '
RPS1='%{$fg[cyan]%}%c $(git_prompt_info)%{$reset_color%}'

export EDITOR='emacs'
export VISUAL='emacs'

PLAN9=/usr/local/plan9
export PLAN9

GOPATH=${GOPATH:-$HOME}
export GOPATH
export GOROOT=/usr/local/go
export DOCKER_HOME=$HOME/docker
export PATH=$PATH:$HOME/bin:$GOROOT/bin:$PLAN9/bin

#export TERM=xterm-mono

if [[ `uname` = "Darwin" ]]; then
	export font="/mnt/font/Menlo-Regular/24a/font"
else
	export font='/mnt/font/Terminus (TTF)/12/font'
fi

if [[ $termprog = "9term" || $termprog = "win" ]]; then
   TERM=dumb
   PROMPT='%% '
   RPS1=''
   PS1='%% '
   PAGER=nobs
fi

# Vim bindings.
# bindkey -v
# bindkey 'jk' vi-cmd-mode

bindkey '^R' history-incremental-search-backward
bindkey '\e.' insert-last-word
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

alias vi='vim'
alias em='emacs -nw'
# For Linux
alias o='nautilus .'
# alias o='open .'
alias gd="git diff --color"
alias em='emacs -nw'
alias rmt='find . -iname "*~" | xargs rm'
alias gst='git status'
alias gl='git log --oneline | head'
alias emc='emacsclient -nw'
alias ss='screen -S'
alias sa='screen -d -r'

# Disable auto corrections
unsetopt correct_all

# Shortcut for ps and grep
function psgrep() { ps aux | grep -v grep | grep "$@" -i --color=auto;}

# Shortcut for histroy and grep
function hisgrep() { history | grep -v grep | grep "$@" -i --color=auto;}

# Dont accidently delete something
# For linux machines.
function rm() { mv "$@" ~/.local/share/Trash/files/; }
# function rm() { mv "$@" ~/.Trash; }

# Move to the Optiopay workspace
function op() { cd ~/src/github.com/optiopay/$@; }

function settitle() {
    printf "\033k$1\033\\"
}

# Load zsh-syntax-highlighting.
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Load zsh-autosuggestions.
source ~/.zsh/zsh-autosuggestions/autosuggestions.zsh

# Enable autosuggestions automatically.
zle-line-init() {
    zle autosuggest-start
    
}
zle -N zle-line-init
