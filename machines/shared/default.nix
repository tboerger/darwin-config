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
