#!/usr/bin/env bash

LIMA=limactl

USERNAME=$(whoami)

USER_ROOT_DIR="/Users/${USERNAME}"
HOME_DIR="${HOME}"

function setup_vm {
  VM_NAME="${1:-dev}"
  CPU="${2:-6}"
  MEMORY="${3:-12}"

  # With Default config of LIMA the following mounts are configured
  # 1. /Users/<user>
  # 2. /tmp/lima mount
  #
  # --rosetta: Run AMD64 binaries on arm64.
  # --mount-writable: Mount the user directory as writable.
  ${LIMA} start \
    --name=${VM_NAME} \
    --cpus=${CPU} \
    --memory=${MEMORY} \
    --vm-type=vz \
    --rosetta \
    --mount-type=virtiofs \
    --mount-writable \
    --network=vzNAT \
    template://ubuntu-lts
}

function setup_home {
  if ! [ -d "${HOME_DIR}" ]; then
    echo "[-] Home Directory does not exist: ${HOME_DIR}"
    return
  fi

  if ! [ -d "${USER_ROOT_DIR}" ]; then
    echo "[-] User Root Directory does not exist: ${USER_ROOT_DIR}"
    return
  fi

  # Setup home directory inside the Lima VM
  cp "${USER_ROOT_DIR}/.bashrc" "${HOME_DIR}/.bashrc"
  cp "${USER_ROOT_DIR}/.vimrc" "${HOME_DIR}/.vimrc"
  cp "${USER_ROOT_DIR}/.tmux.conf" "${HOME_DIR}/.tmux.conf"

  cp -r "${USER_ROOT_DIR}/.config/nvim" "${HOME_DIR}/.config/nvim"

  cat <<EOF | sudo tee -a ${HOME_DIR}/.profile
export PS1_EMIT_HOSTNAME=1

alias uhome='cd ${USER_ROOT_DIR}'
EOF
}
