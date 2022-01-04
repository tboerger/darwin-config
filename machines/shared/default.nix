{ config, pkgs, ... }:

{
  imports = [
    ./users.nix
    ./steam.nix
    ./blizzard.nix
    ./minecraft.nix
  ];

  my = {
    modules = {
      users = {
        enable = true;
      };

      steam = {
        enable = false;
      };

      blizzard = {
        enable = false;
      };

      minecraft = {
        enable = false;
      };
    };
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

  time = {
    timeZone = config.my.timeZone;
  };

  i18n = {
    defaultLocale = "en_US.UTF-8";
  };

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
  };

  fonts = {
    fonts = with pkgs; [
      corefonts
      fira-code
      font-awesome
      nerdfonts
      noto-fonts
      noto-fonts-emoji
      noto-fonts-extra
      roboto
      siji
    ];
  };

  environment = {
    systemPackages = with pkgs; [
      gnumake
      jq
      platinum-searcher
      vim
      wget
      yq
      gomplate
      rsync
      tmux
      tree
    ];
  };

  services = {
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

    zsh = {
      enable = true;
    };
  };
}
