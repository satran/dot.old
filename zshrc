# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="robbyrussell"
# ZSH_THEME="gallois"
ZSH_THEME="terminalparty"

# Example aliases
alias zshconfig="vim ~/.zshrc"
alias ohmyzsh="vim ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

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
export PATH=/usr/local/go/bin:~/local/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/git/bin

# PROMPT='%(?.%{$fg[green]%}.%{$fg[red]%})%B%(!.#.$)%b '
PROMPT='%{$fg[green]%}%# '
RPS1='%{$fg[cyan]%}%c $(git_prompt_info)%{$reset_color%}'

# Vim bindings.
# bindkey -v
# bindkey 'jk' vi-cmd-mode
bindkey '^R' history-incremental-search-backward
bindkey '\e.' insert-last-word
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

alias e='emacs -nw'
alias emacs='emacs -nw'
alias gly='cd ~/Workspace/mquotient/code/glyfix'
#alias mq='cd ~/Workspace/mquotient/code/'
alias o='nautilus . &'
alias ts="tmux -u new-session -s"
alias tmux="tmux -u"

alias stag="ssh -i ~/local/keys/glyphfix-aws.pem ubuntu@boxcite.com"
alias demo="ssh -i ~/local/keys/glyphfix-aws.pem ubuntu@glyfix.net"

alias actgly='source ~/Workspace/mquotient/ENV/bin/activate'
alias review='vim ~/Workspace/mquotient/reviews/satyajit/`date +%Y`/daily-review/`date +%m`-`date +%B | tr "[A-Z]" "[a-z]"`.md'

# Disable auto corrections
unsetopt correct_all

# Homebrew completion
fpath=($HOME/.zsh/func $fpath)
typeset -U fpath

# Shortcut for ps and grep
function psgrep() { ps aux | grep -v grep | grep "$@" -i --color=auto;}

# Shortcut for histroy and grep
function hisgrep() { history | grep -v grep | grep "$@" -i --color=auto;}

# Dont accidently delete something
function rm() { mv "$@" /home/satyajit/.local/share/Trash/files/; }

# Move to the MQuotient workspace
function mq() { cd ~/Workspace/mquotient/code/$@;}

# Virtualenv wrapper for Python
export WORKON_HOME=~/local/envs
source /usr/bin/virtualenvwrapper.sh

# Set default editor
export EDITOR="emacs -nw"
export VISUAL="emacs -nw"