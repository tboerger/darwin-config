{ pkgs, lib, config, options, ... }:

let
  cfg = config.my.modules.alfred;

in

{
  options = with lib; {
    my = {
      modules = {
        alfred = {
          enable = mkEnableOption ''
            Whether to enable alfred module
          '';
        };
      };
    };
  };

  config = with lib;
    mkIf cfg.enable {
      homebrew = {
        casks = [
          "alfred"
        ];
      };
    };
}
