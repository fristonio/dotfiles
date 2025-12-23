{ config, pkgs, lib, ... }:

let
  home-manager = builtins.fetchTarball "https://github.com/nix-community/home-manager/archive/release-25.11.tar.gz";
  catppuccin = builtins.fetchTarball "https://github.com/catppuccin/nix/archive/main.tar.gz";

  homeFilesRef = "./../home";
in
{
  imports = [
    (import "${home-manager}/nixos")
  ];

  home-manager.users.fristonio = {
    imports = [
      (import "${catppuccin}/modules/home-manager")
    ];

    catppuccin = {
      enable = true;
      flavor = "mocha";
    };

    home = {
      file = {
        ".bashrc".source = "${homeFilesRef}/.bashrc";
        ".vimrc".source = "${homeFilesRef}/.vimrc";
        ".gitconfig".source = "${homeFilesRef}/.gitconfig";
        ".tmux.conf".source = "${homeFilesRef}/.tmux.conf";
      };

      username = "fristonio";
      homeDirectory = "/home/fristonio";

      stateVersion = "25.11";
    };

    programs = {
      home-manager.enable = true;

      atuin.enable = true;
      bat.enable = true;
      btop.enable = true;
      delta.enable = true;
      fzf.enable = true;
      eza.enable = true;
      nushell.enable = true;
      zoxide.enable = true;
    };
  };
}
