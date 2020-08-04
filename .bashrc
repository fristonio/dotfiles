#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export LANG=en_US.UTF-8
export EDITOR='vim'

if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ tmux ]] && [[ -z "$TMUX" ]]; then
    exec tmux
fi

function git_parse_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' | sed -e 's/* \(.*\)/( \1)/'
}

PS1="\[\e[0;34m\][\[\e[0;32m\]\u\[\e[0;34m\]] \[\e[0;34m\]\$ \[\e[1;33m\]\$(dirs +0) "
PS1+="\[\e[0;34m\]\$(git_parse_branch)\[\e[00m\]"
PS1+="\n\[\e[1;34m\]ᗆ \[\e[0m\]"

eval `dircolors ~/.config/ls_color/ls.color`

alias cl="clear"
alias off="sudo poweroff"
alias restart="sudo reboot"
alias install="sudo pacman -S"
alias got="xdg-open"
alias subl="subl3"
# alias python="python3.5"

alias gl="git log --oneline --graph --abbrev-commit --decorate"
alias gs="git status"
alias gcr="git clone"
alias gcn="git checkout -b"
alias ls='ls --group-directories-first --color=auto'
alias l='ls -la --color=auto --group-directories-first'

alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

alias fb='filebrowser -d ~/.filebrowser.db -p 4444 -a 0.0.0.0'

alias grep='grep -i --color'

[ -s "/home/fristonio/.scm_breeze/scm_breeze.sh" ] && source "/home/fristonio/.scm_breeze/scm_breeze.sh"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

export HISTFILESIZE=
export HISTSIZE=

export GOROOT=/usr/local/go
export GOPATH=$HOME/go
export PATH=$HOME/bin:$GOPATH/bin:$GOROOT/bin:$HOME/bin:$HOME/.gem/ruby/2.7.0/bin:$PATH
export GO111MODULE=on

# Environment variable to allow scrolling using touchscreen in firefox
export MOZ_USE_XINPUT2=1

export PATH="$PATH:$HOME/.local/bin"
