#!/usr/bin/env bash

export LANG=en_US.UTF-8
export EDITOR='nvim'
export PAGER="less -FirSwX";

# Remove zsh default shell warningin on macos
export BASH_SILENCE_DEPRECATION_WARNING=1

shopt -s histappend
shopt -s checkwinsize

export HISTCONTROL=ignoredups:erasedups
export HISTFILESIZE=
export HISTSIZE=

case "$(uname -s)" in
  Darwin*) export PATH="/opt/homebrew/bin/:/opt/homebrew/sbin/:${PATH}";;
esac
export PATH="${PATH}:${HOME}/bin:${HOME}/.local/bin"

NO_COLOR="\[\e[00m\]"
BLUE_COLOR="\[\e[0;34m\]"
GREEN_COLOR="\[\e[0;32m\]"
YELLOW_COLOR="\[\e[0;33m\]"
RED_COLOR="\[\e[0;31m\]"
CYAN_COLOR="\[\e[0;36m\]"

export PS1_EMIT_HOSTNAME=${PS1_EMIT_HOSTNAME:-}

function git_parse_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' | sed -e 's/* \(.*\)/( \1)/'
}

function get_dollar_sign() {
  es=$?
  BLUE_COLOR='\033[0;34m'
  RED_COLOR='\033[0;31m'
  NO_COLOR='\033[0m'

  if [ $es -eq 0 ]; then
    echo -e "${BLUE_COLOR}\$${NO_COLOR}"
  else
    echo -e "${RED_COLOR}\$${NO_COLOR}"
  fi
}

function get_hostname() {
  CYAN_COLOR='\033[0;36m'
  NO_COLOR='\033[0m'

  if ! [ -z "${PS1_EMIT_HOSTNAME}" ]; then
    echo -e "${CYAN_COLOR}@$(hostname)${NO_COLOR}"
  fi
}

PS1="${BLUE_COLOR}[${GREEN_COLOR}\u\$(get_hostname) ${YELLOW_COLOR}➜ ${GREEN_COLOR}\@${BLUE_COLOR}] \$(get_dollar_sign) ${YELLOW_COLOR}\$(dirs +0) "
PS1+="${BLUE_COLOR}\$(git_parse_branch)${NO_COLOR}"
PS1+="\n${BLUE_COLOR}ᗆ ${NO_COLOR}"

alias gs="git status"
alias gl="git log --oneline --graph --abbrev-commit --decorate"

alias grep='grep -i --color'

alias ls='ls --color=auto'
alias l='ls -la --color=auto'
if command -v eza &> /dev/null; then
  alias l='eza -l'
  alias ls='eza'
  alias ll='eza -l'
  alias lll='eza -la'
fi

# Makefile tab completion
complete -W "\`grep -oE '^[a-zA-Z0-9_.-]+:([^=]|$)' ?akefile | sed 's/[^a-zA-Z0-9_.-]*$//'\`" make
complete -W "\`find . -maxdepth 1 -type f -regex '.*.cc' -exec basename \{} .cc \;\`" make

if command -v go &> /dev/null; then
  export GOPATH="${HOME}/go"
  export PATH="${PATH}:${GOPATH}/bin"
fi

if command -v docker &> /dev/null; then
  export DOCKER_HOST=unix:///var/run/docker.sock
fi

if command -v kubectl &> /dev/null; then
  source <(kubectl completion bash)
fi

if command -v zoxide &> /dev/null; then
  eval "$(zoxide init bash)"
  alias z='zoxide'
fi

if command -v fzf &> /dev/null; then
  eval "$(fzf --bash)"
fi

if command -v limactl &> /dev/null; then
  source <(limactl completion bash)
fi

[ -f "$HOME/.cargo/env" ] && . "${HOME}/.cargo/env"
