{ pkgs, lib, config, options, ... }:

let
  cfg = config.my.modules.element;

in

{
  options = with lib; {
    my = {
      modules = {
        element = {
          enable = mkEnableOption ''
            Whether to enable element module
          '';
        };
      };
    };
  };

  config = with lib;
    mkIf cfg.enable {
      homebrew = {
        casks = [
          "element"
        ];
      };
    };
}
