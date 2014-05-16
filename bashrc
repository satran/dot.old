export PS1="% "

# Customize to your needs...
export PATH=~/.local/bin:~/local/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/git/bin:$PATH

# For Linux
# alias o='nautilus .'
alias o='open .'
alias ts="tmux -u new-session -s"
alias tmux="tmux -u"
alias gd="git diff --color"

export XDG_CONFIG_HOME=~/.local
export TERM=dumb

# Virtualenv wrapper for Python
export WORKON_HOME=~/.local/share/pyenvs
source /usr/local/bin/virtualenvwrapper.sh

# Keep it simple if running in emacs.
if [ -n "$INSIDE_EMACS" ]; then
   PROMPT='%# '
   RPS1='%c'
fi

PLAN9=/usr/local/plan9 export PLAN9
PATH=$PATH:$PLAN9/bin export PATH
export tabstop=8

export GOPATH=$HOME
export GOROOT=/usr/local/go

export PGPATH=/Applications/Postgres.app/Contents/Versions/9.3/bin
export PATH=$PATH:$GOROOT/bin:$PGPATH
