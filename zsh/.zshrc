export ZSH=/home/pathak-bios/.oh-my-zsh

ZSH_THEME="materialtheme"

ENABLE_CORRECTION="true"

plugins=(git compleat)

source $ZSH/oh-my-zsh.sh

eval `dircolors ~/.config/ls_color/ls.color`

export LANG=en_US.UTF-8
export EDITOR='vim'

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

alias cl="clear"
alias off="sudo poweroff"
alias restart="sudo reboot"
alias update="sudo apt-get update"
alias upgrade="sudo apt-get upgrade"
alias install="sudo apt-get install"
alias got="xdg-open"
alias cts="cd ~/SDSLabs"
alias ctg="cd ~/GITHUB"
alias ctd="cd ~/Downloads"
alias ctp="cd ~/Projects"
alias sdsslack="google-chrome --app=https://sdslabs.slack.com/messages/general/details/"
alias notes="google-chrome --app=https://keep.google.com/u/0/"
alias flowy="google-chrome --app=https://workflowy.com/"
alias youtube-dl='youtube-dl --prefer-ffmpeg'
alias chrome=google-chrome
# For firefox 57
alias firefox="nohup firefox &>/dev/null &"
# Change ethernet speed to 100mbps from 1000mpbs
alias eth0="sudo ethtool -s eth0 speed 100 duplex full"
alias rshell="source ~/.zshrc"

alias gl="git log --oneline --graph --abbrev-commit --decorate"
alias gs="git status"
alias gcr="git clone"
alias gcn="git checkout -b"
alias ls='ls --group-directories-first --color=auto'

export PATH="$PATH:$HOME/bin/tig:$HOME/.config/composer/vendor/bin"
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
export PATH="$PATH:/usr/local/bin/composer"
export PATH="$PATH:/usr/bin/php"
export GOROOT=/usr/local/go
export GOPATH=$HOME
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH
export EDITOR='vim'
export VISUAL='vim'

export NVM_DIR="/home/pathak-bios/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

[ -s "/home/pathak-bios/.scm_breeze/scm_breeze.sh" ] && source "/home/pathak-bios/.scm_breeze/scm_breeze.sh"
