{ config, pkgs, lib, ... }:

{
  imports = [
    ./users.nix
  ];

  my = {
    modules = {
      users = {
        enable = lib.mkDefault true;
      };
    };
  };

  time = {
    timeZone = config.my.timeZone;
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
    zsh = {
      enable = true;
    };
  };
}
