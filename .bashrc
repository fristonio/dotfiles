#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export LANG=en_US.UTF-8
export EDITOR='vim'

if ! [[ "${EXEC_TMUX}" -eq "" ]]; then
    if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ tmux ]] && [[ -z "$TMUX" ]]; then
        exec tmux
    fi
fi

# Do not set TERM in bash configuration
# export TERM=xterm-256color

NO_COLOR="\[\e[00m\]"
BLUE_COLOR="\[\e[0;34m\]"
GREEN_COLOR="\[\e[0;32m\]"
YELLOW_COLOR="\[\e[0;33m\]"
RED_COLOR="\[\e[0;31m\]"
CYAN_COLOR="\[\e[0;36m\]"

function git_parse_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' | sed -e 's/* \(.*\)/( \1)/'
}

function get_dollar_sign(){
    es=$?
    if [ $es -eq 0 ]
    then
        echo -e "\e[0;34m\$\e[0;00m"
    else
        echo -e "\e[0;31m\$\e[0;00m"
    fi
}

PS1="${BLUE_COLOR}[${GREEN_COLOR}\u ${YELLOW_COLOR}➜ ${GREEN_COLOR}\@${BLUE_COLOR}] \$(get_dollar_sign) ${YELLOW_COLOR}\$(dirs +0) "
PS1+="${BLUE_COLOR}\$(git_parse_branch)${NO_COLOR}"
PS1+="\n${BLUE_COLOR}ᗆ ${NO_COLOR}"

[ -f ~/.config/ls_color/ls.color ] && eval `dircolors ~/.config/ls_color/ls.color`

alias cl="clear"
alias off="sudo poweroff"
alias restart="sudo reboot"
alias install="sudo pacman -S"
alias got="xdg-open"

alias gl="git log --oneline --graph --abbrev-commit --decorate"
alias gs="git status"
alias gcb="git checkout -b"
alias ls='ls --group-directories-first --color=auto'
alias l='ls -la --color=auto --group-directories-first'
alias k='kubectl'
alias notes='vim ~/Documents/notes'
alias shownotes='(cd ~/Documents/notes && glow)'

export PATH="$PATH:$HOME/bin:$HOME/.local/bin:/usr/local/go/bin/:$GOPATH/bin:$GOROOT/bin:$HOME/.gem/ruby/3.7.0/bin"

if command -v exa &> /dev/null; then
	alias l='exa -l'
	alias ls='exa'
	alias ll='exa -l'
	alias lll='exa -la'
fi

alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias grep='grep -i --color'

alias laptopscreen='xrandr --output eDP-1 --auto && xrandr --output DP-1 --off'
alias monitorscreen='xrandr --output eDP-1 --off && xrandr --output DP-1 --auto'
alias screensetup='xrandr --output eDP-1 --auto && xrandr --output DP-1 --auto'

# Setup SCM Breeze for git configuration - https://github.com/scmbreeze/scm_breeze
[ -s "/home/fristonio/.scm_breeze/scm_breeze.sh" ] && source "/home/fristonio/.scm_breeze/scm_breeze.sh"
# Setup fzf for easy reverse search in bash.
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

export HISTFILESIZE=
export HISTSIZE=

export GOROOT=/usr/local/go
export GOPATH=$HOME/go
export GO111MODULE=on

# Environment variable to allow scrolling using touchscreen in firefox
export MOZ_USE_XINPUT2=1

# Configurew autojump for bash
[[ -s /home/fristonio/.autojump/etc/profile.d/autojump.sh ]] && source /home/fristonio/.autojump/etc/profile.d/autojump.sh ]]
export PATH=$PATH:/usr/local/kubebuilder/bin

if command -v kubectl &> /dev/null; then
    source <(kubectl completion bash)
fi
