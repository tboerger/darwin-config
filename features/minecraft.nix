{ config, pkgs, ... }:

{
  environment = {
    systemPackages = with pkgs; [
      adoptopenjdk-hotspot-bin-8
      mcrcon
      multimc
    ];
  };
}
