{ config, lib, pkgs, ... }:

{
  imports = [
    ./partitions.nix
    ./kernel.nix
    ./hardware.nix
    ./networking.nix
  ];

  system = {
    stateVersion = "21.11";
  };
}
