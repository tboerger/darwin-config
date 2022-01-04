{ config, pkgs, lib, ... }:

{
  imports = [
    ./users.nix
    ./docker.nix
    ./libvirt.nix
    ./i3wm.nix
    ./desktop.nix
    ./steam.nix
    ./blizzard.nix
    ./minecraft.nix
  ];

  my = {
    modules = {
      users = {
        enable = lib.mkDefault true;
      };

      docker = {
        enable = lib.mkDefault true;
      };

      libvirt = {
        enable = lib.mkDefault true;
      };

      i3wm = {
        enable = lib.mkDefault true;
      };

      desktop = {
        enable = lib.mkDefault true;
      };

      steam = {
        enable = lib.mkDefault false;
      };

      blizzard = {
        enable = lib.mkDefault false;
      };

      minecraft = {
        enable = lib.mkDefault false;
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

  security = {
    sudo = {
      wheelNeedsPassword = false;
    };
  };

  users = {
    defaultUserShell = pkgs.zsh;
    mutableUsers = false;
  };

  services = {
    timesyncd = {
      enable = true;
    };

    haveged = {
      enable = true;
    };

    openssh = {
      enable = true;
      permitRootLogin = "yes";
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
