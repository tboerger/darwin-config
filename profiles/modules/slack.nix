{ pkgs, lib, config, options, ... }:

let
  cfg = config.my.modules.slack;

in

{
  options = with lib; {
    my = {
      modules = {
        slack = {
          enable = mkEnableOption ''
            Whether to enable slack module
          '';
        };
      };
    };
  };

  config = with lib;
    mkIf cfg.enable {
      homebrew = {
        casks = [
          "slack"
        ];
      };
    };
}
