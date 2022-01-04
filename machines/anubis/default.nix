{ config, lib, pkgs, ... }:

{
  imports = [
    ./networking.nix
  ];

  system = {
    stateVersion = 4;
  };
}
