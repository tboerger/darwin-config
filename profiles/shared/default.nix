{ config, pkgs, ... }:

{
  imports = [
    ./shared.nix
  ];

  my = {
    modules = {
      shared = {
        enable = true;
      };
    };
  };
}
