{ pkgs, lib, config, options, ... }:

let
  cfg = config.my.modules.signal;

in

{
  options = with lib; {
    my = {
      modules = {
        signal = {
          enable = mkEnableOption ''
            Whether to enable signal module
          '';
        };
      };
    };
  };

  config = with lib;
    mkIf cfg.enable {
      homebrew = {
        casks = [
          "signal"
        ];
      };
    };
}
