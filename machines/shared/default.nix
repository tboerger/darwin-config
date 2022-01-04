{ config, pkgs, lib, ... }:

{
  imports = [
    ./settings.nix
  ];

  my = {
    modules = { };
  };

  time = {
    timeZone = "Europe/Berlin";
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
      git
      gnumake
      gomplate
      jq
      platinum-searcher
      rsync
      tmux
      tree
      vim
      wget
      yq
    ];
  };

  programs = {
    zsh = {
      enable = true;
    };
  };
}
