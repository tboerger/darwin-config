{ pkgs, lib, config, options, ... }:

let
  cfg = config.my.modules.macdown;

in

{
  options = with lib; {
    my = {
      modules = {
        macdown = {
          enable = mkEnableOption ''
            Whether to enable macdown module
          '';
        };
      };
    };
  };

  config = with lib;
    mkIf cfg.enable {
      homebrew = {
        casks = [
          "macdown"
        ];
      };
    };
}
