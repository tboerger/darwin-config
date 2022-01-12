{ pkgs, lib, config, options, ... }:

let
  cfg = config.my.modules.discord;

in

{
  options = with lib; {
    my = {
      modules = {
        discord = {
          enable = mkEnableOption ''
            Whether to enable discord module
          '';
        };
      };
    };
  };

  config = with lib;
    mkIf cfg.enable {
      homebrew = {
        casks = [
          "discord"
        ];
      };
    };
}
