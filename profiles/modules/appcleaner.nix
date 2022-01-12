{ pkgs, lib, config, options, ... }:

let
  cfg = config.my.modules.appcleaner;

in

{
  options = with lib; {
    my = {
      modules = {
        appcleaner = {
          enable = mkEnableOption ''
            Whether to enable appcleaner module
          '';
        };
      };
    };
  };

  config = with lib;
    mkIf cfg.enable {
      homebrew = {
        casks = [
          "appcleaner"
        ];
      };
    };
}
