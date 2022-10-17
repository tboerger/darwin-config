{ pkgs, lib, config, options, ... }:
with lib;

let
  cfg = config.profile.programs.blizzard;

in

{
  options = {
    profile = {
      programs = {
        blizzard = {
          enable = mkEnableOption "Blizzard" // {
            default = true;
          };
        };
      };
    };
  };

  config = mkIf cfg.enable {
    homebrew = {
      casks = [
        "battle-net"
      ];
    };
  };
}
