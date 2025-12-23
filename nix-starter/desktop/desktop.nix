# From - https://wiki.nixos.org/wiki/Sway

{ config, pkgs, lib, ... }:

let
  home-manager = builtins.fetchTarball "https://github.com/nix-community/home-manager/archive/release-25.11.tar.gz";
in
{
  imports = [
    (import "${home-manager}/nixos")
  ];

  hardware.graphics.enable = true;

  security.polkit.enable = true;
  security.pam.services.swaylock = {};

  services.dbus.enable = true;
  users.users.fristonio.extraGroups = [ "video" "input" ];

  home-manager.users.fristonio = {
    home = {
      packages = with pkgs; [
        ghostty
        google-chrome
        obsidian
        flameshot
        vscode
        zed
      ];

      sessionVariables = {
        NIXOS_OZONE_WL = "1";
      };
    };

    xdg.configFile = {
      "sway/custom-config".text = builtins.readFile ./config/sway-config.in;
      "waybar/config".text = builtins.readFile ./config/waybar-config.jsonc;
    };

    programs = {
      rofi.enable = true;
      waybar = {
        enable = true;
        style = ''
            * {
              color: @text;
            }

            window#waybar {
              background-color: shade(@base, 0.9);
              border: 2px solid alpha(@crust, 0.3);
            }
          '';
      };
    };

    wayland.windowManager.sway = {
      enable = true;
      wrapperFeatures.gtk = true;
      config = null;
      extraConfigEarly = "include custom-config";
    };
  };
}
