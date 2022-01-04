{ config, lib, pkgs, ... }:

{
  imports = [
    ./partitions.nix
    ./kernel.nix
    ./hardware.nix
    ./networking.nix
  ];

  my = {
    modules = { };
  };

  system = {
    stateVersion = "21.11";
  };
}
