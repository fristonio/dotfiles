{ config, pkgs, lib, ... }:

{
  # System Fonts
  fonts = {
    fontDir.enable = true;
    enableGhostscriptFonts = true;
    fonts = [
      pkgs.powerline-fonts
      pkgs.fira-code
      pkgs.fira-code-symbols
      pkgs.nerdfonts
    ];
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    git
    git-crypt
    curl
    helix
    vim
    neovim
    tmux

    nmap
    inetutils
    tshark
    bind

    home-manager
    stdenv
    tree
    file
    watch
    jq
    yq
    fzf
    bat
    exa
    ripgrep
    zoxide
    unzip

    gcc
    binutils
    cmake
    gnumake
    ctags
    pkg-config
    openssl.dev
    libelf
    zlib
    shellcheck

    clang_18
    llvm_18
    lld_18
    python315
    go
    rustup
    ruby

    htop
    delta
    nushell
    atuin
    tldr
    silver-searcher
  ];
}