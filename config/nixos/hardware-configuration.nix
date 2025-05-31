{ config, lib, pkgs, modulesPath, ... }:

{
  imports = [];

  boot.initrd.availableKernelModules = [ "xhci_pci" "ahci" "nvme" "usbhid" "sr_mod" "usb_storage" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ ];
  boot.extraModulePackages = [ ];

  fileSystems."/" =
    { device = "/dev/disk/by-label/nixos";
      fsType = "ext4";
    };

  # No need for separate home file system on dev VM.
  # fileSystems."/home" =
  #   { device = "/dev/disk/by-label/fristonio";
  #     fsType = "ext4";
  #   };

  fileSystems."/boot" =
    { device = "/dev/disk/by-label/boot";
      fsType = "vfat";
    };

  swapDevices = [];
}
