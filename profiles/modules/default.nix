{ pkgs, lib, config, options, ... }:

{
  imports = [
    ./settings.nix
    ./iterm.nix
    ./kya.nix
    ./blizzard.nix
    ./minecraft.nix
    ./steam.nix
    ./gpg.nix
  ];

  my = {
    modules = {
      iterm = {
        enable = true;
      };

      kya = {
        enable = true;
      };

      blizzard = {
        enable = true;
      };

      minecraft = {
        enable = true;
      };

      steam = {
        enable = true;
      };

      gpg = {
        enable = true;
      };
    };
  };

  programs = {
    zsh = {
      enable = true;
    };
  };
}
