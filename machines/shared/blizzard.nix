{ pkgs, lib, config, options, stdenv, ... }:

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
    mkIf cfg.enable (mkMerge [
      (if (stdenv.isDarwin) then {

      } else {
        environment = {
          systemPackages = with pkgs; [
            winetricks
            wineWowPackages.full
          ];
        };
      })
    ]);
}
