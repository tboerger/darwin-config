{ config, pkgs, ... }:

{
  imports = [

  ];

  my = {
    modules = { };
  };

  services = {
    nix-daemon = {
      enable = true;
    };
  };
}
