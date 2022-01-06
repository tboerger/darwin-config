{ config, lib, pkgs, ... }:

{
  imports = [
    ../modules
  ];

  networking = {
    hostName = "osiris";
    computerName = "osiris";
  };

  system = {
    stateVersion = 4;
  };
}
