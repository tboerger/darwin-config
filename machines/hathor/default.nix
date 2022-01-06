{ config, lib, pkgs, ... }:

{
  imports = [
    ../modules
  ];

  networking = {
    hostName = "hathor";
    computerName = "hathor";
  };

  system = {
    stateVersion = 4;
  };
}
