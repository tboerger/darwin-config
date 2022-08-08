{ pkgs, lib, config, options, ... }:

let
  cfg = config.my.modules.clockify;

in

{
  options = with lib; {
    my = {
      modules = {
        clockify = {
          enable = mkEnableOption ''
            Whether to enable clockify module
          '';
        };
      };
    };
  };

  config = with lib;
    mkIf cfg.enable {
      homebrew = {
        casks = [
          "clockify"
        ];
      };
    };
}
