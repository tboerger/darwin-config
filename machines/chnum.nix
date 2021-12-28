{ config, lib, pkgs, modulesPath, ... }:

{
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")

    ../features/common.nix
    ../features/desktop.nix
    ../features/docker.nix
    ../features/fonts.nix
    ../features/libvirt.nix
    ../features/minecraft.nix
    ../features/networking.nix
    ../features/steam.nix
    ../features/wow.nix
    ../features/xserver.nix
  ];

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/1ee03663-a524-4163-9c15-e721b3560d62";
    fsType = "ext4";
    options = [
      "noatime"
      "discard"
    ];
  };

  fileSystems."/home" = {
    device = "/dev/disk/by-uuid/e32df710-9bbf-4067-a62b-716ef0c1cccc";
    fsType = "ext4";
    options = [
      "noatime"
      "discard"
    ];
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/F751-95AC";
    fsType = "vfat";
  };

  swapDevices = [{
    device = "/dev/disk/by-uuid/ddc580e7-7a54-4715-a1e8-ff406f948798";
  }];

  boot = {
    kernelModules = [
      "kvm-intel"
    ];

    initrd = {
      availableKernelModules = [
        "xhci_pci"
        "ahci"
        "usb_storage"
        "sd_mod"
        "rtsx_pci_sdmmc"
      ];

      kernelModules = [
        "dm-snapshot"
      ];
    };
  };

  hardware = {
    cpu = {
      intel = {
        updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
      };
    };

    video = {
      hidpi = {
        enable = lib.mkDefault true;
      };
    };
  };

  networking = {
    hostName = "chnum";
  };

  users = {
    users = {
      root = {
        shell = pkgs.zsh;
        hashedPassword = "$6$yuwsoikF5utqohar$fdcvq0iXdmiioiRyBGeVZICzQm4nKlv6.pj9AWh13VRCsE07dN9StDnXV0aslIBb0SWRFC4dY5Um2MYiAMfmH0";
        openssh = {
          authorizedKeys = {
            keys = [
              "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINaQYR0/Oj6k1H03kshz2J7rlGCaDSuaGPhhOs9FcZfn thomas@osiris"
            ];
          };
        };
      };
    };
  };

  system = {
    stateVersion = "21.11";
  };
}
