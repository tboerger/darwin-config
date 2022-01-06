{ config, lib, pkgs, ... }:

{
  imports = [
    ../modules
  ];

  networking = {
    hostName = "anubis";
    computerName = "anubis";
  };

  system = {
    stateVersion = 4;
  };
}
