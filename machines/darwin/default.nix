{ config, pkgs, lib, ... }:

{
  imports = [

  ];

  my = {
    modules = { };
  };

  fonts = {
    enableFontDir = true;
  };

  services = {
    nix-daemon = {
      enable = true;
    };
  };
}
