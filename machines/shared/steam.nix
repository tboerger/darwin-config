{ pkgs, lib, config, options, stdenv, ... }:

let
  cfg = config.my.modules.steam;

in

{
  options = with lib; {
    my = {
      modules = {
        steam = {
          enable = mkEnableOption ''
            Whether to enable steam module
          '';
        };
      };
    };
  };

  config = with lib;
    mkIf cfg.enable (mkMerge [
      (if (stdenv.isDarwin) then {

      } else {
        programs = {
          steam = {
            enable = true;
          };
        };
      })
    ]);
}
