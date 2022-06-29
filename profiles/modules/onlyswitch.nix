{ pkgs, lib, config, options, ... }:

let
  cfg = config.my.modules.onlyswitch;

in

{
  options = with lib; {
    my = {
      modules = {
        onlyswitch = {
          enable = mkEnableOption ''
            Whether to enable onlyswitch module
          '';
        };
      };
    };
  };

  config = with lib;
    mkIf cfg.enable {
      homebrew = {
        casks = [
          "only-switch"
        ];
      };
    };
}
