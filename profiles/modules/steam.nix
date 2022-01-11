{ pkgs, lib, config, options, ... }:

let
  cfg = config.my.modules.steam;

in

{
  options = with lib; {
    my = {
      modules = {
        steam = {
          enable = mkEnableOption ''
            Whether to enable steam module
          '';
        };
      };
    };
  };

  config = with lib;
    mkIf cfg.enable {
      homebrew = {
        casks = [
          "steam"
        ];
      };
    };
}
