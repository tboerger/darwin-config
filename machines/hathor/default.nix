{ config, lib, pkgs, ... }:

{
  imports = [
    ./networking.nix
  ];

  my = {
    modules = { };
  };

  system = {
    stateVersion = 4;
  };
}
