# From - https://wiki.nixos.org/wiki/Sway

{ config, pkgs, lib, ... }:

{
  users.users.fristonio.extraGroups = [ "video" ];

  programs.light.enable = true;

  environment.systemPackages = with pkgs; [
    rofi
    tuigreet
    obsidian
    flameshot
    vscode
    zed
  ];

  security.polkit.enable = true;
  security.rtkit.enable = true;

  services.dbus.enable = true;
  services.gnome.gnome-keyring.enable = true;

  services.greetd = {
    enable = true;
    settings = rec {
      default_session = {
        command = "${pkgs.tuigreet}/bin/tuigreet --time --cmd sway";
        user = "fristonio";
      };
    };
  };

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  xdg.portal = {
    enable = true;
    wlr.enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };

  programs.waybar.enable = true;
  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true;

    extraPackages = with pkgs; [
      brightnessctl
      grim
      slurp
      wl-clipboard
      mako
      swayidle
      swaylock
      wmenu
      swaybg
    ];
  };
}
