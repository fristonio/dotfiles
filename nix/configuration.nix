{ config, pkgs, lib, ... }:

{
  imports =
    [
      # Include the machine specific hardware configuration.
      ./hardware-configuration.nix
      ./pkgs.nix
      ./desktop.nix
    ];

  # Define a user account. Set the password with ‘passwd’.
  users.users.fristonio = {
     isNormalUser = true;
     description = "Deepesh Pathak";
     extraGroups = [
       "wheel"
       "docker"
     ];
     openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIC3Howq3i0T0GG6Oet3HZA6N2C4b+28XLdIwcxuXovj1 fristonio"
    ];
  };

  users.users.guest = {
    isNormalUser = true;
  };

  # Boot Loader configuration
  boot.loader.grub.enable = true;
  boot.loader.grub.useOSProber = true;
  boot.loader.grub.device = "nodev";
  boot.loader.grub.configurationLimit = 3;
  boot.tmp.cleanOnBoot = true;

  boot.loader.efi.canTouchEfiVariables = true;
  # boot.loader.systemd-boot.enable = true;

  time.hardwareClockInLocalTime = true;
  time.timeZone = "America/Vancouver";

  nixpkgs.config.allowUnfree = true;

  networking.hostName = "nix-dev";
  networking.networkmanager.enable = true;
  # Configure DHCP for interfaces if required.
  # networking.useDHCP = false;
  # networking.interfaces.wlo1.useDHCP = true;
  networking.nameservers = ["1.1.1.1", "8.8.8.8"];

  networking.firewall.enable = false;
  # services.nfs.server.enable = true;

  services.openssh.enable = true;
  services.openssh.settings.PasswordAuthentication = false;
  services.openssh.settings.PermitRootLogin = "no";

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  system.stateVersion = "25.11";
}

