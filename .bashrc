#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export LANG=en_US.UTF-8
export EDITOR='vim'

function parse_git_branch {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

PS1="\e[0;34m[\e[0;32m\u\e[0;34m] \e[0;34m\$ \e[1;33m\$(dirs +0) "
PS1+="\e[0;34m\$(parse_git_branch)"
PS1+="\n\e[0;34m❮❮\e[0m "

eval `dircolors ~/.config/ls_color/ls.color`
# PS1='[\u@\h \W]\$ '
# PS1='\e[0;34m[\e[0;32m\u\e[0;34m] \e[0;34m\$ \e[1;33m$(dirs +0) \n\e[0;34m❮❮\e[0m '

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

[ -s "/home/fristonio/.scm_breeze/scm_breeze.sh" ] && source "/home/fristonio/.scm_breeze/scm_breeze.sh"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash



export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export HISTFILESIZE=
export HISTSIZE=
