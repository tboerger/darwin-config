{ pkgs, lib, config, options, ... }:

let
  cfg = config.my.modules.teams;

in

{
  options = with lib; {
    my = {
      modules = {
        teams = {
          enable = mkEnableOption ''
            Whether to enable teams module
          '';
        };
      };
    };
  };

  config = with lib;
    mkIf cfg.enable {
      homebrew = {
        casks = [
          "microsoft-teams"
        ];
      };
    };
}
