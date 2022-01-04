{ config, lib, pkgs, ... }:

{
  imports = [
    ./networking.nix
  ];

  my = {
    modules = {
      steam = {
        enable = lib.mkForce false;
      };

      blizzard = {
        enable = lib.mkForce false;
      };

      minecraft = {
        enable = lib.mkForce false;
      };
    };
  };

  system = {
    stateVersion = 4;
  };
}
