{ pkgs, lib, config, options, ... }:

let
  cfg = config.my.modules.itsycal;

in

{
  options = with lib; {
    my = {
      modules = {
        itsycal = {
          enable = mkEnableOption ''
            Whether to enable itsycal module
          '';
        };
      };
    };
  };

  config = with lib;
    mkIf cfg.enable {
      homebrew = {
        casks = [
          "itsycal"
        ];
      };
    };
}
