{ pkgs, lib, config, options, ... }:

let
  cfg = config.my.modules.rectangle;

in

{
  options = with lib; {
    my = {
      modules = {
        rectangle = {
          enable = mkEnableOption ''
            Whether to enable rectangle module
          '';
        };
      };
    };
  };

  config = with lib;
    mkIf cfg.enable {
      homebrew = {
        casks = [
          "rectangle"
        ];
      };
    };
}
