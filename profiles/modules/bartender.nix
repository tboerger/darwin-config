{ pkgs, lib, config, options, ... }:

let
  cfg = config.my.modules.bartender;

in

{
  options = with lib; {
    my = {
      modules = {
        bartender = {
          enable = mkEnableOption ''
            Whether to enable bartender module
          '';
        };
      };
    };
  };

  config = with lib;
    mkIf cfg.enable {
      homebrew = {
        casks = [
          "bartender"
        ];
      };
    };
}
