{ config, lib, pkgs, ... }:

{
  environment = {
    systemPackages = with pkgs; [
      gnumake
      platinum-searcher
      vim
      wget
    ];
  };

  time = {
    timeZone = "Europe/Berlin";
  };

  i18n = {
    defaultLocale = "en_US.UTF-8";
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

    fzf = {
      enable = true;
    };

    jq = {
      enable = true;
    };

    zsh = {
      enable = true;
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

  powerManagement = {
    cpuFreqGovernor = lib.mkDefault "powersave";
  };

  hardware = {
    enableAllFirmware = true;
    enableRedistributableFirmware = true;
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

  nix = {
    package = pkgs.nixFlakes;

    extraOptions = ''
      experimental-features = nix-command flakes
    '';

    binaryCaches = [
      "https://tboerger.cachix.org"
    ];

    binaryCachePublicKeys = [
      "tboerger.cachix.org-1:3Q1gyqgA9NsOshOgknDvc6fhA8gw0PFAf2qs5vJpeLU="
    ];

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

    openssh = {
      enable = true;
      permitRootLogin = "yes";
    };

    haveged = {
      enable = true;
    };
  };
}
