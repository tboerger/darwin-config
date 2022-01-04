{ config, pkgs, ... }:

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
