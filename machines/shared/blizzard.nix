{ pkgs, lib, config, ... }:

let
  cfg = config.my.modules.blizzard;

in

{
  options = with lib; {
    my = {
      modules = {
        blizzard = {
          enable = mkEnableOption ''
            Whether to enable blizzard module
          '';
        };
      };
    };
  };

  config = with lib;
    mkIf cfg.enable ({
      environment = {
        systemPackages = with pkgs; [
          winetricks
          wineWowPackages.full
        ];
      };
    });
}
