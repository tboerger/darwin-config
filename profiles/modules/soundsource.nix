{ pkgs, lib, config, options, ... }:

let
  cfg = config.my.modules.soundsource;

in

{
  options = with lib; {
    my = {
      modules = {
        soundsource = {
          enable = mkEnableOption ''
            Whether to enable soundsource module
          '';
        };
      };
    };
  };

  config = with lib;
    mkIf cfg.enable {
      homebrew = {
        casks = [
          "soundsource"
        ];
      };
    };
}
