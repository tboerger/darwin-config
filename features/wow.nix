{ config, pkgs, ... }:

{
  environment = {
    systemPackages = with pkgs; [
      winetricks
      wineWowPackages.full
    ];
  };
}
