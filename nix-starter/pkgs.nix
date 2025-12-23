{ config, pkgs, lib, ... }:

let
  catppuccin = builtins.fetchTarball "https://github.com/catppuccin/nix/archive/main.tar.gz";
in
{
  imports = [
    (import "${catppuccin}/modules/nixos")
  ];

  catppuccin = {
    enable = true;
    cursors.enable = true;
    flavor = "mocha";
  };

  # System Fonts
  fonts = {
    fontDir.enable = true;
    fontconfig = {
      enable = true;
      defaultFonts = {
        serif = ["JetBrainsMono Nerd Font"];
        sansSerif = ["JetBrainsMono Nerd Font"];
        monospace = ["JetBrainsMono Nerd Font Mono"];
        emoji = ["JetBrainsMono Nerd Font"];
      };
    };
    packages = with pkgs; [
      noto-fonts
      fira-code
      fira-code-symbols
      jetbrains-mono
      nerd-fonts.jetbrains-mono
      nerd-fonts.fira-code
      nerd-fonts.fira-mono
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

    stdenv
    tree
    file
    watch
    jq
    yq
    ripgrep
    silver-searcher
    tldr
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

    lima

    clang_18
    llvm_18
    lld_18
    python315
    go
    rustup
    ruby
  ];
}
