{ pkgs, lib, config, options, ... }:

let
  cfg = config.my.modules.blizzard;

in

{
  options = with lib; {
    my = {
      modules = {
        blizzard = {
          enable = mkEnableOption ''
            Whether to enable blizzard module
          '';
        };
      };
    };
  };

  config = with lib;
    mkIf cfg.enable {
      homebrew = {
        casks = [
          "battle-net"
        ];
      };
    };
}
