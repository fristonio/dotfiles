#!/usr/bin/env bash

set -euxo pipefail

GO=go
ARCH="${ARCH:-arm64}"

# Core Dependencies
GOLANG_VERSION="1.24.3"

# Tooling
K8S_VERSION="1.33"
KIND_VERSION="0.29.0"
KUBECTL_VERSION="1.33.0"

GOLANG_DOWNLOAD_URL="https://go.dev/dl/go${GOLANG_VERSION}.linux-${ARCH}.tar.gz"
KUBECTL_DOWNLOAD_URL="https://dl.k8s.io/release/v${KUBECTL_VERSION}/bin/linux/${ARCH}/kubectl"

PRIMARY_IF_NAME=$(ip -br link | awk '$1 !~ "lo|vir|wl|lima" { print $1}')

sudo sysctl -w net.ipv4.ip_forward=1
sudo sysctl -w net.ipv6.conf.all.forwarding=1
sudo sysctl -p

sudo modprobe overlay
sudo modprobe br_netfilter

# Default dns settings fails to resolve few dependencies.
# sudo resolvectl dns ${PRIMARY_IF_NAME} 8.8.8.8

sudo apt -y update && sudo apt -y upgrade

sudo apt install -y make curl wget unzip ca-certificates docker.io

sudo DEBIAN_FRONTEND=noninteractive apt -y install \
  python3 python3-pip llvm clang lld lldb \
  build-essential linux-headers-$(uname -r) linux-tools-$(uname -r) \
  linux-tools-common linux-tools-generic tcpdump libbpf-dev \
  bpftrace iproute2 libelf-dev libpcap-dev \
  tshark net-tools python3-scapy jq termshark bear

# Dev tools
sudo apt -y install \
  fzf zoxide bat ripgrep tmux neovim

# Setup Core Dependencies
curl -L ${GOLANG_DOWNLOAD_URL} -o go.tar.xz
sudo rm -rf /usr/local/go
sudo tar -C /usr/local -xzf go.tar.xz
rm go.tar.xz

cat <<EOF | sudo tee /etc/profile.d/env.sh
#!/usr/bin/env bash

export PATH=\$PATH:/usr/local/go/bin
export PATH=\$PATH:~/.local/bin
EOF

#
source /etc/profile.d/env.sh
#

# Setup Tooling
go install "sigs.k8s.io/kind@v${KIND_VERSION}"

sudo usermod ${USER} --append --group docker
newgrp docker

curl -L ${KUBECTL_DOWNLOAD_URL} -o kubectl
chmod +x kubectl && sudo mv kubectl /usr/local/bin

curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash

# Docker packages setup.
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

#
# Add tools apt repositories.
#
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

curl -fsSL "https://pkgs.k8s.io/core:/stable:/v${K8S_VERSION}/deb/Release.key" | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg
echo 'deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v${K8S_VERSION}/deb/ /' | sudo tee /etc/apt/sources.list.d/kubernetes.list

sudo apt -y update
sudo apt -y install docker-buildx-plugin

