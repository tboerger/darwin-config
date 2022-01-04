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

  hardware = {
    enableAllFirmware = true;
    enableRedistributableFirmware = true;
  };

  fonts = {
    enableDefaultFonts = true;

    fontDir = {
      enable = true;
    };
  };

  i18n = {
    defaultLocale = "en_US.UTF-8";
  };

  nix = {
    gc = {
      automatic = true;
      persistent = true;
      dates = "weekly";
      options = "--delete-older-than 2w";
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

  programs = {
    iftop = {
      enable = true;
    };

    iotop = {
      enable = true;
    };

    mtr = {
      enable = true;
    };
  };
}
