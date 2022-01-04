{ config, pkgs, ... }:

{
  imports = [
    ./docker.nix
    ./libvirt.nix
    ./i3wm.nix
    ./desktop.nix
  ];

  my = {
    modules = {
      docker = {
        enable = true;
      };

      libvirt = {
        enable = true;
      };

      i3wm = {
        enable = true;
      };

      desktop = {
        enable = true;
      };
    };
  };

  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
    cleanTmpDir = true;

    loader = {
      efi = {
        canTouchEfiVariables = true;
      };

      systemd-boot = {
        enable = true;
        consoleMode = "2";
        editor = false;
      };
    };
  };

  fonts = {
    enableDefaultFonts = true;

    fontDir = {
      enable = true;
    };
  };

  services = {
    timesyncd = {
      enable = true;
    };

    haveged = {
      enable = true;
    };
  };
}
